SELECT
  EXP(predicted_log_fare_amount) - 1 AS predicted_fare_amount,
  EXP(log_fare_amount) - 1 AS actual_fare_amount,
  ROUND(EXP(predicted_log_fare_amount) - EXP(log_fare_amount), 2) AS error,
  passenger_count,
  EXP(log_trip_distance) - 1 AS trip_distance,
  pickup_hour,
  day_of_week,
  PULocationID,
  DOLocationID,
  trip_type
FROM ML.PREDICT(
  MODEL `nyc-taxi-fare-april-2025.nyc_taxi_fare.taxi_fare_model_tree`,
  (
    SELECT
      log_fare_amount,
      log_trip_distance,
      passenger_count,
      pickup_hour,
      day_of_week,
      PULocationID,
      DOLocationID,
      trip_type
    FROM `nyc-taxi-fare-april-2025.nyc_taxi_fare.feature_engineered_data`
    LIMIT 100
  )
);

--still underpredicting higher values more than I'd like. Let's see if we can optimize.
--The JFK steady rate trips are throwing off my data. I could make 2 models but this is very optimal for processing and costs.
--I am going to work on making a singular smarter model with an airport_flag to separate, but still include JFK transit.