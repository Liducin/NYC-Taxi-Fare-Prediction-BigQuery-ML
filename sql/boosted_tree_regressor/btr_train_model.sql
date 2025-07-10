CREATE OR REPLACE MODEL `nyc-taxi-fare-april-2025.nyc_taxi_fare.taxi_fare_model_tree`
OPTIONS (
  model_type = 'boosted_tree_regressor',
  input_label_cols = ['log_fare_amount'],
  data_split_method = 'RANDOM',
  data_split_eval_fraction = 0.2,
  max_iterations = 50,
  tree_method = 'hist',
  early_stop = TRUE
) AS
SELECT
  log_fare_amount,
  log_trip_distance,
  passenger_count,
  pickup_hour,
  day_of_week,
  PULocationID,
  DOLocationID,
  trip_type
FROM `nyc-taxi-fare-april-2025.nyc_taxi_fare.feature_engineered_data`;

--trying big tree regressor to better process the data that tripped up the linear regression model