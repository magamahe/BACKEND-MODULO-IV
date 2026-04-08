import express from "express";
import Pedido from "../models/Pedido.js";

const router = express.Router();

// GET con populate 🔥
router.get("/", async (req, res) => {
  const pedidos = await Pedido.find()
    .populate("cliente")
    .populate("platos");

  res.json(pedidos);
});

// POST
router.post("/", async (req, res) => {
  try {
    const pedido = new Pedido(req.body);
    const saved = await pedido.save();
    res.status(201).json(saved);
  } catch {
    res.status(500).json({ error: "Error al crear pedido" });
  }
});

export default router;