const mongoose = require("mongoose");

const CitaSchema = new mongoose.Schema({
  // Aquí vinculamos con el ID del Cliente
  cliente: { 
    type: mongoose.Schema.Types.ObjectId, 
    ref: "Cliente", 
    required: true 
  },
  fecha: { type: Date, required: true },
  servicio: { type: String, required: true }
});

module.exports = mongoose.model("Cita", CitaSchema);