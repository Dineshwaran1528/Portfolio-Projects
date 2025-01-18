# COVID-19 Data Exploration
## Skills Used
Joins, Common Table Expressions (CTEs), Temporary Tables, Window Functions, Aggregate Functions, Creating Views, Data Type Conversion

## Analysis Approach

### Dataset Overview

The dataset, downloaded from a public source, contained comprehensive information about the pandemic, including:
- Total cases, new cases, total deaths, and new deaths
- Total vaccinations and individuals yet to be vaccinated
- Additional demographic and health-related data

Given the size and complexity of the dataset, it was split into two files for easier management:
1. COVID Deaths
2. COVID Vaccinations

### Data Preparation

1. Imported the split files into MySQL.
2. Performed data cleaning, including: i) Removing unnecessary columns. ii) Converting data types for better compatibility and analysis.

### Query Execution and Metrics Calculation

1. Mortality and Infection Metrics
- Death Percentage: Ratio of total deaths to total cases for a detailed understanding of disease severity.
- Infected Percentage: Proportion of the population infected with COVID-19.
- Country-wise Metrics: Identified countries with:
i) The highest infection rate.
ii) The highest death count to population ratio.

2. Global Metrics
- Total New Cases: Aggregated the daily new cases globally.
- Total New Deaths: Summed up the daily new deaths worldwide.
- New Death Percentage: Analyzed the ratio of new deaths to new cases for insights into the evolving severity of the pandemic.

4. Vaccination Metrics
- People Yet to Be Vaccinated: Determined the remaining population needing vaccination in each country.
- New Vaccinations vs. Total Population: Compared new vaccination rates against total population sizes to track progress.

## Dashboard Creation

Developed a simple dashboard to visualize key insights:
- Mortality and Infection Metrics: Charts to depict trends in death percentages, infection percentages, and country-specific metrics.
- Global Metrics: Visuals highlighting aggregated new cases, new deaths, and the new death percentage.
The dashboard provides a quick and interactive way to understand the impact of the pandemic and monitor critical metrics.


## Conclusion

This project involved exploring the COVID-19 dataset to extract actionable insights, using advanced SQL techniques like joins, CTEs, and window functions. 
The analysis provided a clear understanding of: 
- The mortality and infection trends & vaccination progress across countries.
- Global aggregated health metrics to evaluate the pandemic’s overall impact.
