# Real Estate Housing Data Cleaning
## About the Data
The dataset contains information about real estate properties, including:

- Location: Property location and land area.
- Property Details: Current value, sold value, and whether the property was sold as vacant or with a building.
- Building Features: Number of bedrooms, full baths, half baths, and the year built.
- Ownership: Owner's name, address, and property address.

## Functions Used
* IS NULL: To identify and handle missing data.
* STR_TO_DATE: To convert date formats into MySQL-compatible formats.
* IF NULL: To replace null values with defaults or placeholders.
* TRIM: To clean up leading/trailing spaces in text fields.
* CTEs (Common Table Expressions): For efficient data transformations.
* DELETE & DROP: To remove unwanted rows and columns.
* NULLIF: To assign null values to specific empty cells.


## Data Cleaning Steps
1. Data Import and Initial Preparation
   - Imported the dataset from an Excel file into MySQL.
   - Adjusted column data types to align with database requirements.

2. Date Standardization
   - Corrected date formats using the **STR_TO_DATE** function to ensure MySQL compatibility.

3. Handling Missing Values
   - Populated empty property address data using **IS NULL** and **IF NULL** functions along with **UPDATE** statements.

4. Address Separation
   - Separated improper entries in '_PropertyAddress_' and '_OwnerAddress_' columns into:
     - '_Property_Address_', '_Property_City_'.
     - '_Owner_Address_', '_Owner_City_', '_Owner_State_'.
   - Used **TRIM** and **SUBSTRING_INDEX** functions to parse the data.

5. Standardizing SoldAsVacant Column

   - Replaced "Y" and "N" values in the '_SoldAsVacant_' column with "Yes" and "No" using a **CASE** statement.

6. Removing Duplicates

   - Used **CTEs** and window functions to identify and remove duplicate rows.
   - Applied the **DELETE** command to eliminate unnecessary duplicates.

7. Assigning NULL Values

   - Updated empty cells in relevant columns by assigning NULL values using **NULLIF** and **UPDATE** commands.

## Conclusion
The cleaning process resulted in a well-structured and standardized dataset, ready for further analysis or integration into applications. 

+ Addressing missing and inconsistent data, ensuring accuracy.
+ Standardizing formats and values for better readability and usability.
+ Removing duplicates to avoid data redundancy.

