--4.1
/* no because of the 1 to M relationship and we still have VA records */
--4.2
/* no because 80 is not a valid fips */
--4.3
/* just fine */
--4.6
/* WITH RecentIncome AS (
    SELECT fips, MAX(year) AS recent_year
    FROM income
    GROUP BY fips
)
SELECT n.name, i.income, i.year
FROM income i
JOIN name n ON i.fips = n.fips
JOIN RecentIncome r ON i.fips = r.fips AND i.year = r.recent_year
ORDER BY i.income DESC
LIMIT 1; worked perfect */
--4.7
/* WITH VA_Population AS (
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
Didn't work */
