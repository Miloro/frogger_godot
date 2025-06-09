# Diplomatura en Desarrollo de Videojuegos - UNQui

**Materia:** Introducción a los Videojuegos / Elementos Básicos de Programación de Videojuegos

---

## Datos del Alumno

- **Nombre y Apellido:** Miguel Miloro  
- **Correo:** miloromiguel@gmail.com 
- **Comisión:** Virtual


---

## Decisiones Técnicas Relevantes

- **Animación de caída:** Se incorporó una animación específica que se activa cuando el personaje cae en un pozo.

- **Corrección de animación de muerte:** Se solucionó un error que mantenía al personaje en su animación de reposo (*idle*) si moría durante un movimiento.

- **Animación de movimiento direccional:** El personaje ahora rota y muestra la animación correspondiente según la dirección del desplazamiento.

- **Obstáculos grandes:** Se introdujo un nuevo tipo de obstáculo de 32 píxeles de ancho y alto, lo que permite representar elementos de mayor tamaño.

- **Nuevo comportamiento de obstáculos:** Se implementó una lógica de movimiento de ida y vuelta para los obstáculos.

- **Música de fondo:** Se integró una pista musical para acompañar la experiencia de juego y reforzar la ambientación general.

- **Ajuste del área jugable:** Se redujo una línea en el área jugable para permitir la correcta visualización de la cantidad de vidas restantes.

- **Capas en los *tile sets*:** Se uso las multiples capas de los *tile sets*, con el objetivo de mejorar el diseño visual y facilitar la escalabilidad del proyecto.


---

## Créditos de Assets

- **Música:** [Midnight Road](https://opengameart.org/content/midnight-road) por [marcelofg55](https://opengameart.org/users/marcelofg55)  

---

## Pruebas Realizadas

- Juego probado en **Godot 4.2**  
- Verificado en distintas resoluciones y formatos de ventana  
- Carga correcta del proyecto desde el editor (`main.tscn`)

---

## Observaciones Finales

- Se tenía prevista la implementación de un contador numérico para representar las vidas cuando superaran cierto valor, con el fin de mejorar la visualización, no se llegó por falta de tiempo.

- Se planificó añadir efectos de sonido a más acciones del personaje,no se llegó por falta de tiempo.

- Se quiso incorporar nuevos tipos de trampas, como trampillas o pinchos, para aumentar la variedad de desafíos, no se llegó por falta de tiempo.

---

**Última modificación:** 9/06/2025
