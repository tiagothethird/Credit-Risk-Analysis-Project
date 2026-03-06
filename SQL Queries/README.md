```sql
SELECT
    ROUND(AVG(loan_amnt)) AS 'Average Loan Amount',
    ROUND(AVG(loan_int_rate)) AS 'Average Interest Rate',
    loan_grade AS 'Category'
FROM credit_risk
GROUP BY loan_grade
ORDER BY loan_grade;
