# 🐾 Refugio de Animales - Seguridad en Node.js

##  Descripción
Este proyecto demuestra cómo mejorar la seguridad de un sistema de autenticación paso a paso en Node.js.

---

##  1. Base de Datos Insegura
Las contraseñas se almacenan en texto plano.

❌ Riesgo:
- Si se filtra la base de datos, todas las contraseñas quedan expuestas.

---

##  2. Ataque de Fuerza Bruta
Se prueban múltiples combinaciones hasta encontrar la contraseña correcta.

✔ Resultado:
- Se logra descubrir la contraseña rápidamente.

---

##  3. Protección contra Fuerza Bruta
Se limita a 5 intentos fallidos por usuario.

✔ Mejora:
- Se bloquea la cuenta, evitando ataques automatizados.

---

##  4. Ataque de Diccionario
Se utilizan listas de contraseñas comunes.

✔ Resultado:
- Más rápido que fuerza bruta.

---

##  5. Hash + Salt (bcrypt)
Las contraseñas se almacenan como hashes.

✔ Mejora:
- No se pueden leer las contraseñas reales.

---

##  6. Ataque Rainbow Table
Se demuestra que hashes sin sal (MD5) son vulnerables.

❌ Problema:
- Se pueden descifrar fácilmente con bases públicas.

---

##  7. Salt + Pepper
Se agrega una clave secreta (pepper) desde variables de entorno.

✔ Mejora:
- Aumenta significativamente la seguridad.

---

##  Instalación

```bash
npm install