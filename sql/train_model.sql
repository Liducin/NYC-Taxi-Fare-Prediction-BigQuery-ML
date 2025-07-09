CREATE OR REPLACE MODEL `nyc-taxi-fare-april-2025.nyc_taxi_fare.taxi_fare_model`
OPTIONS(
  model_type = 'linear_reg',
  input_label_cols = ['fare_amount'],
  data_split_method = 'random',
  data_split_eval_fraction = 0.2,
  max_iterations = 20,
  learn_rate_strategy = 'constant',
  learn_rate = 0.1
) AS
SELECT
  fare_amount,
  passenger_count,
  trip_distance,
  pickup_hour,
  day_of_week,
  PULocationID,
  DOLocationID
FROM
  `nyc-taxi-fare-april-2025.nyc_taxi_fare.cleaned_taxi_data`
WHERE
  fare_amount IS NOT NULL
  AND trip_distance BETWEEN 0.5 AND 100
  AND passenger_count BETWEEN 1 AND 6;