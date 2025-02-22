-- Beginner-Level Questions

-- 1. List the top 10 most valuable unicorn companies.
SELECT Company, Valuation 
FROM unicorn_companies 
ORDER BY Valuation DESC 
LIMIT 10;

-- 2. Find the total number of unicorn companies in the dataset.
SELECT COUNT(*) AS Total_Unicorns 
FROM unicorn_companies;

-- 3. Retrieve all unicorn companies founded before 2010.
SELECT * 
FROM unicorn_companies 
WHERE Year_founded < 2010;

-- 4. Show the number of unicorn companies per industry.
SELECT Industry, COUNT(*) AS Num_Companies 
FROM unicorn_companies 
GROUP BY Industry;

-- 5. Find the unicorn companies that have received the highest funding.
SELECT Company, Funding 
FROM unicorn_companies 
ORDER BY Funding DESC 
LIMIT 10;

-- 6. List all companies that became unicorns in 2020.
SELECT * 
FROM unicorn_companies 
WHERE YEAR(Date_joined) = 2020;

-- 7. Find all unicorns based in India.
SELECT * 
FROM unicorn_companies 
WHERE Country = 'India';

-- 8. Find unicorns from the technology industry.
SELECT * 
FROM unicorn_companies 
WHERE Industry LIKE '%Technology%';

-- 9. Identify the most recent unicorn.
SELECT * 
FROM unicorn_companies 
ORDER BY Date_joined DESC 
LIMIT 1;

-- 10. Find the earliest unicorn.
SELECT * 
FROM unicorn_companies 
ORDER BY Date_joined ASC 
LIMIT 1;

-- Intermediate-Level Questions

-- 1. Calculate the average valuation of unicorn companies.
SELECT AVG(Valuation) AS Avg_Valuation 
FROM unicorn_companies;

-- 2. Find the industry with the highest total valuation.
SELECT Industry, SUM(Valuation) AS Total_Valuation 
FROM unicorn_companies 
GROUP BY Industry 
ORDER BY Total_Valuation DESC 
LIMIT 1;

-- 3. Find the top 3 countries with the most unicorn companies.
SELECT Country, COUNT(*) AS Num_Companies 
FROM unicorn_companies 
GROUP BY Country 
ORDER BY Num_Companies DESC 
LIMIT 3;

-- 4. Find the funding-to-valuation ratio for each company.
SELECT Company, (Funding / Valuation) AS Funding_To_Valuation_Ratio 
FROM unicorn_companies;

-- 5. Identify companies with valuations greater than 10 times their funding.
SELECT * 
FROM unicorn_companies 
WHERE Valuation > 10 * Funding;

-- 6. Find the youngest unicorns based on the year founded.
SELECT * 
FROM unicorn_companies 
ORDER BY Year_founded DESC 
LIMIT 10;

-- 7. Identify industries with an average valuation above $5B.
SELECT Industry, AVG(Valuation) AS Avg_Valuation 
FROM unicorn_companies 
GROUP BY Industry 
HAVING Avg_Valuation > 5000000000;

-- 8. Calculate the time taken for each company to become a unicorn.
SELECT Company, (YEAR(Date_joined) - Year_founded) AS Years_To_Unicorn 
FROM unicorn_companies;

-- 9. Find the investors who funded the highest number of unicorns.
SELECT Select_investors, COUNT(*) AS Num_Investments 
FROM unicorn_companies 
GROUP BY Select_investors 
ORDER BY Num_Investments DESC 
LIMIT 10;

-- 10. Identify countries where unicorns have the shortest time to reach unicorn status.
SELECT Country, AVG(YEAR(Date_joined) - Year_founded) AS Avg_Years_To_Unicorn 
FROM unicorn_companies 
GROUP BY Country 
ORDER BY Avg_Years_To_Unicorn ASC 
LIMIT 5;

-- Advanced-Level Questions

-- 1. Find the year with the highest number of new unicorns.
SELECT YEAR(Date_joined) AS Year, COUNT(*) AS Num_Unicorns 
FROM unicorn_companies 
GROUP BY Year 
ORDER BY Num_Unicorns DESC 
LIMIT 1;

-- 2. Find the company that took the longest time to become a unicorn.
SELECT Company, (YEAR(Date_joined) - Year_founded) AS Years_To_Unicorn 
FROM unicorn_companies 
ORDER BY Years_To_Unicorn DESC 
LIMIT 1;

-- 3. Calculate the total valuation of all unicorns per continent.
SELECT Continent, SUM(Valuation) AS Total_Valuation 
FROM unicorn_companies 
GROUP BY Continent;

-- 4. Find unicorns that are in the top 10% based on valuation.
SELECT * 
FROM unicorn_companies 
WHERE Valuation >= (SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY Valuation) FROM unicorn_companies);

-- 5. Identify the fastest-growing industries based on the average time to unicorn status.
SELECT Industry, AVG(YEAR(Date_joined) - Year_founded) AS Avg_Years_To_Unicorn 
FROM unicorn_companies 
GROUP BY Industry 
ORDER BY Avg_Years_To_Unicorn ASC 
LIMIT 5;

-- 6. Find the company with the highest valuation-to-funding ratio.
SELECT Company, (Valuation / Funding) AS Valuation_To_Funding_Ratio 
FROM unicorn_companies 
ORDER BY Valuation_To_Funding_Ratio DESC 
LIMIT 1;

-- 7. Find the most common year when unicorns were founded.
SELECT Year_founded, COUNT(*) AS Num_Companies 
FROM unicorn_companies 
GROUP BY Year_founded 
ORDER BY Num_Companies DESC 
LIMIT 1;

-- 8. List companies with valuations higher than the industry average.
SELECT Company, Industry, Valuation 
FROM unicorn_companies u1 
WHERE Valuation > (SELECT AVG(Valuation) FROM unicorn_companies u2 WHERE u1.Industry = u2.Industry);

-- 9. Find investors who funded unicorns in multiple industries.
SELECT Select_investors, COUNT(DISTINCT Industry) AS Num_Industries 
FROM unicorn_companies 
GROUP BY Select_investors 
HAVING Num_Industries > 1 
ORDER BY Num_Industries DESC;

-- 10. Identify unicorns that were founded after 2015 and became unicorns within 3 years.
SELECT * 
FROM unicorn_companies 
WHERE Year_founded > 2015 AND (YEAR(Date_joined) - Year_founded) <= 3;
