import express from "express";
import dotenv from "dotenv";
import cors from "cors";

import { connectDB } from "./database.js";
import mascotasRoutes from "./routes/mascotas.js";
import clientesRoutes from "./routes/clientes.js";

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

connectDB();

app.use("/api/mascotas", mascotasRoutes);
app.use("/api/clientes", clientesRoutes);

app.listen(process.env.PORT, () => {
  console.log(`🚀 Servidor en puerto ${process.env.PORT}`);
});