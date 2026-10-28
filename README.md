# agente_bd_club

Agente SQL para consultar una base de datos llamada `club` usando lenguaje natural en español.

Este repositorio contiene un pequeño generador de consultas SQL que recibe una pregunta del usuario, construye un prompt con el esquema de la base de datos y lo envía a `ollama` para que genere la sentencia SQL adecuada. El script no ejecuta la consulta contra la base de datos; solo produce la SQL que luego puedes usar en PostgreSQL.

## ¿Qué hace este proyecto?

La idea es facilitar el trabajo con bases de datos sin escribir SQL manualmente para cada consulta. El programa:

- define el esquema de la base de datos `club`
- interpreta preguntas en español
- usa el modelo local de Ollama para generar una consulta SQL válida
- devuelve la sentencia SQL final por consola

Esto es útil para practicar SQL, aprender relaciones entre tablas o generar consultas rápidamente a partir de preguntas en lenguaje natural.

## Archivos principales

- `agente_sql.py`: script principal del agente SQL
- `examen.txt`: conjunto de consultas de ejemplo y ejercicios de SQL
- `volcado.sql`: volcado de la base de datos `club` (esquema y datos)
- `venv/`: entorno virtual de Python (si se ha creado localmente)

## Requisitos

Antes de ejecutarlo, necesitas:

- Python 3.10 o superior
- Git
- Ollama instalado y funcionando
- Un modelo de LLM disponible localmente, por ejemplo `llama3.1`

## Instalación

### 1) Clona el repositorio

```bash
git clone https://github.com/patomayi/agente_bd_club.git
cd agente_bd_club
```

### 2) Crea un entorno virtual

En Linux/macOS:

```bash
python3 -m venv venv
source venv/bin/activate
```

En Windows (PowerShell):

```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
```

En Windows (CMD):

```cmd
python -m venv venv
venv\Scripts\activate.bat
```

### 3) Instala Ollama

Descárgalo desde:

- https://ollama.com/

Y asegúrate de que el comando `ollama` esté disponible en tu terminal.

### 4) Descarga el modelo requerido

```bash
ollama pull llama3.1
```

Si prefieres otro modelo, cambia la línea de ejecución en `agente_sql.py`:

```python
subprocess.run(["ollama", "run", "llama3.1"], ...)
```

por otro modelo disponible en tu sistema.

## Cómo ejecutarlo

### En Linux/macOS

```bash
python3 agente_sql.py
```

### En Windows

```powershell
python agente_sql.py
```

A continuación verás un prompt interactivo:

```text
Agente SQL optimizado listo. Pregunta lo que quieras sobre la base 'club'.
> 
```

Puedes escribir preguntas como:

```text
Muestra todas las ciudades donde hay trabajadores del departamento 'entrenador'.
```

Y el programa generará una sentencia SQL similar a:

```sql
SELECT DISTINCT ciutat
FROM treballador NATURAL JOIN persona
WHERE departament = 'entrenador';
```

## Importante

Este proyecto genera SQL usando un modelo local, pero no ejecuta automáticamente la consulta sobre PostgreSQL. La intención es:

1. hacer la pregunta en español
2. generar la SQL correcta
3. copiarla y ejecutarla en tu base de datos si corresponde

## Ejemplo de uso

```bash
python3 agente_sql.py
```

Luego escribe:

```text
¿Quiénes son las personas que viven en Lleida?
```

El agente intentará convertir esa pregunta en una consulta SQL válida para la base `club`.

## Compatibilidad multiplataforma

El repositorio está pensado para funcionar en cualquier plataforma donde puedas instalar:

- Python
- Ollama
- una terminal o shell

Por eso las instrucciones están basadas en comandos compatibles con:

- Linux
- macOS
- Windows

Siempre que tengas el entorno Python y Ollama correctamente configurados, el proyecto puede ejecutarse sin cambios importantes en el código.

## Nota final

Este repositorio es una herramienta educativa y práctica para trabajar con SQL y modelos de IA locales. Sirve tanto para aprender consultas como para experimentar con la generación automática de SQL a partir de lenguaje natural.

Si quieres, puedes probarlo con los ejemplos incluidos en `examen.txt` o importar el esquema de `volcado.sql` en una base PostgreSQL para ejecutar las consultas generadas.
