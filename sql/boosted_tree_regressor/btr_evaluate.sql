SELECT *
FROM ML.EVALUATE(
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
  )
);

--results saved under btr_evaluate_data.csv