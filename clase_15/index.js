import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import helmet from "helmet";
import mongoSanitize from "express-mongo-sanitize";

import { connectDB } from "./database.js";

import platosRoutes from "./routes/platos.js";
import clientesRoutes from "./routes/clientes.js";
import pedidosRoutes from "./routes/pedidos.js";

dotenv.config();

const app = express();

// 🔐 Seguridad
app.use(helmet());
app.use(mongoSanitize());
app.use(cors({
  origin: "http://localhost:3000"
}));

// Middleware
app.use(express.json());

// DB
connectDB();

// Rutas
app.use("/api/platos", platosRoutes);
app.use("/api/clientes", clientesRoutes);
app.use("/api/pedidos", pedidosRoutes);

app.listen(process.env.PORT, () => {
  console.log(`🚀 Servidor en puerto ${process.env.PORT}`);
});