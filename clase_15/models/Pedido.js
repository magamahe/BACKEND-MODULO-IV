import mongoose from "mongoose";

const pedidoSchema = new mongoose.Schema({
  cliente: { type: mongoose.Schema.Types.ObjectId, ref: "Cliente" },
  platos: [{ type: mongoose.Schema.Types.ObjectId, ref: "Plato" }],
  total: Number,
  fecha: { type: Date, default: Date.now }
}, { timestamps: true });

export default mongoose.model("Pedido", pedidoSchema);