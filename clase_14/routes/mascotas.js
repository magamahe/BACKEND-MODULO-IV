import express from "express";
import Mascota from "../models/Mascota.js";

const router = express.Router();

// Crear mascota
router.post("/", async (req, res) => {
  const mascota = new Mascota(req.body);
  const saved = await mascota.save();
  res.json(saved);
});

// Obtener mascotas (con dueño)
router.get("/", async (req, res) => {
  const mascotas = await Mascota.find().populate("duenio");
  res.json(mascotas);
});

// Actualizar
router.put("/:id", async (req, res) => {
  const updated = await Mascota.findByIdAndUpdate(req.params.id, req.body, { new: true });
  res.json(updated);
});

// Eliminar
router.delete("/:id", async (req, res) => {
  await Mascota.findByIdAndDelete(req.params.id);
  res.json({ mensaje: "Mascota eliminada" });
});

export default router;