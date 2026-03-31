const express = require("express");
const cors = require("cors");
const connectDB = require("./database");
require("dotenv").config();

const app = express();
const PORT = process.env.PORT || 5000;

// Conexión a DB
connectDB();

// Middlewares
app.use(cors());
app.use(express.json());

// Rutas
app.use("/api/clientes", require("./routes/clienteRoutes"));
app.use("/api/citas", require("./routes/citaRoutes"));

app.get("/", (req, res) => {
    res.send("Bienvenidas al Centro Estético API 💅");
});

app.listen(PORT, () => {
    console.log(`🚀 Servidor corriendo en http://localhost:${PORT}`);
});