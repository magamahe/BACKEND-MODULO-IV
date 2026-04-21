const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('api_sequelize', 'root', 'root123', {
  host: 'localhost',
  dialect: 'mysql'
});

// probar conexión
const conectarDB = async () => {
  try {
    await sequelize.authenticate();
    console.log('✅ Conexión a la base de datos exitosa');
  } catch (error) {
    console.error('❌ Error de conexión:', error);
  }
};

module.exports = { sequelize, conectarDB };