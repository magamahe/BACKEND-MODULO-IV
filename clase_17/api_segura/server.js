require("dotenv").config();
const express = require("express");
const crypto = require("crypto");
const jwt = require("jsonwebtoken");
const rateLimit = require("express-rate-limit");
const winston = require("winston");
const morgan = require("morgan");
const fs = require("fs");
const path = require("path");
const helmet = require("helmet");

const app = express();

//Seguridad headers HTTP
app.use(helmet());

// JSON
app.use(express.json());

// Morgan (logs HTTP)
const accessLogStream = fs.createWriteStream(
  path.join(__dirname, "access.log"),
  { flags: "a" }
);
app.use(morgan("combined", { stream: accessLogStream }));

// Winston (logs app)
const logger = winston.createLogger({
  level: "info",
  transports: [
    new winston.transports.File({ filename: "error.log", level: "error" }),
    new winston.transports.File({ filename: "combined.log" })
  ]
});

// Usuario fake
const usuarioDB = {
  username: process.env.ADMIN_USER,
  password: process.env.ADMIN_PASS
};

//Comparación segura (Timing Attack)
function compararSeguro(a, b) {
  const bufferA = Buffer.from(a);
  const bufferB = Buffer.from(b);

  if (bufferA.length !== bufferB.length) {
    return false;
  }

  return crypto.timingSafeEqual(bufferA, bufferB);
}

// Rate limit
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 5,
  message: "Demasiados intentos, intenta más tarde"
});

app.use("/login", limiter);

// LOGIN → devuelve JWT
app.post("/login", (req, res) => {
  const { username, password } = req.body;

  if (username !== usuarioDB.username) {
    logger.error(`Usuario incorrecto: ${username}`);
    return res.status(401).json({ mensaje: "Credenciales inválidas" });
  }

  const passwordValida = compararSeguro(password, usuarioDB.password);

  if (!passwordValida) {
    logger.error(`Password incorrecta: ${username}`);
    return res.status(401).json({ mensaje: "Credenciales inválidas" });
  }

  // Generar token
  const token = jwt.sign(
    { username },
    process.env.JWT_SECRET,
    { expiresIn: "1h" }
  );

  logger.info(`Login exitoso: ${username}`);

  res.json({
    mensaje: "Login exitoso",
    token
  });
});

// Middleware de autenticación
function verificarToken(req, res, next) {
  const authHeader = req.headers["authorization"];

  if (!authHeader) {
    return res.status(403).json({ mensaje: "Token requerido" });
  }

  const token = authHeader.split(" ")[1];

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.usuario = decoded;
    next();
  } catch (error) {
    return res.status(401).json({ mensaje: "Token inválido" });
  }
}

// Ruta protegida
app.get("/datos-seguros", verificarToken, (req, res) => {
  res.json({
    mensaje: "Datos protegidos 🔐",
    usuario: req.usuario
  });
});

app.listen(process.env.PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${process.env.PORT}`);
});