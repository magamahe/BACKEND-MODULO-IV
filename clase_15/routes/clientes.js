import express from "express";
import { body, validationResult } from "express-validator";
import Cliente from "../models/Cliente.js";

const router = express.Router();

router.get("/", async (req, res) => {
  const clientes = await Cliente.find();
  res.json(clientes);
});

router.post(
  "/",
  [
    body("nombre").notEmpty(),
    body("telefono").isLength({ min: 6 })
  ],
  async (req, res) => {
    const errores = validationResult(req);
    if (!errores.isEmpty()) {
      return res.status(400).json({ errores: errores.array() });
    }

    try {
      const cliente = new Cliente(req.body);
      const saved = await cliente.save();
      res.status(201).json(saved);
    } catch {
      res.status(500).json({ error: "Error al crear cliente" });
    }
  }
);

export default router;