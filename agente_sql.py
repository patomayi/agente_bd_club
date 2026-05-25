import subprocess

# ---------------------------------------------------------
#  ESQUEMA INTELIGENTE INCRUSTADO
# ---------------------------------------------------------
ESQUEMA_INTELIGENTE = """
Base de datos: club

Tablas y columnas:

- ciutat(
    ciutat PK,
    habitants,
    costanera,
    comarca FK → comarca.comarca
  )

- comarca(
    comarca PK
  )

- persona(
    passaport PK,
    nom,
    cognom,
    ciutat FK → ciutat.ciutat
  )

- soci(
    passaport PK FK → persona.passaport,
    alta
  )

- treballador(
    passaport PK FK → persona.passaport,
    departament (administració | comercial | entrenador),
    obeeix FK → treballador.passaport
  )

- mails(
    passaport FK → persona.passaport,
    mail
  )

- esport(
    esport PK,
    preu,
    jugadors
  )

- fa(
    passaport FK → soci.passaport,
    esport FK → esport.esport,
    quota
  )

- nomines(
    passaport PK FK → treballador.passaport,
    periode PK (junto con passaport),
    sou_base,
    retencio
  )

- coneix(
    coneix FK → persona.passaport,
    es_coneguda FK → persona.passaport
  )

Relaciones clave:

- persona.passaport = soci.passaport
- persona.passaport = treballador.passaport
- persona.ciutat = ciutat.ciutat
- ciutat.comarca = comarca.comarca
- mails.passaport = persona.passaport
- fa.passaport = soci.passaport
- fa.esport = esport.esport
- nomines.passaport = treballador.passaport
- coneix.coneix / coneix.es_coneguda → persona.passaport
- treballador.obeeix → treballador.passaport
"""

# ---------------------------------------------------------
#  GENERADOR DE SQL (solo genera, no ejecuta)
# ---------------------------------------------------------
def generar_sql(pregunta):
    prompt = f"""
Eres un generador de SQL experto en PostgreSQL.

El usuario hará preguntas en español.
Debes generar consultas SQL usando las tablas en catalán de la base 'club'.

Esquema de la base de datos:

{ESQUEMA_INTELIGENTE}

REGLAS IMPORTANTES:
- Devuelve SOLO una consulta SQL válida.
- SIN explicaciones.
- SIN comentarios.
- SIN texto adicional.
- NO inventes tablas.
- NO inventes columnas.
- Usa NATURAL JOIN solo cuando tenga sentido por columnas comunes.
- Usa JOIN ... ON correcto cuando haya relaciones explícitas.
- La consulta debe ser COMPLETA (SELECT ... FROM ... [JOIN ...] [WHERE ...] [GROUP BY ...]).

Pregunta del usuario:
{pregunta}
"""

    result = subprocess.run(
        ["ollama", "run", "llama3.1"],
        input=prompt.encode(),
        stdout=subprocess.PIPE
    )

    texto = result.stdout.decode()

    # Reconstruir toda la consulta (multilínea)
    lineas = [l.strip() for l in texto.splitlines() if l.strip()]

    sql = []
    recogiendo = False

    for l in lineas:
        u = l.upper()
        if not recogiendo and u.startswith(("SELECT", "UPDATE", "DELETE", "INSERT")):
            recogiendo = True
            sql.append(l)
            if l.endswith(";"):
                break
        elif recogiendo:
            sql.append(l)
            if l.endswith(";"):
                break

    if not sql:
        return "XXXXX---No se pudo generar SQL válido.---"

    consulta = " ".join(sql)
    if not consulta.endswith(";"):
        consulta += ";"

    return consulta


# ---------------------------------------------------------
#  LOOP PRINCIPAL (solo imprime SQL)
# ---------------------------------------------------------
print("Agente SQL (solo generación de consultas) listo para la base 'club'.")
print("> ", end="", flush=True)

while True:
    pregunta = input()
    sql = generar_sql(pregunta)
    print("\nSQL generado:\n" + sql + "\n")
    print("> ", end="", flush=True)
