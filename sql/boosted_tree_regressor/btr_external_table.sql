CREATE OR REPLACE TABLE `nyc-taxi-fare-april-2025.nyc_taxi_fare.feature_engineered_data` AS
SELECT
  LOG(fare_amount + 1) AS log_fare_amount,
  LOG(trip_distance + 1) AS log_trip_distance,
  passenger_count,
  pickup_hour,
  day_of_week,
  PULocationID,
  DOLocationID,
  CASE
    WHEN PULocationID IN (132, 138) THEN 'JFK'
    WHEN PULocationID = DOLocationID THEN 'loop'
    ELSE 'standard'
  END AS trip_type
FROM `nyc-taxi-fare-april-2025.nyc_taxi_fare.cleaned_taxi_data`
WHERE
  fare_amount IS NOT NULL
  AND trip_distance BETWEEN 0.5 AND 100
  AND passenger_count BETWEEN 1 AND 6;
