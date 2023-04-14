-- This project is based on Covid-19 data downloaded from " https://covid.ourworldindata.org " on Apr 5th, 2023

/*

Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

*/


select *
from covid_deaths
order by 3,4;

-- Select the columns from the table that we are using for the project

select location, date, population, total_cases, new_cases, total_deaths
from covid_deaths
order by 1,2;

-- Get the results of Total deaths vs Total cases as 'death percentage' for any country (Shows percentage of people died)

select location, date, population, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
from covid_deaths
where location = 'India'
order by date;

-- Calculate the Total cases vs Population as 'Infected Percentage' (Shows percentage of people getting infected)

select location, date, population, total_cases, (total_cases/population)*100 as infected_percentage
from covid_deaths
where location = 'India'
order by date;

-- Country with the highest Infection rate to Population

select location, population, max(total_cases) as Highest_infection_count, max((total_cases/population))*100 as Highest_percentage_Infected
from covid_deaths
-- where location = 'India'
group by location, population
order by Highest_percentage_Infected desc;

-- Country with the highest Death count to Population

select continent, location, max(total_deaths) as Highest_Death_count
from covid_deaths
group by continent, location
order by continent, location, Highest_Death_Count desc;

-- Getting the highest death count based on the continent

select continent, location, max(total_deaths) as Highest_Death_count
from covid_deaths
-- where continent <> '' (If we use this where statement the continent filled with details is only displayed in the result)
group by continent, location
order by Highest_Death_Count desc;

-- Let's get the 'Global numbers' for each date

select date, sum(new_cases) as tot_new_cases, sum(new_deaths) as tot_new_deaths, (sum(new_deaths)/sum(new_cases))*100 as Percent_of_New_deaths
from covid_deaths
group by date
order by date;

-- Calculating the people yet to get vaccinated on continent

select Continent , date, sum(population) as total_population, sum(total_vaccinations) as vaccinations, (sum(population)-sum(total_vaccinations)) as People_to_get_vaccinated
from covid_vaccinations
-- where location = 'India'
group by Continent
order by Continent;

-- Extract all the values from both tables using inner join

select *
from covid_deaths as dea
join covid_vaccinations as vac
on dea.location = vac.location and dea.date = vac.date;

-- Let's look at New Vaccinations vs Total population

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, vac.new_vaccinations 
from covid_deaths as dea
join covid_vaccinations as vac
on dea.location = vac.location and dea.date = vac.date
order by 1,2,3;

-- Find the count of people vaccinated

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(new_vaccinations) over (partition by 
location order by location, date) as Rolling_count_of_people_vaccinated
from covid_deaths as dea
join covid_vaccinations as vac
on dea.location = vac.location and dea.date = vac.date
order by 1,2,3;
-- where dea.location = 'India';

-- Create CTE (Common table expression) to calculate Rolling_count_of_people_vaccinated

with PopvsVac (continent, location, date, population, new_vaccinations, Rolling_count_of_people_vaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(new_vaccinations) over (partition by 
location order by location, date) as Rolling_count_of_people_vaccinated
from covid_deaths as dea
join covid_vaccinations as vac
on dea.location = vac.location and dea.date = vac.date
)
select *, (Rolling_count_of_people_vaccinated/population)*100 as PercentOfRollingPeopleVaccinated /* We have to run this select query with CTE to avoid error */
from PopvsVac;
-- where location = 'India';

-- Creating a temp table to calculate Rolling_count_of_people_vaccinated

CREATE TEMPORARY TABLE PercentPeopleVaccinated 
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(new_vaccinations) over (partition by 
location order by location, date) as Rolling_count_of_people_vaccinated
from covid_deaths as dea
join covid_vaccinations as vac
on dea.location = vac.location and dea.date = vac.date
where dea.location = 'India';

-- drop temporary table PercentPeopleVaccinated; (to drop temp table if wanted)

select *, (Rolling_count_of_people_vaccinated/population)*100 as PercentOfRollingPeopleVaccinated 
from PercentPeopleVaccinated;

-- Create a view for quick look at the required data

create view VaccinatedPopulationPercentage as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(new_vaccinations) over (partition by 
location order by location, date) as Rolling_count_of_people_vaccinated
from covid_deaths as dea
join covid_vaccinations as vac
on dea.location = vac.location and dea.date = vac.date
where dea.location = 'India';

select * from vaccinatedpopulationpercentage
