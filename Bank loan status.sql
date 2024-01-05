SELECT * FROM loanbank.finance_1;
SELECT * FROM loanbank.finance_2;
/*Q1 Year wise loan amount Stats*/

select YEAR(issue_d) as year_issue_date,sum(loan_amnt) as total_Amount_loan from finance_1 group by year_issue_date order by year_issue_date;
 
 /*Q2 Grade and sub grade wise revol_bal*/
 select grade,sub_grade,concat('$',format(round(sum(revol_bal)/10000,2),1),'M') as revol_balane from finance_1 inner join
 finance_2  on (finance_1.id= finance_2.id )
 group by grade, sub_grade 
 order by grade,sub_grade;
 
 /*Q3.Total Payment for Verified Status Vs Total Payment for Non Verified Status*/
 select verification_status,concat('$',format(round(sum(total_Pymnt)/10000,2),1),'M') as total_payment from finance_1 inner join finance_2 on 
 (finance_1.id=finance_2.id) group by verification_status order by verification_status;
 
 /*Q4.State wise and month wise loan status*/
 select addr_state as state ,last_credit_pull_d as last_creadit_day,loan_status from finance_1 inner join finance_2 on (finance_1.id=finance_2.id)
 group by last_credit_pull_d,addr_state,loan_status order by last_credit_pull_d;
 
 /*Q5.Home ownership Vs last payment date stats*/
 select year(last_pymnt_d) as Last_pyment,home_ownership,concat('$',format(round(sum(last_pymnt_amnt)/1000,2),1),'M') as total_Amont from finance_1 inner join finance_2 on 
 (finance_1.id=finance_2.id) group by last_pymnt_d,home_ownership order by home_ownership;




 
