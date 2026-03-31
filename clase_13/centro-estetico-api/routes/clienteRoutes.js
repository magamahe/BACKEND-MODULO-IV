const express = require("express");
const router = express.Router();
const Cliente = require("../models/Cliente");

// Obtener todos los clientes
router.get("/", async (req, res) => {
    try {
        const clientes = await Cliente.find();
        res.json(clientes);
    } catch (error) {
        res.status(500).json({ mensaje: "Error al obtener clientes", error });
    }
});

// Crear un nuevo cliente
router.post("/", async (req, res) => {
    try {
        console.log(req.body); // <-- Esto te mostrará en la terminal de VS Code qué está llegando
        const cliente = new Cliente(req.body);
        await cliente.save();
        res.status(201).json(cliente);
    } catch (error) {
        // Cambia esto para ver el mensaje real en Postman:
        res.status(400).json({ mensaje: error.message }); 
    }
});

// Eliminar un cliente por ID
router.delete("/:id", async (req, res) => {
    try {
        await Cliente.findByIdAndDelete(req.params.id);
        res.json({ mensaje: "Cliente eliminado correctamente" });
    } catch (error) {
        res.status(500).json({ mensaje: "Error al eliminar", error: error.message });
    }
});
module.exports = router;