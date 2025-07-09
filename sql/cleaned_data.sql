CREATE OR REPLACE TABLE `nyc-taxi-fare-april-2025.nyc_taxi_fare.cleaned_taxi_data` AS
SELECT
  -- Keep base columns
  fare_amount,
  passenger_count,
  tpep_pickup_datetime,
  tpep_dropoff_datetime,
  PULocationID,
  DOLocationID,
  trip_distance,

  -- Feature: Trip Duration in minutes
  TIMESTAMP_DIFF(tpep_dropoff_datetime, tpep_pickup_datetime, MINUTE) AS trip_duration_minutes,

  -- Feature: Hour of pickup
  EXTRACT(HOUR FROM tpep_pickup_datetime) AS pickup_hour,

  -- Feature: Day of week
  EXTRACT(DAYOFWEEK FROM tpep_pickup_datetime) AS day_of_week,



FROM
  `nyc-taxi-fare-april-2025.nyc_taxi_fare.nyc_taxi_fare_april_2025`

WHERE
  fare_amount BETWEEN 3 AND 200
  AND passenger_count BETWEEN 1 AND 6
  AND trip_distance BETWEEN .5 AND 100
  AND tpep_pickup_datetime < tpep_dropoff_datetime;