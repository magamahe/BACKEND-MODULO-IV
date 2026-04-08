import mongoose from "mongoose";

const platoSchema = new mongoose.Schema({
  nombre: { type: String, required: true },
  precio: { type: Number, required: true },
  categoria: String
}, { timestamps: true });

export default mongoose.model("Plato", platoSchema);