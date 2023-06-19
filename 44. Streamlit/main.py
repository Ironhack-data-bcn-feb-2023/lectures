import pandas as pd
import numpy as np
import seaborn as sns
import streamlit as st
import matplotlib.pyplot as plt
import streamlit as st
import numpy as np
import plotly.figure_factory as ff

st.write('Hello, *World!* :sunglasses:')
st.markdown('Streamlit is **_really_ cool**.')
st.markdown('#Título! sin espacio')
st.markdown('# Título! con espacio')

st.title("título!!!")

code = '''def hello():
    print("Hello, Streamlit!")'''

st.code(code, language='python')

st.code("const={'hello': 'world'}", language='javascript')

df = pd.DataFrame(
   np.random.randn(50, 20),
   columns=('col %d' % i for i in range(20)))

sub_df_cols = st.multiselect("Elige las columnas", df.columns)

st.dataframe(df[sub_df_cols])  # Same as st.write(df)


chart_data = pd.DataFrame(
    np.random.randn(20, 3),
    columns=['a', 'b', 'c'])

st.line_chart(chart_data)



# Add histogram data
x1 = np.random.randn(200) - 2
x2 = np.random.randn(200)
x3 = np.random.randn(200) + 2

# Group data together
hist_data = [x1, x2, x3]

group_labels = ['Group 1', 'Group 2', 'Group 3']

# Create distplot with custom bin_size
fig = ff.create_distplot(
        hist_data, group_labels, bin_size=[.1, .25, .5])

# Plot!
st.plotly_chart(fig, use_container_width=True)


titanic = sns.load_dataset("titanic")

fig = plt.figure(figsize=(10, 4))
sns.countplot(x="class", data=titanic)
st.pyplot(fig)

from PIL import Image

image = Image.open('images/space-cat.jpeg')

col1, col2, col3 = st.columns(3)

with col1:
    st.write(' ')

with col2:
    st.image(image, caption='gatete')


with col3:
    st.write(' ')