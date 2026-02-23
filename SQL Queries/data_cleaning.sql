-- cleaning data where age > 80 AND emp_length > 60
delete from credit_risk 
where person_age > 80
	or person_emp_length > 60
;