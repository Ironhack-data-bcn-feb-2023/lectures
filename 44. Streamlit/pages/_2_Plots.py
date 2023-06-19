import streamlit as st
age = st.slider('How old are you?', 0, 130, 25)
st.write("I'm ", age, 'years old')

def hello_world ():
    return "HELL WORLDDDD"


if st.button("Submit"):
    st.write(hello_world())

text = st.text_input("Enter your name: ")

def greeting (name):
    return f"Hello! {name}"

st.write(greeting(text))
