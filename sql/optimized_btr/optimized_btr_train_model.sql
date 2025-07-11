CREATE OR REPLACE MODEL `nyc-taxi-fare-april-2025.nyc_taxi_fare.taxi_fare_model_final`
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

  -- Categorical trip type: airport, loop, or standard
  CASE
    WHEN PULocationID IN (132, 138) OR DOLocationID IN (132, 138) THEN 'jfk_trip'
    WHEN PULocationID = DOLocationID THEN 'loop'
    ELSE 'standard'
  END AS trip_type,

  -- Simpler boolean flag
  IF(PULocationID IN (132, 138) OR DOLocationID IN (132, 138), 1, 0) AS airport_flag

FROM `nyc-taxi-fare-april-2025.nyc_taxi_fare.feature_engineered_data`
WHERE log_fare_amount IS NOT NULL

--This model uses the cleaned data table used with the previous boosted tree regressor model.
