SELECT * FROM world_population.2024_world_population;

USE world_population;

ALTER TABLE 2024_world_population
RENAME TO worldpopulation;

ALTER TABLE worldpopulation
RENAME COLUMN `ï»¿Ranking` TO Ranking;

UPDATE worldpopulation
SET Percentage_urban_population = replace(Percentage_urban_population, 'N.A.', NULL)
WHERE Percentage_urban_population LIKE 'N.A.';

UPDATE worldpopulation
SET Percentage_urban_population = replace(Percentage_urban_population, '%', '')
WHERE Percentage_urban_population LIKE '%';

ALTER TABLE worldpopulation
MODIFY COLUMN Percentage_urban_population INT;

DESC worldpopulation;

SELECT * FROM worldpopulation;

-- Exploratory Data Analysis (EDA) KPIs --
-- Top 10 Countries by Population: Identify the most populated nations.

SELECT Ranking, Country, Population_2024 
FROM worldpopulation
ORDER BY Population_2024 DESC
LIMIT 10;

-- Bottom 10 Countries by population

SELECT Ranking, Country, Population_2024 
FROM worldpopulation
ORDER BY Population_2024 ASC
LIMIT 10;

-- Highest & Lowest Growth Rates: Rank countries by yearly population change.
-- Highest Growth rates
SELECT Ranking,Country, Population_2024, Yearly_Change 
FROM worldpopulation
ORDER BY Yearly_Change DESC
LIMIT 5 ;

-- Lowest Growth rates
SELECT Ranking,Country, Population_2024, Yearly_Change 
FROM worldpopulation
ORDER BY Yearly_Change ASC
LIMIT 5 ;

-- Population Density Analysis: Find countries with the highest and lowest densities.
-- Countries with high densities

SELECT Country, Population_density_per_square_km
FROM worldpopulation
ORDER BY Population_density_per_square_km DESC;

-- Countries with Low densities

SELECT Country, Population_density_per_square_km
FROM worldpopulation
ORDER BY Population_density_per_square_km ASC;


-- Migration Impact: Analyze which countries have the highest net migration.
-- Countries with the highest net migration
SELECT Country, Population_2024 ,Migrants
FROM worldpopulation
ORDER BY Migrants DESC;

-- Countries with the Lowest net migration
SELECT Country, Population_2024 ,Migrants
FROM worldpopulation
ORDER BY Migrants ASC;

-- Fertility Rate Trends: Identify how fertility rates correlate with population growth.

SELECT Country, Population_2024, Yearly_Change,Fertility_Rate
FROM worldpopulation
ORDER BY Fertility_Rate DESC;

-- Countries with the highest urban population

SELECT Country, Population_2024, Percentage_urban_population
FROM worldpopulation
WHERE Country LIKE '%cura%'
ORDER BY Percentage_urban_population DESC;