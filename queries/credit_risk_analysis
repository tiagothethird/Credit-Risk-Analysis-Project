-- the average loan amount and interest rate for each loan category

select 
	ROUND(AVG(loan_amnt)) as 'Average loan amount',
	ROUND(AVG(loan_int_rate)) as 'Average Interest Rate',
	loan_grade as 'Category'
from credit_risk 
group by loan_grade 
order by loan_grade 
;

-- -----------------------------------------------------------------------------------------------

-- Find the top 10 borrowers with the highest credit history length who have defaulted

select *
from credit_risk 
where 	
	loan_status = 1
order by cb_person_cred_hist_length desc
limit 10
;

-- ----------------------------------------------------------------------------------------------

-- Find the top 5 borrowers with the highest loan amounts within each loan intent category

select 
	person_id,
	loan_intent,
	loan_amnt,
	person_income,
	loan_grade
from (
select 
	person_id, 
	loan_intent,
	loan_amnt,
	person_income,
	loan_grade,
	row_number() over (
						partition by loan_intent 
						order by loan_amnt desc ) as rn
from credit_risk
) t 
where rn <= 5 
order by loan_intent , loan_amnt desc
;

-- -----------------------------------------------------------------------------------

-- List all borrowers whose loan amount is higher than the average loan amount of defaulted borrowers

select *
from credit_risk 
where loan_amnt > (
	select 
	AVG(loan_amnt)
	from credit_risk
	where loan_status = 1 )
;

-- ---------------------------------------------------------------------------------------------------------

-- Categorize borrowers as Low Risk, Medium Risk or High Risk based on their loan percent income

select
	person_id, 
	person_age,
	person_income,
	loan_amnt,
	loan_percent_income,
	case 
		when loan_percent_income > 0.5 then 'High risk'
		when loan_percent_income between 0.25 and 0.50 then 'Medium risk'
		else 'Low'
	end as 'Risk'
	
from credit_risk 
order by loan_percent_income asc
;




