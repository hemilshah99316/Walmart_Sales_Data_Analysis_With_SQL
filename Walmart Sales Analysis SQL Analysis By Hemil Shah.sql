select * from Walmart_Sales_Data.dbo.Walmart_Sales

-- Step 1: Add the new column basis of time
ALTER TABLE Walmart_Sales_Data.dbo.Walmart_Sales
ADD time_of_day Varchar(15);


-- Step 2: Update the new column with values based on 'Time' Column and Segregate time based on Morning,Afternoon,Evening, 

UPDATE Walmart_Sales_Data.dbo.Walmart_Sales
SET time_of_day = 
    CASE
        WHEN Time >= '06:00:00' AND Time < '12:00:00' THEN 'Morning'
        WHEN Time >= '12:00:00' AND Time < '18:00:00' THEN 'Afternoon'
        WHEN Time >= '18:00:00' AND Time < '00:00:00' THEN 'Evening'
        ELSE 'Night'
    END;

-- Step 1: Add the new column based on Day
ALTER TABLE Walmart_Sales_Data.dbo.Walmart_Sales
ADD day_name Varchar(15);
select day_name from Walmart_Sales_Data.dbo.Walmart_Sales

-- Step 2: Update the new column with values from Date and Segregate it on basis of Weekdays Name
UPDATE Walmart_Sales_Data.dbo.Walmart_Sales 
SET day_name = DATENAME(weekday, Date );


-- Step 1: Add the new column based on Month
ALTER TABLE Walmart_Sales_Data.dbo.Walmart_Sales
ADD month_name Varchar(15);
select month_name from Walmart_Sales_Data.dbo.Walmart_Sales

-- Step 2: Update the new column with values from the Date Column and Segregate based on Month from January to December

UPDATE Walmart_Sales_Data.dbo.Walmart_Sales 
SET month_name = DATENAME(month, Date );

--Generic Question

--1. How many unique cities does the data have?

select distinct(city) as 'Unique Cities' from Walmart_Sales

--2. In which city is each branch?

select city,branch from Walmart_Sales
group by city,branch

--Product

--1. How many unique product lines does the data have?

select distinct product_line from Walmart_Sales

--2. What is the most common payment method?

select payment_method,count(payment_method) as 'No of Payments' 
from Walmart_Sales
group by payment_method 
--3. What is the most selling product line?

select top 1 product_line,count(product_line) as 'No of Product_line' 
from Walmart_Sales
group by product_line 
order by count(product_line) desc

--4. What is the total revenue by month?
select month_name,sum(total) as 'Total Income in that Month'
from Walmart_Sales
group by month_name


--5. What month had the largest COGS?
select month_name,sum(cogs) as 'Largest COGS'
from Walmart_Sales
group by month_name
order by sum(cogs) desc

--6. What product line had the largest revenue?
select product_line,sum(total) as 'Largest Revenue'
from Walmart_Sales
group by product_line
order by sum(total) desc

--5. What is the city with the largest revenue?
select city,sum(total) as 'Largest Revenue'
from Walmart_Sales
group by city
order by sum(total) desc

--6. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
WITH Sales AS (
    SELECT product_line, AVG(total) AS Average_Sales
    FROM Walmart_Sales
    GROUP BY product_line
)
SELECT product_line,
       CASE 
           WHEN Average_Sales > (SELECT AVG(Average_Sales) FROM Sales) THEN 'Good'
           ELSE 'Bad'
       END AS Classification
FROM Sales 


--7. Which branch sold more products than average product sold?
with sales as
(select sum(quantity) as Total_bills,branch from Walmart_sales
group by branch)
SELECT branch,Total_bills,
       CASE 
           WHEN Total_bills  > (SELECT sum(Total_bills)/3 FROM sales) THEN 'Higher Than Average'
           ELSE 'Lower Than Average'
       END AS Classification
FROM sales 

--8. What is the most common product line by gender?
select product_line,gender,
case 
	when gender = 'Male' then count(gender) 
	when gender ='Female'then count(gender)
end as 'gender_based_classification'
from Walmart_Sales 
group by product_line,gender
order by count(gender) desc


--9. What is the average rating of each product line?
select (round(avg(rating),2)) as 'Average_Rating',product_line
from Walmart_Sales
group by product_line

--Sales


--1. Which of the customer types brings the most revenue?

select customer_type ,sum(total) as 'Total'
from Walmart_Sales
group by customer_type

--2. Which city has the largest tax percent/ VAT (**Value Added Tax**)?
with Sum_of_Vat as
(select city,sum(VAT) as Vat_Collected
from Walmart_Sales
group by City),

Sum_of_total_Vat as
(select sum(VAT) as Total_Vat_Collected
from Walmart_Sales
)

select Sum_of_Vat.city,(Vat_Collected*100/Total_Vat_Collected) as vat_percentage
from Sum_of_Vat,Sum_of_total_Vat
order by city


--Customer

--1. How many unique customer types does the data have?

select count(distinct(customer_type)) as 'Unique_customer_type' from Walmart_Sales

--2. How many unique payment methods does the data have?

select count(distinct(payment_method)) as 'Unique_Payment_Method' from Walmart_Sales

--3. What is the most common customer type?

select  customer_type,count(invoice_id) as 'Total_Customer' from Walmart_Sales
group by customer_type


--4. What is the gender of most of the customers?
select  gender,count(invoice_id) as 'Total_Customer'
from Walmart_Sales
group by gender;

--5. What is the gender distribution per branch?

with gender_count as
(select branch,gender,count(gender) as count_of_gender
from Walmart_Sales
group by branch,gender),

gender_total as
(select branch,COUNT(gender) as Gender
from Walmart_Sales
group by branch)

select gender_count.branch,gender_count.gender, (count_of_gender*100/gender_total.Gender) as 'Gender_percentage'
from gender_count join  gender_total on gender_count.branch = gender_total.branch 
order by branch,gender


--7. Which time of the day do customers give most ratings?

select time_of_day,avg(rating) as 'Rating'
from Walmart_Sales
group by time_of_day

--8. Which time of the day do customers give most ratings per branch?

select time_of_day,Branch,avg(rating) as 'Rating'
from Walmart_Sales
group by time_of_day,Branch
order by Branch,time_of_day

--9. Which day of the week has the best average ratings per branch?
select day_name,Branch,avg(rating) as 'Rating'
from Walmart_Sales
group by day_name,Branch
order by avg(rating) desc








