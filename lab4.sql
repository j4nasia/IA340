--4.1
/* no because of the 1 to M relationship and we still have VA records */
--4.2
/* no because 80 is not a valid fips */
--4.3
/* just fine */
--4.6
/SELECT s.state_name, i.year, i.income
FROM income i
JOIN states s ON i.state_id = s.state_id
WHERE i.year = (SELECT MAX(year) FROM income)
ORDER BY i.income DESC
LIMIT 1; 

/*worked perfect */
--4.7
/WITH VA_Population AS (
    SELECT year, pop
    FROM population
    WHERE fips = '51'              -- FIPS code for Virginia
    ORDER BY year DESC
    LIMIT 6                         -- Get data for the most recent 6 years to ensure we capture the 5-year span
)
SELECT 
    (MAX(pop) - MIN(pop)) / NULLIF(MIN(pop), 0) * 100 AS growth_rate
FROM VA_Population
WHERE year BETWEEN (SELECT MAX(year) - 5 FROM VA_Population) AND (SELECT MAX(year) FROM VA_Population);

/*Didn't work */
--4.8
/* No, ChatGPT answers are not always reliable, so I had to reword and re-ask the questions to get a more precise answer */
