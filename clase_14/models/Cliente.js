import mongoose from "mongoose";

const clienteSchema = new mongoose.Schema({
  nombre: { type: String, required: true },
  telefono: String,
  direccion: String
}, { timestamps: true });

export default mongoose.model("Cliente", clienteSchema);