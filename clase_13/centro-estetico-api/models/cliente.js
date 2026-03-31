const mongoose = require("mongoose");

const ClienteSchema = new mongoose.Schema({
    nombre: { 
        type: String, 
        required: [true, "El nombre es obligatorio"] 
    },
    email: { 
        type: String, 
        required: [true, "El email es obligatorio"], 
        unique: true 
    },
    telefono: { 
        type: String, 
        required: [true, "El teléfono es obligatorio"] 
    }
});

// Esta es la línea que le faltaba a tu código para reconocer 'Cliente'
module.exports = mongoose.model("Cliente", ClienteSchema);