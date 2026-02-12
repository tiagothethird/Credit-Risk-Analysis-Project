# 📊 Credit Risk Analysis Project

## 🎯 Project Overview

Exploratory credit risk analysis using SQL to identify default patterns and categorize borrowers based on financial indicators such as loan-to-income ratio.

---

## 🛠️ Skills & Technologies

### Technical Skills
- **SQL** - Complex queries with window functions, subqueries, and aggregations
- **Data Analysis** - Statistical analysis and pattern identification in financial datasets
- **Data Visualization** - Dashboard creation for insights communication

### Domain Knowledge
- **Credit Risk Assessment** - Risk evaluation based on loan grades and credit history
- **Financial Metrics** - Loan-to-income ratio analysis and risk categorization
- **Business Intelligence** - Transforming data into actionable insights

---

## 📈 Key Questions Analysis

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

**📊 Chart Insights:**

The dashboard reveals a **direct correlation between risk and cost of credit**. We observe that:

- **Grades A and B** (low risk): Smaller loans (~$8,500-$10,000) with interest rates of 7-11%
- **Grades C to E** (moderate risk): Progressive increase in both amount and interest
- **Grades F and G** (high risk): Larger loans (~$14,700-$17,200) with interest rates of 19-20%

This pattern reveals an interesting strategy: **financial institutions approve higher amounts for higher-risk clients but compensate this exposure by charging significantly higher rates**. It's the classic trade-off between volume and margin.

---

### 2️⃣ **Top 10 borrowers with the longest credit history who defaulted**

**SQL Query:**
```sql
SELECT *
FROM credit_risk 
WHERE loan_status = 1
ORDER BY cb_person_cred_hist_length DESC
LIMIT 10;
```

**🔍 Analysis:**

This query is particularly interesting because it **challenges a common assumption**: having a long credit history doesn't guarantee repayment. By identifying these cases, we can:

- Investigate whether there were recent changes in these borrowers' financial situations
- Check if other factors (like loan-to-income ratio) were overlooked during approval
- Assess whether history alone is an insufficient predictor of default

This type of analysis is crucial for **refining credit scoring models** and avoiding false negatives.

---

### 3️⃣ **Top 5 borrowers with highest loan amounts within each loan intent category**

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

**💡 Insights:**

Using **window functions** (`ROW_NUMBER() OVER PARTITION BY`) enables efficient segmented analysis. This query helps identify:

- Which intent categories (education, business, debt consolidation) concentrate the highest amounts
- Income profile of large loan borrowers in each category
- Distribution of risk grades among top borrowers

**Practical application**: Banks can use this to adjust credit limits specific to each loan category, rather than applying generic rules.

---

### 4️⃣ **Borrowers whose loan amount is higher than the average of defaulted borrowers**

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

**⚠️ Risk Analysis:**

This is a **red flag query**. Borrowers on this list represent exposure above the default pattern, which suggests:

- Need for closer monitoring of these loans
- Possible review of approval policies for high amounts
- Opportunity to offer credit insurance or additional guarantees

The defaulters' average works as an **alert benchmark**: exceeding it should trigger more rigorous credit reviews.

---

### 5️⃣ **Risk categorization based on Loan-to-Income Ratio**

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

**📊 Data Distribution:**

Based on the **28,631 records** analyzed:

- **Low Risk**: 22,568 borrowers (78.8%) - loan/income ≤ 25%
- **Medium Risk**: 5,846 borrowers (20.4%) - loan/income between 25-50%
- **High Risk**: 217 borrowers (0.8%) - loan/income > 50%

**🎯 Key Findings:**

1. **The vast majority maintains healthy debt levels**: Almost 80% of borrowers commit less than 25% of their income to the loan

2. **Attention zone**: The 20% in medium risk represents a significant volume that deserves specific monitoring policies

3. **Extreme cases are rare but critical**: Only 217 people (0.8%) are at high risk, but these cases can represent **disproportionate losses** if not properly managed

4. **Upsell opportunity**: Low-risk borrowers with good payment capacity may be eligible for additional financial products

---

## 🔑 Key Insights & Conclusions

### 💼 For Risk Management

**1. Risk and Price go hand in hand**  
The analysis confirms that the market correctly prices risk: higher grades pay up to **3x more interest** than lower grades. This is healthy but requires constant monitoring to avoid predatory lending.

**2. History isn't everything**  
Finding defaulters with long credit history shows that **models need to be multidimensional**. Variables like recent income changes, current loan-to-income, and loan purpose are equally important.

**3. Risk concentration**  
Identifying loans above the default average allows creating **preventive mitigation strategies**, such as larger capital reserves for this portfolio.

### 📊 For Business Strategy

**1. Segmentation is fundamental**  
Different loan intents have different risk profiles and average ticket sizes. A "one-size-fits-all" approach leaves money on the table.

**2. Healthy base**  
With 78.8% of the portfolio at low risk, there's **structural solidity**, but also opportunity to grow in medium-risk segments with proper pricing.

**3. Exceptions deserve attention**  
The 0.8% at high risk may seem irrelevant, but in a multi-million portfolio, they represent **material exposure** that justifies specific collection and recovery processes.

### 🚀 Suggested Next Steps

1. **Temporal analysis**: Investigate how default rates vary over time and identify seasonality
2. **Predictive model**: Use identified patterns to train a machine learning default prediction model
3. **Vintage analysis**: Evaluate loan cohort performance by origination period
4. **Stress testing**: Simulate adverse economic scenarios and their impact on the portfolio

---

## 📁 Project Files

- `credit_analysis_risk.csv` - Dataset with 28,631 loan records
- `credit_analysis.sql` - SQL queries for exploratory analysis
- `Credit_Risk_Analysis.docx` - Business questions documentation
- `Credit_Risk_DASHBOARD.pdf` - Visualizations and insight charts

---

## 🙏 Acknowledgments

This project demonstrates how **well-structured SQL** and **business-focused data analysis** can transform raw data into concrete strategic decisions. The combination of analytical techniques (window functions, subqueries, aggregations) with domain knowledge (credit risk, financial ratios) is what differentiates descriptive analysis from actionable analysis.

