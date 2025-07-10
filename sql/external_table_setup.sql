CREATE OR REPLACE EXTERNAL TABLE `nyc-taxi-fare-april-2025.nyc_taxi_fare.nyc_taxi_fare_april_2025`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://nyc-taxi-fare-april-2025/yellow_tripdata_2025-04.parquet']
);
