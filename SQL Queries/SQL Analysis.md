### 1️⃣ **What is the average loan amount and interest rate for each loan category?**

**SQL Query:**
```sql
SELECT 
    ROUND(AVG(loan_amnt)) as 'Average loan amount',
    ROUND(AVG(loan_int_rate)) as 'Average Interest Rate',
    loan_grade as 'Category'
FROM credit_risk 
GROUP BY loan_grade 
ORDER BY loan_grade;
```

2️⃣ **Top 10 borrowers with the longest credit history who defaulted**

**SQL Query:**
```sql
SELECT *
FROM credit_risk 
WHERE loan_status = 1
ORDER BY cb_person_cred_hist_length DESC
LIMIT 10;
```

3️⃣ **Top 5 borrowers with highest loan amounts within each loan intent category**

**SQL Query:**
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

4️⃣ **Borrowers whose loan amount is higher than the average of defaulted borrowers**

**SQL Query:**
```sql
SELECT *
FROM credit_risk 
WHERE loan_amnt > (
    SELECT AVG(loan_amnt)
    FROM credit_risk
    WHERE loan_status = 1
);
```

5️⃣ **Risk categorization based on Loan-to-Income Ratio**

**SQL Query:**
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

