### 1️⃣ **What is the average loan amount and interest rate for each loan category?**


```sql
SELECT 
    ROUND(AVG(loan_amnt)) as 'Average loan amount',
    ROUND(AVG(loan_int_rate)) as 'Average Interest Rate',
    loan_grade as 'Category'
FROM credit_risk 
GROUP BY loan_grade 
ORDER BY loan_grade;
```


- This query calculates and rounds to the nearest whole number both the average loan amount and the average interest rate across all records in the credit_risk table, groups the results by each distinct loan grade (used as the loan category, typically A to G), and finally sorts the output in ascending order by loan grade so you can easily compare risk levels from the safest (A) to the riskiest (G) categories in a single, clean result set.


### 2️⃣ **Top 10 borrowers with the longest credit history who defaulted**


```sql
SELECT *
FROM credit_risk 
WHERE loan_status = 1
ORDER BY cb_person_cred_hist_length DESC
LIMIT 10;
```


- Returns all columns for the 10 most recently charged-off loans (loan_status = 1) that have the longest borrower credit history lengths (cb_person_cred_hist_length), ordered from longest to shortest history, allowing you to quickly inspect detailed patterns or characteristics among the charged-off cases with the most established credit profiles.


### 3️⃣ **Top 5 borrowers with highest loan amounts within each loan intent category**


```sql
SELECT 
    person_id,
    loan_intent,
    loan_amnt,
    person_income,
    loan_grade
FROM (
    SELECT 
        person_id, 
        loan_intent,
        loan_amnt,
        person_income,
        loan_grade,
        ROW_NUMBER() OVER (
            PARTITION BY loan_intent 
            ORDER BY loan_amnt DESC
        ) as rn
    FROM credit_risk
) t 
WHERE rn <= 5 
ORDER BY loan_intent, loan_amnt DESC;
```


- This query uses a window function (ROW_NUMBER) to rank loans within each loan_intent group by descending loan_amnt, then filters to keep only the top 5 per intent (rn ≤ 5), and returns the person_id, loan_intent, loan_amnt, person_income, and loan_grade for these 5 largest loans per category, ordered overall by loan_intent ascending and loan_amnt descending within each group, effectively giving you the biggest loan examples for each purpose (e.g., education, medical, venture, etc.) along with borrower income and assigned risk grade.


### 4️⃣ **Borrowers whose loan amount is higher than the average of defaulted borrowers**


```sql
SELECT *
FROM credit_risk 
WHERE loan_amnt > (
    SELECT AVG(loan_amnt)
    FROM credit_risk
    WHERE loan_status = 1
);
```


- Returns complete records from the credit_risk table for all loans whose amount exceeds the average loan amount calculated only among the charged-off loans (loan_status = 1), allowing you to identify and inspect higher-amount loans that are above the typical size of defaulted/charged-off cases, which can help reveal patterns in loan sizing relative to default risk.


### 5️⃣ **Risk categorization based on Loan-to-Income Ratio**


```sql
SELECT
    person_id, 
    person_age,
    person_income,
    loan_amnt,
    loan_percent_income,
    CASE 
        WHEN loan_percent_income > 0.5 THEN 'High risk'
        WHEN loan_percent_income BETWEEN 0.25 AND 0.50 THEN 'Medium risk'
        ELSE 'Low'
    END as 'Risk'
FROM credit_risk 
ORDER BY loan_percent_income ASC;
```


- This query selects the person’s ID, age, annual income, loan amount, and loan-to-income percentage for every record in the credit_risk table, assigns a risk label ('High risk' for loans consuming more than 50% of income, 'Medium risk' for 25–50%, and 'Low' for under 25%) using a CASE statement, and sorts the entire result set in ascending order by loan_percent_income, making it easy to review borrowers from those with the lowest relative debt burden up to those facing the highest repayment pressure relative to their earnings.

  
