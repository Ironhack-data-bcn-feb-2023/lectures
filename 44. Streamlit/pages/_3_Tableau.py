import codecs
import streamlit
import streamlit.components.v1 as components

f = codecs.open("data/tableau.html")
tableau = f.read()
components.html(tableau, height=550, scrolling=True)