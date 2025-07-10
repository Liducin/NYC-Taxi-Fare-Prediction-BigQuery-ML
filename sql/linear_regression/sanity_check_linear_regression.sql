SELECT
  predictions.predicted_fare_amount,
  data.fare_amount AS actual_fare_amount,
  ROUND(predictions.predicted_fare_amount - data.fare_amount, 2) AS error,
  data.passenger_count,
  data.trip_distance,
  data.pickup_hour,
  data.day_of_week,
  data.PULocationID,
  data.DOLocationID
FROM ML.PREDICT(
  MODEL `nyc-taxi-fare-april-2025.nyc_taxi_fare.taxi_fare_model`,
  (
    SELECT
      passenger_count,
      trip_distance,
      pickup_hour,
      day_of_week,
      PULocationID,
      DOLocationID,
      fare_amount
    FROM `nyc-taxi-fare-april-2025.nyc_taxi_fare.cleaned_taxi_data`
    LIMIT 100
  )
) AS predictions
JOIN (
  SELECT
    passenger_count,
    trip_distance,
    pickup_hour,
    day_of_week,
    PULocationID,
    DOLocationID,
    fare_amount
  FROM `nyc-taxi-fare-april-2025.nyc_taxi_fare.cleaned_taxi_data`
  LIMIT 100
) AS data
USING (passenger_count, trip_distance, pickup_hour, day_of_week, PULocationID, DOLocationID);

--Data saved locally as linear_regression_sanity_check.csv

--These predictions are very inaccurate. Looking at the actual fares, there are very high fares for very short rides.
--There are also same zone pickup (PU) and dropoff (DO). The current linear regression model doesn't take these into account well.