const express = require('express');
const router = express.Router();
const Usuario = require('../models/Usuario');

// 👉 Crear usuario
router.post('/', async (req, res) => {
  try {
    const usuario = await Usuario.create(req.body);
    res.json(usuario);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// 👉 Obtener todos
router.get('/', async (req, res) => {
  const usuarios = await Usuario.findAll();
  res.json(usuarios);
});

// 👉 Obtener por ID
router.get('/:id', async (req, res) => {
  const usuario = await Usuario.findByPk(req.params.id);

  if (!usuario) {
    return res.status(404).json({ mensaje: 'Usuario no encontrado' });
  }

  res.json(usuario);
});

// 👉 Actualizar
router.put('/:id', async (req, res) => {
  const usuario = await Usuario.findByPk(req.params.id);

  if (!usuario) {
    return res.status(404).json({ mensaje: 'Usuario no encontrado' });
  }

  await usuario.update(req.body);
  res.json(usuario);
});

// 👉 Eliminar
router.delete('/:id', async (req, res) => {
  const usuario = await Usuario.findByPk(req.params.id);

  if (!usuario) {
    return res.status(404).json({ mensaje: 'Usuario no encontrado' });
  }

  await usuario.destroy();
  res.json({ mensaje: 'Usuario eliminado' });
});

module.exports = router;