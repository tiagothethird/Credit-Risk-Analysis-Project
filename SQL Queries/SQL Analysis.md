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
