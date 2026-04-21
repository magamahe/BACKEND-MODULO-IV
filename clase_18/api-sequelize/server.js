const express = require('express');
const { sequelize, conectarDB } = require('./config/database');
const usuarioRoutes = require('./routes/usuarioRoutes');

const app = express();

// middleware
app.use(express.json());

// rutas
app.use('/usuarios', usuarioRoutes);

// conectar DB y levantar servidor
const PORT = 3000;

const iniciarServidor = async () => {
  await conectarDB();
  await sequelize.sync(); // crea tablas

  app.listen(PORT, () => {
    console.log(`🚀 Servidor corriendo en http://localhost:${PORT}`);
  });
};

iniciarServidor();