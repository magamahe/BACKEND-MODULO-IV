// =======================
// IMPORTS
// =======================
const fs = require("fs");
const bcrypt = require("bcrypt");
const crypto = require("crypto");
require("dotenv").config();

// =======================
// 1. BASE DE DATOS INSEGURA
// =======================
const usuarios = [
  { usuario: "admin", password: "gatito123" },
  { usuario: "voluntaria", password: "perrito456" }
];

console.log("\n=== BASE DE DATOS INSEGURA ===");
console.log(usuarios);

// =======================
// 2. ATAQUE FUERZA BRUTA
// =======================
console.log("\n=== ATAQUE FUERZA BRUTA ===");

const posiblesPasswords = ["123456", "admin", "password", "gatito123"];

const passwordReal = usuarios.find(u => u.usuario === "admin").password;

for (let intento of posiblesPasswords) {
  if (intento === passwordReal) {
    console.log("Contraseña encontrada:", intento);
    break;
  }
}

// =======================
// 3. PROTECCIÓN FUERZA BRUTA
// =======================
console.log("\n=== PROTECCIÓN FUERZA BRUTA ===");

let intentosFallidos = {};

function login(usuario, password) {
  if (!intentosFallidos[usuario]) {
    intentosFallidos[usuario] = 0;
  }

  if (intentosFallidos[usuario] >= 5) {
    console.log("Cuenta bloqueada:", usuario);
    return;
  }

  const user = usuarios.find(u => u.usuario === usuario);

  if (user && user.password === password) {
    console.log("Login exitoso:", usuario);
    intentosFallidos[usuario] = 0;
  } else {
    intentosFallidos[usuario]++;
    console.log("Error:", usuario, "| Intentos:", intentosFallidos[usuario]);
  }
}

// Simulación
login("admin", "123");
login("admin", "123");
login("admin", "123");
login("admin", "123");
login("admin", "123");
login("admin", "123");

// =======================
// 4. ATAQUE DICCIONARIO
// =======================
console.log("\n=== ATAQUE DICCIONARIO ===");

const diccionario = fs.readFileSync("diccionario.txt", "utf-8").split("\n");

for (let intento of diccionario) {
  if (intento.trim() === passwordReal) {
    console.log("Contraseña encontrada con diccionario:", intento);
    break;
  }
}

// =======================
// 5. HASH + SAL (BCRYPT)
// =======================
console.log("\n=== HASH + SAL ===");

const usuariosSeguros = usuarios.map(user => {
  const salt = bcrypt.genSaltSync(10);
  const hash = bcrypt.hashSync(user.password, salt);

  return {
    usuario: user.usuario,
    password: hash
  };
});

console.log(usuariosSeguros);

// =======================
// 6. ATAQUE RAINBOW
// =======================
console.log("\n=== ATAQUE RAINBOW (MD5) ===");

function hashRapido(password) {
  return crypto.createHash("md5").update(password).digest("hex");
}

const hash = hashRapido("gatito123");
console.log("Hash sin sal:", hash);

// =======================
// 7. SAL + PIMIENTA
// =======================
console.log("\n=== HASH CON SAL + PIMIENTA ===");

const PEPPER = process.env.PEPPER;

const usuariosUltraSeguros = usuarios.map(user => {
  const salt = bcrypt.genSaltSync(10);
  const passwordConPepper = user.password + PEPPER;
  const hash = bcrypt.hashSync(passwordConPepper, salt);

  return {
    usuario: user.usuario,
    password: hash
  };
});

console.log(usuariosUltraSeguros);
