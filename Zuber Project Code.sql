SELECT cabs.company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN trips ON trips.cab_id=cabs.cab_id
WHERE CAST(trips.start_ts AS date) BETWEEN'2017-11-15' AND '2017-11-16'
GROUP BY company_name
ORDER BY trips_amount DESC;

SELECT 
    cabs.company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN trips ON trips.cab_id= cabs.cab_id
WHERE 
    cabs.company_name LIKE'%Yellow%' AND CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY 
    company_name
UNION ALL 
SELECT 
    cabs.company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN trips ON trips.cab_id= cabs.cab_id
WHERE 
    cabs.company_name LIKE '%Blue%' AND CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY 
    company_name;

SELECT 
CASE 
    WHEN company_name ='Flash Cab' THEN 'Flash Cab'
    WHEN company_name= 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services'
ELSE 'Other'
END AS company,
COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN trips ON trips.cab_id= cabs.cab_id
WHERE 
    CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY 
    company
    ORDER BY 
    trips_amount DESC;

SELECT 
    neighborhood_id,
    name
FROM 
    neighborhoods 
WHERE name LIKE '%Hare%' OR name LIKE 'Loop%'

SELECT 
    ts,
CASE WHEN description LIKE'%rain%' OR description LIKE '%storm%'
     THEN 'Bad' ELSE 'Good' END AS weather_conditions
FROM 
weather_records;

SELECT 
    start_ts,
    CASE 
        WHEN weather_records.description LIKE '%rain%' OR weather_records.description LIKE '%storm%' THEN 'Bad'
        ELSE 'Good'
    END AS weather_conditions,
    duration_seconds
FROM 
    trips
INNER JOIN 
    weather_records ON weather_records.ts=trips.start_ts
WHERE 
    trips.pickup_location_id = 50 
    AND trips.dropoff_location_id = 63
    AND EXTRACT(DOW FROM trips.start_ts) = 6
ORDER BY 
    trips.trip_id;

