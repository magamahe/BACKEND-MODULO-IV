const mongoose = require("mongoose");
require("dotenv").config(); // Esto carga lo que pusiste en el .env

const connectDB = async () => {
  try {
    // Aquí llamamos a la variable MONGO_URI del archivo .env
    await mongoose.connect(process.env.MONGO_URI); 
    
    console.log("✅ Conectado a MongoDB Atlas");
  } catch (error) {
    console.error("❌ Error al conectar a la base de datos:", error.message);
    process.exit(1); // Detiene la app si falla la conexión
  }
};

module.exports = connectDB;