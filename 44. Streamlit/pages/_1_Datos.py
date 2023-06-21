from queries.sql_queries import query_employees
import streamlit as st

st.selectbox("Selecciona tabla: ", ["salaries", "employees", "departments"])
df = query_employees("salaries")
st.dataframe(df)  # Same as st.write(df)


age = st.slider('How old are you?', 0, 130, 25)
st.write("I'm ", age, 'years old')