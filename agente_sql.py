import subprocess

# ---------------------------------------------------------
#  ESQUEMA INTELIGENTE INCRUSTADO
# ---------------------------------------------------------
ESQUEMA = """
Base de datos: club

Tablas:

ciutat(ciutat PK, habitants, costanera, comarca FK→comarca.comarca)
comarca(comarca PK)
persona(passaport PK, nom, cognom, ciutat FK→ciutat.ciutat)
mails(passaport FK→persona.passaport, mail)
nomines(passaport FK→treballador.passaport, periode, sou_base, retencio)
treballador(passaport PK FK→persona.passaport, departament, obeeix FK→treballador.passaport)
soci(passaport PK FK→persona.passaport, alta)
fa(passaport FK→soci.passaport, esport FK→esport.esport, quota)
esport(esport PK, preu, jugadors)
coneix(coneix FK→persona.passaport, es_coneguda FK→persona.passaport)

Relaciones importantes:

persona.passaport = mails.passaport
persona.passaport = treballador.passaport
treballador.passaport = nomines.passaport
persona.passaport = soci.passaport
soci.passaport = fa.passaport
fa.esport = esport.esport
persona.ciutat = ciutat.ciutat
ciutat.comarca = comarca.comarca

Reglas de unión:

- NATURAL JOIN es válido entre:
  persona ↔ mails
  persona ↔ nomines
  persona ↔ ciutat

- JOIN ON debe usarse cuando:
  - los nombres de columnas no coinciden
  - se requiere LEFT/RIGHT/FULL JOIN
  - la pregunta lo pida explícitamente

- No usar tablas que no sean necesarias.
- No inventar columnas ni relaciones.
- La consulta debe ser lo más simple posible.
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

{ESQUEMA}

REGLAS IMPORTANTES:
- Devuelve SOLO una consulta SQL válida.
- SIN explicaciones.
- SIN comentarios.
- Usa NATURAL JOIN solo cuando sea correcto.
- Usa JOIN ON cuando sea necesario.
- Usa LEFT/RIGHT JOIN cuando la pregunta lo pida.
- No uses tablas innecesarias.
- No inventes columnas.
- La consulta debe ser la más corta y simple posible.

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
        return "❌ No se pudo generar SQL válido."

    consulta = " ".join(sql)
    if not consulta.endswith(";"):
        consulta += ";"

    return consulta


# ---------------------------------------------------------
#  LOOP PRINCIPAL
# ---------------------------------------------------------
print("Agente SQL optimizado listo. Pregunta lo que quieras sobre la base 'club'.")
print("> ", end="", flush=True)

while True:
    pregunta = input()
    sql = generar_sql(pregunta)
    print("\nSQL generado:\n" + sql + "\n")
    print("> ", end="", flush=True)
