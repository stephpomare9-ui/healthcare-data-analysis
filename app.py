import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

# Load data
df = pd.read_excel("patients.xlsx")

# Filter only obesity patients
obesity_df = df[df['Medical_Condition'] == 'Obesity'].copy()

# Create age groups
obesity_df['Age Group'] = pd.cut(
    obesity_df['Age'],
    bins=[0, 30, 45, 60, 120],
    labels=['<30', '30-45', '45-60', '60+'],
    right=False
)

# Count age groups
age_counts = obesity_df['Age Group'].value_counts().sort_index()

# Dashboard title
st.title("Obesity Patients by Age Group")

# KPI cards
st.metric("Total Obesity Patients", len(obesity_df))

# Table
st.subheader("Patient Counts")
st.write(age_counts)

# Bar chart
fig, ax = plt.subplots()
age_counts.plot(kind='bar', ax=ax)

plt.title("Obesity Patients by Age Group")
plt.xlabel("Age Group")
plt.ylabel("Number of Patients")
plt.xticks(rotation=0)

st.pyplot(fig)