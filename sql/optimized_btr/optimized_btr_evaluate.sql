SELECT
  ROUND(mean_squared_error, 2) AS mse,
  ROUND(SQRT(mean_squared_error), 2) AS rmse,
  ROUND(r2_score, 4) AS r2,
  ROUND(mean_absolute_error, 2) AS mae
FROM
  ML.EVALUATE(
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
      WHERE log_fare_amount IS NOT NULL
    )
  );
