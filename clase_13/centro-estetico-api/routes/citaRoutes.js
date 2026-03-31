const express = require("express");
const router = express.Router();
const Cita = require("../models/Cita");

// Obtener todas las citas (con datos del cliente)
router.get("/", async (req, res) => {
    try {
        const citas = await Cita.find().populate("cliente");
        res.json(citas);
    } catch (error) {
        res.status(500).json({ mensaje: "Error al obtener citas", error });
    }
});

// Crear una nueva cita
router.post("/", async (req, res) => {
    try {
        const nuevaCita = new Cita(req.body);
        await nuevaCita.save();
        res.status(201).json(nuevaCita);
    } catch (error) {
        res.status(400).json({ mensaje: "Error al crear cita", error });
    }
});

module.exports = router;