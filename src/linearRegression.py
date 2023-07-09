#Python code
# Dataset - MIMIC-III clinical database

import pandas as pd
from sklearn.linear_model import LinearRegression

# Load the dataset into a pandas DataFrame
dataset = pd.read_csv('C:\data\BPwithoutHR.csv')

# Independent variable (PTT) and dependent variables (SBP and DBP)
X = dataset[['PTT']]
y = dataset[['SBP', 'DBP']]

# Create an instance of the LinearRegression model
model = LinearRegression()

# Fit the model to the data
model.fit(X, y)

# Predict BP values using PTT
new_data = pd.DataFrame({'PTT': [0.5]})
predicted_bp = model.predict(new_data)

# Print the predicted BP values
print("Predicted SBP:", predicted_bp[0][0])
print("Predicted DBP:", predicted_bp[0][1])