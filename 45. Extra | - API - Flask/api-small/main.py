from flask import Flask
import random
import queries.the_queries as query

app = Flask(__name__)

@app.route("/get_todo/<table>/<limit>")
def get_table (table, limit): 
    df = query.get_everything(f"{table}", f"{limit}")
    return df.to_dict(orient="records")

@app.route("/")
def greting():
    return "Hello world!"

@app.route("/random")
def random_number ():
    return str(random.randint(0, 100))

@app.route("/campus/<ciudad>")
def campus_c (ciudad):
    if ciudad == "madrid":
        return "Paseo de la Chopera, 14"
    elif ciudad == "barcelona":
        return "Carrer de Pamplona, 96"
    else:
        return "No campus"


app.run(debug=True)