import { body, validationResult } from "express-validator";
import Plato from "../models/Plato.js";

const router = express.Router();

// GET
router.get("/", async (req, res) => {
  const platos = await Plato.find();
  res.json(platos);
});

// POST con validación 🔥
router.post(
  "/",
  [
    body("nombre").notEmpty(),
    body("precio").isNumeric()
  ],
  async (req, res) => {
    const errores = validationResult(req);
    if (!errores.isEmpty()) {
      return res.status(400).json({ errores: errores.array() });
    }

    try {
      const plato = new Plato(req.body);
      const saved = await plato.save();
      res.status(201).json(saved);
    } catch (error) {
      res.status(500).json({ error: "Error al crear plato" });
    }
  }
);

export default router;