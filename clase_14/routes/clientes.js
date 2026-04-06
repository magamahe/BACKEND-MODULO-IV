import express from "express";
import Cliente from "../models/cliente.js";

const router = express.Router();

// Crear cliente
router.post("/", async (req, res) => {
  const cliente = new Cliente(req.body);
  const saved = await cliente.save();
  res.json(saved);
});

// Obtener clientes
router.get("/", async (req, res) => {
  const clientes = await Cliente.find();
  res.json(clientes);
});

// Actualizar
router.put("/:id", async (req, res) => {
  const updated = await Cliente.findByIdAndUpdate(req.params.id, req.body, { new: true });
  res.json(updated);
});

// Eliminar
router.delete("/:id", async (req, res) => {
  await Cliente.findByIdAndDelete(req.params.id);
  res.json({ mensaje: "Cliente eliminado" });
});

export default router;