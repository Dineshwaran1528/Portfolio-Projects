/* Queries to use for tableau to visualize and create a dashboard */

-- 1.

SELECT 
    SUM(new_cases) AS tot_new_cases,
    SUM(new_deaths) AS tot_new_deaths,
    (SUM(new_deaths) / SUM(new_cases)) * 100 AS Percent_of_New_deaths
FROM covid_deaths;

-- 2.

SELECT continent, SUM(new_deaths) AS TotalDeathCount
FROM covid_deaths
GROUP BY continent
ORDER BY TotalDeathCount DESC;


-- 3.

SELECT 
    Location,
    Population,
    MAX(total_cases) AS HighestInfectionCount,
    MAX((total_cases / population)) * 100 AS Highest_percentage_Infected
FROM covid_deaths
GROUP BY Location , Population
ORDER BY Highest_percentage_Infected DESC;


-- 4.

SELECT 
    Location,
    Population,
    date,
    MAX(total_cases) AS HighestInfectionCount,
    MAX((total_cases / population)) * 100 AS Highest_percentage_Infected
FROM covid_deaths
GROUP BY Location , Population , date
ORDER BY Highest_percentage_Infected DESC