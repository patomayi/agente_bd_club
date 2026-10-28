# agente_bd_club

## English

`agente_bd_club` is a lightweight SQL assistant that translates natural-language questions in Spanish into SQL queries for a PostgreSQL database named `club`.

The project contains a Python script that defines the database schema, receives a question from the user, builds a prompt with the schema, and sends it to Ollama so a local LLM can generate the most appropriate SQL statement.

### What this repo does

This project is designed to help with SQL learning and database querying by allowing you to ask questions in everyday language instead of writing SQL manually.

It does the following:

- defines the schema of the `club` database
- receives user questions in Spanish
- uses Ollama and a local model such as `llama3.1`
- generates a valid SQL query based on the schema
- prints the SQL in the console for you to use or adapt

This is useful for studying database design, practicing joins, and quickly generating queries from natural language.

### Main files

- `agente_sql.py`: main script that generates the SQL
- `examen.txt`: examples and SQL exercises
- `volcado.sql`: database dump with the schema and data for the `club` database
- `venv/`: Python virtual environment if created locally

### Requirements

Before running it, make sure you have:

- Python 3.10 or newer
- Git
- Ollama installed and available in your terminal
- a local model available, such as `llama3.1`

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

If you prefer another model, update this line in `agente_sql.py`:

```python
subprocess.run(["ollama", "run", "llama3.1"], ...)
```

### How to run it

Linux/macOS:

```bash
python3 agente_sql.py
```

Windows:

```powershell
python agente_sql.py
```

You will then see an interactive prompt like:

```text
Agente SQL optimizado listo. Pregunta lo que quieras sobre la base 'club'.
> 
```

You can ask questions such as:

```text
Muestra todas las ciudades donde hay trabajadores del departamento 'entrenador'.
```

The script will generate a SQL statement similar to:

```sql
SELECT DISTINCT ciutat
FROM treballador NATURAL JOIN persona
WHERE departament = 'entrenador';
```

### Important note

This project generates SQL using a local model, but it does not automatically execute the query in PostgreSQL. Its purpose is:

1. receive a question in Spanish
2. generate the correct SQL
3. let the user copy and run it in a database client or environment

### Cross-platform compatibility

This project is intended to work on any system where you can install:

- Python
- Ollama
- a shell or terminal

It is compatible with:

- Linux
- macOS
- Windows

As long as Python and Ollama are configured correctly, the project can run with minimal or no code changes.

---

## Español

`agente_bd_club` es un asistente SQL ligero que convierte preguntas en lenguaje natural en consultas SQL para una base de datos PostgreSQL llamada `club`.

El repositorio contiene un script en Python que define el esquema de la base de datos, recibe una pregunta del usuario, construye un prompt con ese esquema y lo envía a Ollama para que un modelo local genere la sentencia SQL más adecuada.

### ¿Qué hace este proyecto?

La idea es facilitar el aprendizaje de SQL y la consulta de bases de datos sin tener que escribir cada sentencia manualmente.

Hace lo siguiente:

- define el esquema de la base de datos `club`
- recibe preguntas en español
- usa Ollama con un modelo local como `llama3.1`
- genera una consulta SQL válida según el esquema
- muestra la SQL por consola para que puedas usarla o adaptarla

Es útil para estudiar diseño de bases de datos, practicar joins y generar consultas rápidamente a partir de lenguaje natural.

### Archivos principales

- `agente_sql.py`: script principal del agente SQL
- `examen.txt`: ejemplos y ejercicios de SQL
- `volcado.sql`: volcado de la base de datos con el esquema y datos de `club`
- `venv/`: entorno virtual de Python si se crea localmente

### Requisitos

Antes de ejecutarlo, necesitas:

- Python 3.10 o superior
- Git
- Ollama instalado y funcionando
- un modelo local disponible, por ejemplo `llama3.1`

### Instalación

#### 1) Clona el repositorio

```bash
git clone https://github.com/patomayi/agente_bd_club.git
cd agente_bd_club
```

#### 2) Crea un entorno virtual

En Linux/macOS:

```bash
python3 -m venv venv
source venv/bin/activate
```

En Windows PowerShell:

```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
```

En Windows CMD:

```cmd
python -m venv venv
venv\Scripts\activate.bat
```

#### 3) Instala Ollama

Descárgalo desde:

- https://ollama.com/

Y asegúrate de que el comando `ollama` esté disponible en tu terminal.

#### 4) Descarga un modelo

```bash
ollama pull llama3.1
```

Si prefieres otro modelo, cambia esta línea en `agente_sql.py`:

```python
subprocess.run(["ollama", "run", "llama3.1"], ...)
```

### Cómo ejecutarlo

En Linux/macOS:

```bash
python3 agente_sql.py
```

En Windows:

```powershell
python agente_sql.py
```

A continuación verás un prompt interactivo:

```text
Agente SQL optimizado listo. Pregunta lo que quieras sobre la base 'club'.
> 
```

Puedes hacer preguntas como:

```text
Muestra todas las ciudades donde hay trabajadores del departamento 'entrenador'.
```

Y el programa generará una sentencia SQL similar a:

```sql
SELECT DISTINCT ciutat
FROM treballador NATURAL JOIN persona
WHERE departament = 'entrenador';
```

### Importante

Este proyecto genera SQL usando un modelo local, pero no ejecuta automáticamente la consulta en PostgreSQL. La intención es:

1. hacer la pregunta en español
2. generar la SQL correcta
3. dejar que el usuario la copie y la ejecute en un cliente o entorno de base de datos

### Compatibilidad multiplataforma

El repositorio está pensado para funcionar en cualquier sistema donde puedas instalar:

- Python
- Ollama
- una terminal o shell

Por eso es compatible con:

- Linux
- macOS
- Windows

Siempre que Python y Ollama estén bien configurados, el proyecto puede ejecutarse sin cambios importantes en el código.

## Nota final

Este repositorio es una herramienta educativa y práctica para trabajar con SQL y modelos de IA locales. Sirve tanto para aprender consultas como para experimentar con la generación automática de SQL a partir de lenguaje natural.

Puedes probarlo con los ejemplos incluidos en `examen.txt` o importar el esquema de `volcado.sql` en una base PostgreSQL para ejecutar las consultas generadas.
