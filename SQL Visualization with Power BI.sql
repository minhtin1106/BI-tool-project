	--- For Visualization purpose
-- 1/ Global numbers
SELECT 
	SUM(de.new_cases) as totalCases,
	SUM(de.new_deaths) as totalDeaths,
	(CAST(SUM(de.new_deaths)as NUMERIC)/ SUM(de.new_cases))*100 as deathsPercentage 
FROM 
	CovidDeaths de
WHERE de.continent IS NOT NULL

--- 2/ Continent wise numbers
SELECT
	de.continent,
	SUM(de.new_deaths) as totalDeathsCount
FROM 
	CovidDeaths de
WHERE de.continent IS NOT NULL
GROUP BY de.continent

--3/ Countries wise numbers
SELECT 
	de.location,
	de.population,
	MAX(total_cases) as highestInfectionCount,
	(CAST(MAX(total_cases) as NUMERIC)/de.population) *100 as infectedPopulationPercentage
FROM 
	CovidDeaths de
WHERE de.continent IS NOT NULL 
GROUP BY de.location, de.population
ORDER BY 4 DESC;

--4/ Countries and date wise numbers
SELECT
	de.location,
	de.population,
	de.date,
	MAX(total_cases) as highestInfectionCount,
	(CAST(MAX(total_cases)as NUMERIC)/ de.population) *100 as infectedPopulationPercentage
FROM 
	CovidDeaths de
WHERE de.continent IS NOT NULL
GROUP BY de.location, de.population, de.date
ORDER BY 1,2,3 DESC;
