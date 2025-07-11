SELECT
  ROUND(EXP(predicted_log_fare_amount) - 1, 2) AS predicted_fare_amount,
  ROUND(EXP(log_fare_amount) - 1, 2) AS actual_fare_amount,
  ROUND(EXP(predicted_log_fare_amount) - EXP(log_fare_amount), 2) AS error,
  ROUND(EXP(log_trip_distance) - 1, 2) AS trip_distance,
  passenger_count,
  pickup_hour,
  day_of_week,
  trip_type,
  airport_flag,
  PULocationID,
  DOLocationID

FROM ML.PREDICT(
  MODEL `nyc-taxi-fare-april-2025.nyc_taxi_fare.taxi_fare_model_final`,
  (
    SELECT
      log_fare_amount,
      log_trip_distance,
      passenger_count,
      pickup_hour,
      day_of_week,
      PULocationID,
      DOLocationID,

      CASE
        WHEN PULocationID IN (132, 138) OR DOLocationID IN (132, 138) THEN 'jfk_trip'
        WHEN PULocationID = DOLocationID THEN 'loop'
        ELSE 'standard'
      END AS trip_type,

      IF(PULocationID IN (132, 138) OR DOLocationID IN (132, 138), 1, 0) AS airport_flag

    FROM `nyc-taxi-fare-april-2025.nyc_taxi_fare.feature_engineered_data`
    LIMIT 100
  )
);
