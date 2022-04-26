

----------------------------------------------------------------------------------------------------------------
--  Find any square brackets and Remove them and value in them from the City column 

Select a.CIty, REPLACE(a.City, SUBSTRING(a.City, CHARINDEX('[', a.City), 3),'')
from [United States cities by population] a
WHERE CHARINDEX('[', a.City) > 0;



-- If I have permission to Update table

Update a
Set City = REPLACE(a.City, SUBSTRING(a.City, CHARINDEX('[', a.City), 3),'')
from [United States cities by population] a
WHERE CHARINDEX('[', a.City) > 0;

Select * from [United States cities by population];


-- If I don't have permission, create a Copy Instead.
Select * 
INTO CleanUS_Cities_Pop
From [United States cities by population];

Select * From CleanUS_Cities_Pop;

Update a
Set City = REPLACE(a.City, SUBSTRING(a.City, CHARINDEX('[', a.City), 3),'')
from CleanUS_Cities_Pop a
WHERE CHARINDEX('[', a.City) > 0;

----------------------------------------------------------------------------------------------------
-- Checking for Nulls in Change

Select Change from CleanUS_Cities_Pop
where Change IS NULL;

-- Comparing Change column, to calculated Perect population difference with data present
Select [2020_Census],
       [2010_Census], 
	   Change,
	   round(([2020_Census]-[2010_Census])/[2020_Census],3) Pct_Pop
	   from CleanUS_Cities_Pop

update a
SET Change =  round((a.[2020_Census]-a.[2010_Census])/a.[2020_Census],3) 
from CleanUS_Cities_Pop a;

Select * from CleanUS_Cities_Pop;






--------------------------------------------------------------------------------------------------------
--Clean Location
select RIGHT(Location,37) from CleanUS_Cities_Pop
-- Code function starts from CHARINDEX  Then Outwards
select REPLACE(REPLACE(LEFT(SUBSTRING(Location,CHARINDEX('/',Location, 30)+1,1000),15), ';',','),'�','') from CleanUS_Cities_Pop;

UPDATE a
SET Location = REPLACE(REPLACE(LEFT(SUBSTRING(a.Location,CHARINDEX('/',a.Location, 30)+1,1000),15), ';',','),'�','') 
from CleanUS_Cities_Pop a

-- Decimal Geo Location format
select * from CleanUS_Cities_Pop;


-------------------------------------------------------------------------------------------------------------------
 -- Retrieve the numerics  from the the areas columns.

 select [2020_l_area_km]from CleanUS_Cities_Pop;

  select REPLACE([2020_l_area_km],' km2',''),
         REPLACE([2020_l_area_sq],' sq mi',''),
		 REPLACE([2020_Pdensity_sq],'/sq mi',''),
		 REPLACE([2020_Pdensity_km],'/km2','')
            from CleanUS_Cities_Pop;


UPDATE a
SET [2020_l_area_km] =  REPLACE(REPLACE(a.[2020_l_area_km],' km2',''),',','') from CleanUS_Cities_Pop a;


UPDATE a
SET [2020_l_area_sq] =  REPLACE(REPLACE([2020_l_area_sq],' sq mi',''),',','') from CleanUS_Cities_Pop a;

UPDATE a
SET [2020_Pdensity_sq] =  REPLACE(REPLACE([2020_Pdensity_sq],'/sq mi',''),',','') from CleanUS_Cities_Pop a;

UPDATE a
SET [2020_Pdensity_km] =  REPLACE(REPLACE([2020_Pdensity_km],'/km2',''),',','') from CleanUS_Cities_Pop a;