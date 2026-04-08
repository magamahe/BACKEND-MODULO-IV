# RESPONDER: 

## 2. Prevención de ataques comunes

### a) ¿Cómo podría un atacante hacer Phishing a un usuario del restaurante?

Un atacante podría:

- Enviar un email falso simulando ser el restaurante (ej: “confirmación de reserva”)
- Crear una página web clonada del restaurante
- Pedir datos como:
  - usuario
  - contraseña
  - datos de pago

👉 El usuario cree que es real y entrega su información.

Ejemplo:
Un cliente recibe un mail:

“Tu reserva fue cancelada, ingresá acá para confirmar nuevamente”

Hace clic → entra a una web falsa → roba sus datos.

### b) ¿Qué problemas puede causar una inyección de código en MongoDB?

Esto se conoce como NoSQL Injection.

Un atacante podría:

- Saltar el login (bypass de autenticación)
- Acceder a datos sensibles (clientes, pedidos)
- Borrar información
- Modificar datos (ej: cambiar precios)

Ejemplo típico:
Si no validás el input:

```bash
{ "usuario": { "$ne": null }, 
"password": { "$ne": null } }
```
👉 MongoDB lo interpreta como “cualquier usuario”
👉 Resultado: acceso sin contraseña 

### c) ¿Cómo afecta la falta de validación de datos en una API?

Si no validás datos:

- Se pueden enviar datos maliciosos
- Se rompen consultas a la base de datos
- Se habilitan ataques (XSS, Injection)
- Se compromete la integridad del sistema

👉 Ejemplo:
Un campo precio recibe texto o código → puede romper la lógica o ejecutar algo no esperado.

## 3. Implementación de seguridad en el servidor
### a) ¿Qué hace helmet() en una API?

helmet() es un middleware de Node.js (Express) que:

- Configura headers HTTP de seguridad automáticamente
Protege la API contra ataques comunes

- Básicamente: refuerza la seguridad sin que tengas que hacerlo manual.

### b)¿Cómo protege contra XSS y Clickjacking?
✔️ Contra XSS (Cross-Site Scripting)
Usa headers como:
```bash
Content-Security-Policy (CSP)
```

👉 Evita que se ejecuten scripts maliciosos inyectados.

✔️ Contra Clickjacking
Usa:
```bash
X-Frame-Options
```

👉 Evita que tu web se cargue dentro de un iframe malicioso.

## 4. Evaluación de vulnerabilidades en Node.js
### a) ¿Qué hace npm audit?
```bash
npm audit
```

- Analiza las dependencias del proyecto
- Detecta vulnerabilidades conocidas
- Muestra:
  - nivel de riesgo (low, moderate, high, critical)
  - paquete afectado
  - solución sugerida

Es como un “scanner de seguridad” para tu proyecto.

### b)¿Cómo se corrigen vulnerabilidades?
✔️ Forma automática:
```bash
npm audit fix
```
👉 Actualiza dependencias seguras automáticamente.

✔️ Forma forzada (con cuidado):
```bash
npm audit fix --force
```
👉 Puede romper el proyecto (cambia versiones grandes)

✔️ Forma manual:
- Revisar el paquete vulnerable
 - Actualizarlo:
```bash
npm install nombre-paquete@latest
```

✔️ Buenas prácticas:
- Mantener dependencias actualizadas
- Usar versiones estables
 - Revisar vulnerabilidades regularmente
