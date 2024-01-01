
-- DONE: What is the average, maximum, and minimum magnitude of earthquakes in the dataset?
    SELECT
        MIN(magnitude) AS "Minimum Magnitude", -- 6.5
       MAX(magnitude) AS "Maximum Magnitude", -- 9.1
       AVG(magnitude) AS "Average Magnitude"-- 6.94015
    FROM "earthquake_95-23";


-- DONE: How many earthquakes of magnitude greater than 8 occurred in the dataset?
    SELECT COUNT()
    FROM "earthquake_95-23"
    WHERE magnitude > 8.0; -- 24

-- DONE: How many earthquakes of magnitude 7 or higher occurred in each country?
    SELECT COUNT()
    FROM "earthquake_95-23"
    WHERE magnitude > 7.0; -- 303

-- DONE: How many earthquakes of magnitude 6 or higher occurred in each country?
    SELECT COUNT()
    FROM "earthquake_95-23"
    WHERE magnitude > 6.0; -- 1000


-- DONE: How many earthquakes occurred each year in the dataset?
    SELECT DISTINCT (STRFTIME('%Y', date)) AS Year,
                    COUNT(*) AS Amount
    FROM "earthquake_95-23"
    GROUP BY Year
    ORDER BY Year DESC;

-- DONE: Which month saw the highest number of earthquakes?
    SELECT DISTINCT (STRFTIME('%m', date)) AS Month,
                    COUNT(*) AS Amount
    FROM "earthquake_95-23"
    GROUP BY Month; --November

-- DONE: Are there any noticeable trends or patterns in earthquake occurrences over the years?
  SELECT DISTINCT (STRFTIME('%Y', date)) AS Year,
      COUNT(*) AS Amount
    FROM "earthquake_95-23"
    GROUP BY Year
    ORDER BY Year DESC; --  2012 - 2019 shows the biggest and consistent deviation of earthquakes.
    -- an uptick in earthquakes seems to be occurring since mid 2009 (appx)

-- DONE: How many earthquakes were reported with a CDI (Did You Feel It?) intensity above a certain threshold
--      (e.g., CDI > 5)?
    SELECT COUNT(*) AS 'Earthquakes above a 460 CDI'
    FROM "earthquake_95-23"
    WHERE cdi >= 5;

-- DONE: How many earthquakes with an alert were reported, and how many of them led to tsunamis?
    SELECT COUNT(*) AS'Reported alert' -- Reported alerts
    FROM "earthquake_95-23"
    WHERE alert IS NOT NULL; -- 449 reported alerts

    SELECT COUNT(*) AS'Reported alert with tsunami' -- Reported alerts that let to a tsunami
    FROM "earthquake_95-23"
    WHERE alert IS NOT NULL AND tsunami = 1; --319 alerts

-- DONE: How many earthquakes occurred in each alert zone that had tsunamis
    SELECT
        CASE
            WHEN alert = 'green' THEN 'Green Alert'
            WHEN alert = 'yellow' THEN 'Yellow Alert'
            WHEN alert = 'red' THEN 'Red Alert'
            WHEN alert = 'orange' THEN 'Orange Alert'
    ELSE 'Other' END 'Alert Color',
    COUNT(tsunami) AS 'Tsunami Count'
    FROM "earthquake_95-23"
    GROUP BY "Alert Color";

-- DONE: Which countries or continents experienced the highest number of earthquakes?
    SELECT country,
           COUNT(country) AS 'Amount'
    FROM "earthquake_95-23"
    GROUP BY country
    ORDER BY Amount DESC;

-- DONE: What are the coordinates (latitude and longitude) of the earthquake with the highest magnitude?
    SELECT country,
           longitude,
           latitude,
           MAX(magnitude)
    FROM "earthquake_95-23";

-- DONE: Are there any patterns in earthquake depths across different continents or countries?

-- Month and year
    SELECT DISTINCT (STRFTIME('%m %Y', date)) AS Date,
                    AVG(depth)
    FROM "earthquake_95-23"
    GROUP BY Date;

    SELECT DISTINCT (STRFTIME('%m', date)) AS Month,
                    COUNT(*) AS Amount,
                    AVG(depth)
    FROM "earthquake_95-23"
    GROUP BY Month;

