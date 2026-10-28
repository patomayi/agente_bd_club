# agente_bd_club

## English

`agente_bd_club` is a lightweight SQL assistant that turns natural-language questions into SQL queries for a PostgreSQL database called `club`.

The project is intentionally simple: it defines the database schema, receives a question from the user, builds a prompt with that schema, and sends it to Ollama so a local language model can generate the most suitable SQL statement.

### What the project does

This repository is useful for learning SQL and practicing database queries without manually writing every statement.

The program:

- defines the schema for the `club` database
- reads a question in Spanish
- constructs a prompt for the model using the schema
- calls `ollama run` with a local model such as `llama3.1`
- extracts and prints the generated SQL in the terminal

It does not execute the SQL automatically against PostgreSQL; it simply generates the query for the user to review and run.

### Main idea of the implementation

The core logic lives in `agente_sql.py`.

The script contains:

- `ESQUEMA`: a text block describing the tables and relationships of the `club` database
- `generar_sql(pregunta)`: builds a prompt and calls Ollama
- the main loop: reads input from the user and prints the generated SQL

This is a practical example of a local AI-powered SQL generator using a prompt-driven approach.

### Files in the repository

- `agente_sql.py`: main application logic
- `examen.txt`: SQL exercises and sample questions
- `volcado.sql`: database dump containing schema/data for the `club` database
- `venv/`: local Python virtual environment (if created)
- `README.md`: project documentation

### Requirements

You need:

- Python 3.10 or newer
- Git
- Ollama installed and available in the terminal
- a local model available in Ollama, for example `llama3.1`

### Installation

#### 1) Clone the repository

```bash
git clone https://github.com/patomayi/agente_bd_club.git
cd agente_bd_club
```

#### 2) Create a virtual environment

Linux/macOS:

```bash
python3 -m venv venv
source venv/bin/activate
```

Windows PowerShell:

```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
```

Windows CMD:

```cmd
python -m venv venv
venv\Scripts\activate.bat
```

#### 3) Install Ollama

Download it from:

- https://ollama.com/

Then verify that the `ollama` command works in your terminal.

#### 4) Pull a model

```bash
ollama pull llama3.1
```

If you prefer a different model, change the line inside `agente_sql.py`:

```python
subprocess.run(["ollama", "run", "llama3.1"], ...)
```

### How to use it

Run the script:

Linux/macOS:

```bash
python3 agente_sql.py
```

Windows:

```powershell
python agente_sql.py
```

Then write a question in Spanish, for example:

```text
Muestra todas las ciudades donde hay trabajadores del departamento 'entrenador'.
```

The program will generate a SQL query like:

```sql
SELECT DISTINCT ciutat
FROM treballador NATURAL JOIN persona
WHERE departament = 'entrenador';
```

You can then copy the result and run it in PostgreSQL or another SQL client.

### Implementation notes

The project is intentionally minimal to be easy to understand and modify.

Core implementation flow:

1. define the schema in `ESQUEMA`
2. build a natural-language prompt for the model
3. run the model through `ollama`
4. parse the output and keep only the SQL query
5. print the final result

This makes it easy to extend:

- add more tables or relationships
- support more languages
- generate different SQL dialects
- save results to a file
- add a REST API or web interface

### Cross-platform compatibility

This repo is designed to work on any platform where Python and Ollama are installed.

It works on:

- Linux
- macOS
- Windows

As long as the terminal can run Python and the `ollama` command, the project should work without major changes.

---

## Español

`agente_bd_club` es un asistente SQL ligero que convierte preguntas en lenguaje natural en consultas SQL para una base de datos PostgreSQL llamada `club`.

El proyecto es sencillo por diseño: define el esquema de la base de datos, recibe una pregunta del usuario, construye un prompt con ese esquema y lo envía a Ollama para que un modelo local genere la sentencia SQL más adecuada.

### ¿Qué hace este proyecto?

Este repositorio sirve para aprender SQL y practicar consultas de base de datos sin escribir cada sentencia manualmente.

