# NYC Taxi Fare Prediction using BigQuery ML

This project uses NYC taxi trip data to build and evaluate a fare prediction model using BigQuery ML. It demonstrates how to ingest, clean, and analyze large datasets on Google Cloud Platform and apply machine learning directly in BigQuery.

---

## Tools & Technologies
- Google Cloud Platform (GCP)
- BigQuery
- BigQuery ML
- Cloud Storage
- SQL

---

## Objective
To predict taxi fare amounts based on trip details (pickup/dropoff location, trip distance, passenger count, etc.) using historical NYC taxi data and BigQuery ML's linear regression.

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

---

## Results
- Model type: Linear Regression
- RMSE: `XX.XX` (to be filled)
- R² Score: `XX.XX` (to be filled)
- Sample Predictions: [insert screenshot or table if available]

---

## Next Steps
- Improve feature engineering (e.g., time of day, zones)
- Compare model performance with boosted trees
- Deploy predictions via Cloud Functions or Looker Studio

---

## Folder Structure

- /sql → SQL scripts for cleaning, modeling, and evaluation
- /assets → Screenshots or diagrams
README.md → This file