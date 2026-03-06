# 📊 Credit Risk Analysis Project

##  Project Overview

This project performs an exploratory credit risk analysis on a financial lending dataset to uncover patterns associated with borrower defaults and financial behavior. The primary aim is to understand key factors that influence credit risk and to categorize borrowers based on risk indicators such as loan amount, interest rate, credit history, and debt burden. Using advanced SQL queries and statistical analysis, this work provides meaningful insights into default patterns and highlights relationships between borrower financial characteristics and credit outcomes.

-------------------------------------------------------------------------------------------------------------------------------------------

##  Skills & Technologies

### Technical Skills
- **SQL** - Complex queries with window functions, subqueries, and aggregations
- **Data Analysis** - Statistical analysis and pattern identification in financial datasets
- **Data Visualization** - Dashboard creation for insights communication

### Domain Knowledge
- **Credit Risk Assessment** - Risk evaluation based on loan grades and credit history
- **Financial Metrics** - Loan-to-income ratio analysis and risk categorization
- **Business Intelligence** - Transforming data into actionable insights

------------------------------------------------------------------------------------------------------------------

## Analysis Objectives

This analysis addresses five critical business questions that drive credit risk management decisions:

1. **Pricing Strategy** - How do loan amounts and interest rates vary across risk categories?
2. **Default Patterns** - What characteristics define high-credit-history borrowers who defaulted?
3. **Loan Intent Analysis** - Which borrowers secure the largest loans per purpose category?
4. **Risk Exposure** - Who's borrowing above the default benchmark?
5. **Risk Segmentation** - How does debt-to-income ratio categorize borrower risk?

--------------------------------------------------------------------------------------------------------------

## 📊 Key Findings & Visualizations

### 1️⃣ Average Loan Amount and Interest Rate by Risk Grade

<img width="654" height="546" alt="Average funded loan amount and interest rate by risk grade" src="https://github.com/user-attachments/assets/208c8387-2395-4810-aa33-6def3e8044b9" />


**What the data reveals:**

The analysis shows a **clear risk-pricing relationship** across loan grades A through G:

| Grade | Avg Loan Amount | Avg Interest Rate | Risk Level |
|-------|-----------------|-------------------|------------|
| **A** | ~$8,500 | ~7% | Lowest |
| **B** | ~$9,500 | ~10% | Low |
| **C** | ~$10,500 | ~13% | Moderate-Low |
| **D** | ~$11,500 | ~16% | Moderate |
| **E** | ~$13,000 | ~17% | Moderate-High |
| **F** | ~$14,700 | ~19% | High |
| **G** | ~$17,200 | ~20% | Highest |

**Key Insights:**
- **Progressive Risk Premium:** Interest rates nearly **triple** from Grade A (7%) to Grade G (20%), reflecting appropriate risk compensation
- **Counterintuitive Pattern:** Higher-risk borrowers receive **larger loan amounts** (~$17K for Grade G vs ~$8.5K for Grade A)
- **Business Strategy:** Lenders offset increased default risk with substantially higher rates rather than reducing loan sizes
- **Market Implication:** This suggests a strategy of serving higher-risk segments with premium pricing rather than exclusion


-----------------------------------------------------------------------------------------------------------------------------------------------


### 2️⃣ Top 10 Borrowers with Longest Credit History Who Defaulted

**Analysis Summary:**

This segment challenges the conventional wisdom that **credit history length = creditworthiness**. Among defaulted borrowers, the top 10 have credit histories ranging from 15 to 30+ years, yet still failed to repay.

**Critical Insights:**
- **Experience ≠ Reliability:** Long credit history alone is an insufficient predictor of repayment
- **Life Events Matter:** Extended credit histories may not reflect recent financial disruptions (job loss, medical emergencies, business failures)
- **Model Weakness:** Credit scoring systems heavily weighted toward history length may miss real-time risk signals

**What This Means for Risk Models:**

Traditional scoring models need augmentation with:
- **Recent payment velocity** - Changes in payment patterns over the last 6-12 months
- **Income stability indicators** - Employment tenure and income consistency
- **Debt-to-income trajectory** - Rising leverage despite long history
- **Behavioral triggers** - New credit seeking, missed payments, balance increases

**Actionable Recommendation:** Implement **dynamic risk scoring** that weights recent behavior (last 12-24 months) more heavily than distant credit history, especially for borrowers with 10+ year histories.

-----------------------------------------------------------------------------------------------------------------------------------------------

### 3️⃣ Distribution Across Age Groups

<img width="721" height="368" alt="Total Loan Amount by Person Age" src="https://github.com/user-attachments/assets/a312ca00-de5e-46e5-80e6-7af7948c6303" />


**Demographic Analysis:**

The dataset shows a **concentrated young borrower base**:

- **Peak Borrowing Age:** 25-30 years (highest loan volume)
- **Average Borrower Age:** 27.7 years
- **Age Distribution:** Heavily skewed toward millennials and early Gen Z
- **Outliers Present:** Some borrowers up to age 80, indicating diverse portfolio

**Age-Related Insights:**

**Why Younger Borrowers Dominate:**
- Early career financing needs (education, first home, transportation)
- Lower income requiring credit for major purchases
- Building credit history through smaller loans

**Risk Considerations by Age Bracket:**
- **20-25 years:** Higher default risk due to income instability, offset by smaller loan amounts
- **25-35 years:** Sweet spot - growing income, moderate risk, willing to pay premium rates
- **35-50 years:** Lower volume but potentially larger individual loans
- **50+ years:** Minimal representation, suggesting either established wealth or different financing channels

**Strategic Opportunity:** The 25-30 age cohort represents a **growth engine**. Targeted products (career starter loans, apartment furnishing credit, vehicle financing) could expand this segment while maintaining healthy risk profiles.

---
































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