-- DONE: Which seismic network (net) reported the most earthquakes in the dataset?
    SELECT COUNT(net) AS Reported,
           net AS 'Net Reported'
    FROM "earthquake_95-23"
    GROUP BY net
    ORDER BY Reported DESC;

-- DONE: How many earthquakes were reported by each seismic network?
    SELECT COUNT(net) AS 'Reported earthquakes',
           net AS 'Network Reported'
    FROM "earthquake_95-23"
    GROUP BY net
    ORDER BY "Reported earthquakes" DESC;

-- DONE: Is there a correlation between the number of earthquakes reported by a network and the magnitude of those
--  earthquakes?

-- Average magnitude of reported quakes by each network
    SELECT net AS 'Network Reported',
           COUNT(net) AS 'Reported earthquakes',
           AVG(magnitude) AS 'Average magnitude'
    FROM "earthquake_95-23"
    GROUP BY net
    ORDER BY "Reported earthquakes" DESC;

-- AK net report
    SELECT net,
           magnitude
    FROM "earthquake_95-23"
    WHERE net = 'ak'
    ORDER BY magnitude DESC;

-- US net report with avg max and min
        SELECT net,
               AVG (magnitude) AS 'Average Magnitude',
               MIN(magnitude) AS 'Minimum Magnitude',
               MAX(magnitude) AS 'Maximum Magnitude'
    FROM "earthquake_95-23"
    WHERE net = 'us';

        SELECT
            CASE
                WHEN magnitude >= 8 THEN '8±'
                WHEN  magnitude >=7 THEN '7±'
                WHEN magnitude >= 6 THEN '6±'
            END AS 'Magnitude'
    FROM "earthquake_95-23"
    WHERE net = 'us'
    ORDER BY magnitude DESC;

    SELECT COUNT(net)
    FROM "earthquake_95-23"
    WHERE magnitude >= 8; -- For the US: 1000 in the 6 range, 373 in the 7 range, and 32 in the 8 range. All other reported
    -- are very minimal in number.

-- DONE: What are the different types of magnitude (magType) reported in the dataset, and how many earthquakes are
--  associated with each type?
    SELECT magType AS 'Magnitude Type',
           COUNT(magType) AS 'Amount'
    FROM "earthquake_95-23"
    GROUP BY magType;

-- DONE: Is there a correlation between the magnitude type and the reported magnitude values?
    SELECT magType AS 'Magnitude Type',
           COUNT(magType) AS 'Amount',
           AVG(magnitude) AS 'Average Magnitude Values'
    FROM "earthquake_95-23"
    GROUP BY magType;


-- DONE: How many earthquakes had a significant value (sig) above a certain threshold?
    SELECT MAX(sig), MIN(sig)
    FROM "earthquake_95-23";

    SELECT country, sig
    FROM "earthquake_95-23"
    WHERE sig >= 1500 AND country IS NOT NULL -- set threshold at 1500
    ORDER BY sig DESC;

-- DONE: What is the average number of seismic stations (nst) reporting an earthquake?
    SELECT AVG(nst) AS 'Average Seismic Stations'
    FROM "earthquake_95-23";

-- DONE: What is the amount of seismic stations that reported an earthquake that was at or above orange alert status?
    SELECT DISTINCT(alert) AS 'Alert Status', COUNT(*) AS 'Amount'
    FROM "earthquake_95-23"
    WHERE alert IS NOT NULL
      AND alert IS NOT 'green'
      AND alert IS NOT 'yellow'
    GROUP BY "Alert Status"; -- orange = 24, red = 13

-- DONE: What is the amount of earthquakes that happen in every 100' depth?
SELECT
    CASE
        WHEN depth BETWEEN 0 AND 100 THEN '<= 100'
        WHEN depth BETWEEN 100 AND 200 THEN '<= 200'
        WHEN depth BETWEEN 200 AND 300 THEN '<= 300'
        WHEN depth BETWEEN 300 AND 400 THEN '<= 400'
        WHEN depth BETWEEN 400 AND 500  THEN '<= 500'
        WHEN depth BETWEEN 500 AND 600  THEN '<= 600'
        WHEN depth BETWEEN 600 AND 700  THEN '<= 700'
    END AS "Earthquake Depth",
    COUNT('depth') AS 'Total Quakes'
FROM "earthquake_95-23"
GROUP BY "Earthquake Depth";

