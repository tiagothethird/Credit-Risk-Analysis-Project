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

##  Key Findings & Insights

### 1️⃣ Average Loan Amount and Interest Rate by Risk Grade


<img width="654" height="546" alt="Average funded loan amount and interest rate by risk grade" src="https://github.com/user-attachments/assets/208c8387-2395-4810-aa33-6def3e8044b9" />


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

### **Key Insights:**

- **Progressive Risk Premium:** Interest rates nearly **triple** from Grade A (7%) to Grade G (20%), reflecting appropriate risk compensation
- **Counterintuitive Pattern:** Higher-risk borrowers receive **larger loan amounts** (~$17K for Grade G vs ~$8.5K for Grade A)
- **Business Strategy:** Lenders offset increased default risk with substantially higher rates rather than reducing loan sizes
- **Market Implication:** This suggests a strategy of serving higher-risk segments with premium pricing rather than exclusion


-----------------------------------------------------------------------------------------------------------------------------------------------


### 2️⃣ Top 10 Borrowers with Longest Credit History Who Defaulted

This segment challenges the conventional wisdom that **credit history length = creditworthiness**. Among defaulted borrowers, the top 10 have credit histories ranging from 15 to 30+ years, yet still failed to repay.

### **Critical Insights:**

- **Experience ≠ Reliability:** Long credit history alone is an insufficient predictor of repayment
- **Life Events Matter:** Extended credit histories may not reflect recent financial disruptions (job loss, medical emergencies, business failures)
- **Model Weakness:** Credit scoring systems heavily weighted toward history length may miss real-time risk signals

### **What This Means for Risk Models:**

Traditional scoring models need augmentation with:
- **Recent payment velocity** - Changes in payment patterns over the last 6-12 months
- **Income stability indicators** - Employment tenure and income consistency
- **Debt-to-income trajectory** - Rising leverage despite long history
- **Behavioral triggers** - New credit seeking, missed payments, balance increases

 **Actionable Recommendation:** Implement **dynamic risk scoring** that weights recent behavior (last 12-24 months) more heavily than distant credit history, especially for borrowers with 10+ year histories.

-----------------------------------------------------------------------------------------------------------------------------------------------

### 3️⃣ Distribution Across Age Groups

<img width="721" height="368" alt="Total Loan Amount by Person Age" src="https://github.com/user-attachments/assets/a312ca00-de5e-46e5-80e6-7af7948c6303" />


The dataset shows a **concentrated young borrower base**:

- **Peak Borrowing Age:** 25-30 years (highest loan volume)
- **Average Borrower Age:** 27.7 years
- **Age Distribution:** Heavily skewed toward millennials and early Gen Z
- **Outliers Present:** Some borrowers up to age 80, indicating diverse portfolio



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

----------------------------------------------------------------------------------------------------------------------------------

### 4️⃣ Top 5 Highest Loan Amounts per Intent Category


The analysis reveals distinct borrowing patterns across six primary loan intents, with the top 5 borrowers per category showing:


| Intent Category | Top Loan Range | Typical Income Range | Common Risk Grade |
|-----------------|----------------|----------------------|-------------------|
| **DEBTCONSOLIDATION** | $25,000 - $35,000 | $75K - $120K | C - E |
| **EDUCATION** | $15,000 - $25,000 | $40K - $80K | B - D |
| **HOMEIMPROVEMENT** | $20,000 - $30,000 | $85K - $150K | B - D |
| **MEDICAL** | $12,000 - $20,000 | $50K - $90K | C - E |
| **PERSONAL** | $18,000 - $28,000 | $60K - $100K | C - E |
| **VENTURE** | $30,000 - $35,000 | $100K - $200K | D - F |

 ### **Critical Findings:**

1. **Debt Consolidation Dominates:** Consistently shows highest individual loan amounts, indicating borrowers refinancing multiple obligations
2. **Venture Loans = Highest Risk:** Business/entrepreneurial loans command premium amounts but also highest grades (D-F)
3. **Medical Loans Underserved:** Despite critical need, medical loans show lower amounts, suggesting potential market gap
4. **Income Correlation Varies:** Education loans show weaker income correlation, likely due to future earnings potential consideration

### **Business Applications:**

- **Targeted Marketing:** Different messaging and product features per intent category
- **Risk-Adjusted Pricing:** Venture and debt consolidation loans warrant higher rates and stricter underwriting
- **Cross-Sell Opportunities:** Education borrowers may graduate to home improvement → mortgage pipeline
- **Portfolio Diversification:** Intent-based allocation helps balance risk exposure

-------------------------------------------------------------------------------------------------------------------------------------------------------

## 5️⃣ Debt-to-Income Distribution by Home Ownership

<img width="689" height="379" alt="Debt-to-income Distribution by Home Ownership" src="https://github.com/user-attachments/assets/1df3726f-5edd-4816-864b-4f26e2171d03" />


