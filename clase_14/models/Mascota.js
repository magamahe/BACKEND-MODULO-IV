import mongoose from "mongoose";

const mascotaSchema = new mongoose.Schema({
  nombre: { type: String, required: true },
  especie: { type: String, required: true },
  raza: String,
  edad: Number,
  duenio: { type: mongoose.Schema.Types.ObjectId, ref: "Cliente" }
}, { timestamps: true });

export default mongoose.model("Mascota", mascotaSchema);