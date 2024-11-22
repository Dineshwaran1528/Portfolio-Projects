/* Data cleaning with SQL queries */

SELECT *
FROM house_data;

-- Changing the Date to correct format for MySQL

SELECT SaleDate, STR_TO_DATE(SaleDate, '%M %e, %Y')
FROM house_data;

UPDATE house_data 
SET SaleDate = STR_TO_DATE(SaleDate, '%M %e, %Y');

-- Populate the Empty Property Address Data

SELECT *
from house_data
-- where PropertyAddress is null
order by ParcelID;

SELECT a.UniqueID, a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress 
from house_data a
join house_data b
	on a.ParcelID = b.ParcelID
    and a.UniqueID <> b.UniqueID
where a.PropertyAddress is null;

update house_data a
join house_data b
	on a.ParcelID = b.ParcelID
    and a.UniqueID <> b.UniqueID
set a.PropertyAddress = ifnull(a.PropertyAddress,b.PropertyAddress)
where a.PropertyAddress is null;

-- Seperating the PropertyAddress & OwnerAddress into Address, City, State columns

SELECT PropertyAddress
from house_data; -- checking for the delimiter used for PropertyAddress column

alter table house_data
Add Property_Address text after LandUse, 
add Property_City text after Property_Address;

update house_data 
 set Property_Address = TRIM(SUBSTRING_INDEX(PropertyAddress, ',', 1)), 
  Property_City = TRIM(SUBSTRING_INDEX(PropertyAddress, ',', -1));



SELECT OwnerAddress
from house_data;  -- checking for the delimiter used for OwnerAddress column

alter table house_data
Add Owner_Address text after OwnerName, 
add Owner_City text after Owner_Address,
add Owner_State text after Owner_City;

update house_data
set  
	Owner_Address = TRIM(SUBSTRING_INDEX(OwnerAddress, ',', 1)),
	Owner_City = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(OwnerAddress, ',', 2), ',', -1)), 
	Owner_State = TRIM(SUBSTRING_INDEX(OwnerAddress, ',', -1));

-- Change Y and N to Yes and No in the "SoldAsVacant" column

SELECT distinct(SoldAsVacant), count(SoldAsVacant)
from house_data
group by SoldAsVacant
order by 2;

SELECT SoldAsVacant,
case
	when SoldAsVacant = 'Y' then 'Yes'
    when SoldAsVacant = 'N' then 'No'
    else SoldAsVacant
    END
from house_data;

update house_data
set SoldAsVacant = case
	when SoldAsVacant = 'Y' then 'Yes'
    when SoldAsVacant = 'N' then 'No'
    else SoldAsVacant
    END;


-- Remove Duplicates (To remove duplicates it is advised to create a temp table and not to do it actual data)

with RowNumCTE as (
select *, 
	row_number() over (
    partition by ParcelID, Property_Address, Property_City, SaleDate, SalePrice, LegalReference
    order by UniqueID
					   ) row_num			 
from house_data
-- order by ParcelID
)
select * 
from RowNumCTE
where row_num >1  -- This is to find the duplicate rows
order by Property_Address; 

with RowNumCTE as (
select *, 
	row_number() over (
    partition by ParcelID, Property_Address, Property_City, SaleDate, SalePrice, LegalReference
    order by UniqueID
					   ) row_num			 
from house_data
-- order by ParcelID
)
DELETE FROM house_data 
WHERE UniqueID IN (SELECT UniqueID FROM RowNumCTE where row_num >1);  -- This is to delete the duplicate rows


-- Delete Unused columns (It is advised not to delete the unused columns from the raw data)

SELECT *
FROM house_data;

alter table house_data
drop column OwnerAddress, 
Drop column TaxDistrict;

-- Assigned NULL values to empty cells in the required columns of the dataset.

UPDATE house_data 
SET OwnerName = NULLIF(OwnerName, ''),
OwnerAddress = NULLIF(OwnerAddress, ''),
Acreage = NULLIF(Acreage, ''),
TaxDistrict = NULLIF(TaxDistrict, ''),
LandValue = NULLIF(LandValue, ''),
BuildingValue = NULLIF(BuildingValue, ''),
TotalValue = NULLIF(TotalValue, ''),
YearBuilt = NULLIF(YearBuilt, ''),
Bedrooms = NULLIF(Bedrooms, ''),
FullBath = NULLIF(FullBath, ''),
HalfBath = NULLIF(HalfBath, '');