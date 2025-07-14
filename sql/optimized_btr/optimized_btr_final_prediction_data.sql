WITH predictions AS (
  SELECT
    predicted_log_fare_amount,
    log_fare_amount,
    log_trip_distance,
    passenger_count,
    pickup_hour,
    day_of_week,
    PULocationID,
    DOLocationID,
    trip_type
  FROM
    ML.PREDICT(
      MODEL `nyc-taxi-fare-april-2025.nyc_taxi_fare.taxi_fare_model_tree`,
      (
        SELECT
          log_trip_distance,
          passenger_count,
          pickup_hour,
          day_of_week,
          PULocationID,
          DOLocationID,
          log_fare_amount,
          trip_type
        FROM
          `nyc-taxi-fare-april-2025.nyc_taxi_fare.feature_engineered_data`
        WHERE
          log_fare_amount IS NOT NULL
          LIMIT 10000
      )
    )
)

SELECT
  ROUND(EXP(predicted_log_fare_amount), 2) AS predicted_fare_amount,
  ROUND(EXP(log_fare_amount), 2) AS actual_fare_amount,
  ROUND(EXP(predicted_log_fare_amount) - EXP(log_fare_amount), 2) AS error,
  ABS(ROUND(EXP(predicted_log_fare_amount) - EXP(log_fare_amount), 2)) AS abs_error,
  CASE
    WHEN ABS(EXP(predicted_log_fare_amount) - EXP(log_fare_amount)) < 5 THEN 'good'
    WHEN ABS(EXP(predicted_log_fare_amount) - EXP(log_fare_amount)) BETWEEN 5 AND 15 THEN 'medium'
    ELSE 'bad'
  END AS prediction_quality,
  ROUND(EXP(log_trip_distance), 2) AS trip_distance_miles,
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
FROM
  predictions;

--Limiting to 10,000 for storage. Added a good, medium, bad buckets to assess the quality of the individual prediction based on error.