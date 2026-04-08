import mongoose from "mongoose";

const clienteSchema = new mongoose.Schema({
  nombre: { type: String, required: true },
  telefono: String,
  vip: { type: Boolean, default: false }
}, { timestamps: true });

export default mongoose.model("Cliente", clienteSchema);