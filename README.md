# PROYECTO FINAL LINUX - PROTECSA

¡Bienvenido/a a este simulador de terminal en estilo Linux Debian!  
Este proyecto ha sido desarrollado como parte del **Proyecto Final** del curso de **Linux - Gen 1**.

---

## 🖥️ Descripción General

Este proyecto simula una terminal Linux básica donde puedes ejecutar comandos personalizados.  
Toda la funcionalidad inicia desde `main.sh`, que gestiona la autenticación y ejecución de los scripts.

Incluye:
- Comandos de ayuda, información del sistema y hora.
- Buscador de archivos.
- Un minijuego para cuidar un gato ("Katty").
- Un reproductor de música.
- Sistema de autenticación.

---

## 📂 Estructura de Archivos y Especificaciones

| Archivo | Función | Especificación |
|:--------|:--------|:---------------|
| `main.sh` | Controlador principal. | Autentica usuarios usando `credenciales.txt`, inicia el loop de comandos personalizados y maneja la ejecución de scripts. Bloquea Ctrl+C y Ctrl+Z. |
| `credenciales.txt` | Base de datos de usuarios. | Contiene pares `usuario:contraseña`. Actualmente incluye `khiiya:caramelo`. |
| `ayuda.sh` | Muestra ayuda de comandos. | Despliega una lista de todos los comandos disponibles con estilo animado y arte ASCII. Se usa `tput` para colores. |
| `infosis.sh` | Información del sistema. | Muestra RAM usada, arquitectura del CPU y nombre del sistema operativo. Usa `awk` y `/proc/meminfo` para obtener RAM. |
| `dat.sh` | Fecha y hora actuales. | Muestra un arte ASCII y luego la fecha y hora extraída de `/proc/driver/rtc`. Incluye animaciones de texto. |
| `busqueda.sh` | Buscador de archivos. | Pide una carpeta y un nombre de archivo. Usa `grep` y `ls` para encontrar si el archivo existe en la carpeta especificada. |
| `creditos.sh` | Créditos del proyecto. | Muestra arte ASCII de agradecimiento, autoría del proyecto y fecha de creación. |
| `katty.sh` | Minijuego "Cuida a Katty". | Juego donde debes cuidar a "Katty" alimentándola, jugando o hablando. Su vida se guarda en `DVIDA.txt` y puede revivir si muere. |
| `reproductor.sh` | Reproductor MP3. | Reproduce archivos `.mp3` del directorio `$HOME/Música` usando `mpg123`. Permite cambiar de canción (n/p) o salir (q). |

---

## 🚀 Instrucciones de Uso

1. **Clonar o copiar** todos los archivos en una misma carpeta.
2. **Dar permisos de ejecución al archivo main.sh**:
   ```bash
   chmod +x main.sh
   ```
3. **Iniciar el proyecto** ejecutando:
   ```bash
   ./main.sh
   ```
4. **Ingresar credenciales** correctas basadas en `credenciales.txt`.
5. **Ejecutar comandos personalizados** en la terminal simulada.

---

## 🔑 Credenciales Predeterminadas

Estas están definidas en `credenciales.txt`, en formato:

```
usuario:contraseña
```

**Credenciales actuales:**  
- Usuario: `khiiya`
- Contraseña: `caramelo`

---

## ⚙️ Comandos Disponibles

| Comando | Acción |
|:--------|:-------|
| `ayuda` | Muestra la lista de comandos disponibles. |
| `infosis` | Muestra información del sistema: memoria, arquitectura y sistema operativo. |
| `dat` | Muestra fecha y hora actual. |
| `busqueda` | Realiza la búsqueda de un archivo en una ruta. |
| `creditos` | Despliega los créditos de los autores. |
| `katty` | Inicia el minijuego para cuidar a Katty. |
| `reproductor` | Abre el reproductor de archivos MP3. |
| `salir` | Cierra la terminal simulada. |

---

## ⚠️ Advertencias y Recomendaciones

- **Sistema compatible:** Linux (Debian o derivados).
- **Dependencias:**
  - Para `reproductor.sh` es necesario `mpg123`.
- **Directorios esperados:**
  - `$HOME/Música` debe existir y contener `.mp3` para el reproductor.
- **Katty:**
  - El juego crea y actualiza el archivo `DVIDA.txt`.
  - No borrar `DVIDA.txt` a menos que quieras reiniciar a Katty.
- **Terminal bloqueada:**
  - `Ctrl+C` y `Ctrl+Z` están desactivados para evitar interrupciones accidentales.
- **Errores comunes:**
  - Si no introduces las credenciales correctamente, la terminal se cierra.
  - `busqueda.sh` requiere una ruta válida existente.
  - Si no deseas instalar `mpg123`, el reproductor no funcionará.

---

## 📜 Créditos

**Autores:**  
- Karla Isela  
- Jose Angel  

**Curso:**  
- PROTECSA - Generación 1

**Fecha:**  
- Abril 2025