The donut chart reveals how **home ownership status correlates with debt capacity:**

**Distribution Breakdown:**
-  **RENT:** 54.56% 
-  **MORTGAGE:** 36.73%  
-  **OWN:** 8.35% 
-  **OTHER:** 0.36% 



**RENT (54.56%) - Flexibility with Higher Risk:**
- **Pros:** More disposable income (no mortgage), flexible relocation
- **Cons:** Less stable, no equity cushion, potential housing cost volatility
- **Risk Factor:** Medium - lacks collateral but has income flexibility
- **Strategy:** Focus on income stability and employment verification

**MORTGAGE (36.73%) - Balanced Profile:**
- **Pros:** Established responsibility, building equity, stable residence
- **Cons:** Dual debt burden (mortgage + new loan), less cash flexibility
- **Risk Factor:** Medium-Low - proven payment discipline, but stretched capacity
- **Strategy:** Carefully assess total debt service ratio (mortgage + loan)

**OWN (8.35%) - Premium Borrowers:**
- **Pros:** Highest stability, significant equity available, lowest housing burden
- **Cons:** Often older demographic, may be approaching retirement
- **Risk Factor:** Lowest - strong financial position
- **Strategy:** Upsell opportunities for larger loans at competitive rates

 ### **Strategic Implications:**

1. **Pricing Differentiation:** Homeowners (MORTGAGE + OWN = 30.17%) could qualify for rate reductions due to lower risk
2. **Product Customization:** Renters might benefit from shorter-term, smaller loans to preserve flexibility
3. **Equity Line Opportunity:** Homeowners could be offered secured lines of credit at better terms
4. **Market Share:** 70% renter composition suggests opportunity to develop renter-specific products

---------------------------------------------------------------------------------------------------------------

## 6️⃣ Risk Categorization Based on Loan-to-Income Ratio



Based on loan-to-income ratio thresholds:
- 🟢 **Low Risk (≤25%):** 22,568 borrowers (78.8%)
- 🟡 **Medium Risk (25-50%):** 5,846 borrowers (20.4%)
- 🔴 **High Risk (>50%):** 217 borrowers (0.8%)

**Deep Dive into Risk Segments:**

**Low Risk Segment (78.8%) - Portfolio Foundation:**
- **Characteristics:** Loan payments consume ≤25% of monthly income
- **Financial Cushion:** Strong ability to handle unexpected expenses
- **Default Probability:** Minimal under normal economic conditions
- **Opportunity:** Under-leveraged segment - eligible for additional products
- **Strategy:** Target for upselling (credit cards, investment products, insurance)

**Medium Risk Segment (20.4%) - Attention Required:**
- **Characteristics:** Loan payments consume 25-50% of monthly income
- **Vulnerability:** Susceptible to income shocks or expense increases
- **Management Need:** Regular monitoring, proactive outreach during economic stress
- **Warning Zone:** Close to debt distress threshold
- **Strategy:** Implement early warning systems, offer financial counseling, payment flexibility options

**High Risk Segment (0.8%) - Critical Monitoring:**
- **Characteristics:** Loan payments exceed 50% of monthly income
- **Severity:** High probability of payment difficulties
- **Volume Impact:** Only 217 borrowers but disproportionate potential loss
- **Common Causes:** Emergency loans, income reduction post-approval, optimistic income projections

----------------------------------------------------------------------------------------------------------------------------------


##  Executive Summary: Key Insights

###  For Risk Management

**1. Risk-Based Pricing Works (But Needs Refinement)**
- Clear correlation between risk grades and interest rates (7% → 20%)
- Higher-risk borrowers receive larger loans, creating concentration risk
- **Action:** Consider loan amount caps for grades F-G to limit exposure

**2. Credit History Alone is Insufficient**
- Long credit histories don't prevent default
- Need multidimensional scoring incorporating recent behavior
- **Action:** Implement dynamic scoring that weights recent 12-24 months heavily

**3. Young Demographic = Growth Opportunity + Volatility**
- Average borrower age of 27.7 years indicates career-building phase
- This cohort has income growth potential but current instability
- **Action:** Develop graduated limit increases tied to employment tenure

**4. Intent-Based Risk Varies Dramatically**
- Venture loans: Highest amounts, highest risk
- Medical loans: Moderate amounts, moderate risk
- Education loans: Future earnings bet
- **Action:** Customize underwriting criteria per loan intent category

--------------------------------------------------------------------------------------------------------------------------
##  License

This project is available for educational and portfolio purposes.


------------------------------------------------------------------------------------------------------------------------------

##  Acknowledgments

This analysis transforms raw data into actionable intelligence, demonstrating how **data-driven decision-making** enhances credit risk management. The combination of technical skills (SQL & visualization) with domain knowledge (credit risk, financial analysis) creates insights that drive real business value.