El programa:

- define el esquema de la base de datos `club`
- lee una pregunta en español
- construye un prompt para el modelo usando el esquema
- llama a `ollama run` con un modelo local como `llama3.1`
- extrae e imprime la SQL generada en la terminal

No ejecuta la consulta automáticamente contra PostgreSQL; solo genera la SQL para que el usuario la revise y la ejecute.

### Idea principal de la implementación

La lógica principal está en `agente_sql.py`.

El script contiene:

- `ESQUEMA`: un bloque de texto con las tablas y relaciones de la base `club`
- `generar_sql(pregunta)`: crea el prompt y llama a Ollama
- el bucle principal: lee la entrada del usuario y muestra la SQL generada

Es un ejemplo práctico de generador de SQL con IA local usando prompts.

### Archivos del repositorio

- `agente_sql.py`: lógica principal de la aplicación
- `examen.txt`: ejercicios y preguntas de ejemplo
- `volcado.sql`: volcado de la base de datos con esquema y datos
- `venv/`: entorno virtual de Python si se crea localmente
- `README.md`: documentación del proyecto

### Requisitos

Necesitas:

- Python 3.10 o superior
- Git
- Ollama instalado y disponible en la terminal
- un modelo local disponible en Ollama, por ejemplo `llama3.1`

### Instalación

#### 1) Clona el repositorio

```bash
git clone https://github.com/patomayi/agente_bd_club.git
cd agente_bd_club
```

#### 2) Crea un entorno virtual

Linux/macOS:

```bash
python3 -m venv venv
source venv/bin/activate
```

Windows PowerShell:

```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
```

Windows CMD:

```cmd
python -m venv venv
venv\Scripts\activate.bat
```

#### 3) Instala Ollama

Descárgalo desde:

- https://ollama.com/

Y comprueba que el comando `ollama` funcione en tu terminal.

#### 4) Descarga un modelo

```bash
ollama pull llama3.1
```

Si prefieres otro modelo, cambia esta línea dentro de `agente_sql.py`:

```python
subprocess.run(["ollama", "run", "llama3.1"], ...)
```

### Cómo usarlo

Ejecuta el script:

Linux/macOS:

```bash
python3 agente_sql.py
```

Windows:

```powershell
python agente_sql.py
```

Luego escribe una pregunta en español, por ejemplo:

```text
Muestra todas las ciudades donde hay trabajadores del departamento 'entrenador'.
```

El programa generará una consulta SQL parecida a:

```sql
SELECT DISTINCT ciutat
FROM treballador NATURAL JOIN persona
WHERE departament = 'entrenador';
```

Después puedes copiar el resultado y ejecutarlo en PostgreSQL o en un cliente SQL.

### Notas de implementación

El proyecto está pensado para ser simple y fácil de entender y ampliar.

Flujo de implementación:

1. definir el esquema en `ESQUEMA`
2. construir un prompt con lenguaje natural
3. ejecutar el modelo con `ollama`
4. analizar la salida y conservar solo la SQL
5. imprimir el resultado final

Esto permite ampliarlo fácilmente con:

- más tablas o relaciones
- más idiomas
- otros dialectos SQL
- guardado de consultas en archivo
- API REST o interfaz web

### Compatibilidad multiplataforma

Este repositorio está pensado para funcionar en cualquier plataforma donde tengas Python y Ollama instalados.

Funciona en:

- Linux
- macOS
- Windows

Mientras la terminal pueda ejecutar Python y el comando `ollama`, el proyecto debería funcionar sin cambios importantes.

## Resumen

Este proyecto es una base simple pero útil para generar consultas SQL desde lenguaje natural usando IA local. Es ideal para aprendizaje, prototipos, y experimentación con modelos locales de generación SQL.

Puedes usarlo como punto de partida para crear un agente más avanzado que además:

- ejecute la SQL de forma automática
- conecte con PostgreSQL directamente
- guarde historial de consultas
- cree una interfaz web o API
- soporte más preguntas y más esquemas de base de datos
