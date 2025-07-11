# NYC Taxi Fare Prediction using BigQuery ML

This project uses NYC taxi trip data to build and evaluate a fare prediction model using BigQuery ML. It demonstrates how to ingest, clean, and analyze large datasets on Google Cloud Platform and apply machine learning directly in BigQuery. It also includes troubleshooting and noting the importance of testing your model before using the results.f

---

## Tools & Technologies
- Google Cloud Platform (GCP)
- BigQuery
- BigQuery ML
- Cloud Storage
- SQL
- Troubleshooting

---

## Objective
The objective is to predict taxi fare amounts based on trip details (pickup/dropoff location, trip distance, passenger count, etc.) using historical NYC taxi data and BigQuery ML.

---

## Architecture Overview

## [CSV in Cloud Storage] → [BigQuery External Table] → [Data Cleaning + Feature Engineering] → [BigQuery ML Model] → [Evaluation + Predictions]

## Data Source
- NYC Taxi Trip Data (Yellow Cabs)  
  [https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

---

## Steps Taken
1. Loaded CSV files to Cloud Storage and connected to BigQuery as external table
2. Cleaned data and engineered features using SQL
3. Created a linear regression model in BigQuery ML
4. Evaluated model using RMSE and R² metrics
5. Queried and visualized prediction outputs
6. Repeat for boosted tree regressor model in BigQuery ML due to large error with linear regression
7. Repeat again after optimizing to accomodate JFK flat rate fares and long distance trips.

---

## Results
- Model type: Linear Regression
- RMSE: 26.47
- R² Score: .9074
- Sample Predictions: 

- Model type: Boosted Tree Regressor
- RMSE: 
- R² Score:
- Sample Predictions:

- Model type: Boosted Tree Regressor
- RMSE: .16
- R² Score: .932
- Sample Predictions: 

---

## Next Steps
- Improve feature engineering
- Add weight loss function to penalize underprediction of high fares
- Add traffic/time of day features such as rush hour
- Deploy predictions via Cloud Functions or Looker Studio
- Use neural net models outside of BigQuery (TensorFlow, XGBoost)

---

## Folder Structure

- /sql → SQL scripts for cleaning, modeling, evaluation, and testing broken into folders for each model created.
- /assets → Screenshots or diagrams
README.md → This file

