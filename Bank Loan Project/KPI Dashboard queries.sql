-- Total Loan Applications

select count(id) as Total_Applications
from loan;

-- MTD Loan Applications

select count(id) as MTD_Total_Applications
from loan
where month(issue_date) = 12 and year(issue_date) = 2021;

-- PMTD Loan Applications

select count(id) as PMTD_Total_Applications
from loan
where month(issue_date) = 11 and year(issue_date) = 2021;

-- Total Funded Amount

select sum(loan_amount) as Total_amount_funded
from loan;

-- MTD Total Funded Amount

select sum(loan_amount) as MTD_Total_amount_funded
from loan
where month(issue_date) = 12 and year(issue_date) = 2021;

-- PMTD Total Funded Amount

select sum(loan_amount) as PMTD_Total_amount_funded
from loan
where month(issue_date) = 11 and year(issue_date) = 2021;

-- Total Amount Received

select sum(total_payment) as Total_amount_recieved
from loan;

-- MTD Total Amount Received

select sum(total_payment) as MTD_Total_amount_recieved
from loan
where month(issue_date) = 12 and year(issue_date) = 2021;

-- PMTD Total Amount Received

select sum(total_payment) as PMTD_Total_amount_recieved
from loan
where month(issue_date) = 11 and year(issue_date) = 2021;

-- Average Interest Rate

select round(avg(int_rate)*100,2) as Avg_Interest_rate
from loan;
 
-- MTD Average Interest

select round(avg(int_rate)*100,2) as MTD_Avg_Interest_rate
from loan
where month(issue_date) = 12 and year(issue_date) = 2021;

-- PMTD Average Interest

select round(avg(int_rate)*100,2) as PMTD_Avg_Interest_rate
from loan
where month(issue_date) = 11 and year(issue_date) = 2021;

-- Average DTI

select round(avg(dti)*100,2) as Average_TDI
from loan;

-- MTD Average DTI

select round(avg(dti)*100,2) as MTD_Average_TDI
from loan
where month(issue_date) = 12 and year(issue_date) = 2021;

-- PMTD Average DTI

select round((dti)*100,2) as PMTD_Average_TDI
from loan
where month(issue_date) = 11 and year(issue_date) = 2021;

-- GOOD LOAN ISSUED

-- Good Loan Percentage

select count(
	case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)*100 /
    count(id) as Good_loan_percentage
from loan;

-- Good Loan Applications

select count(
	case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end) as Good_loan_applications
from loan; 
-- or
select count(id) as Good_loan_applications
from loan
where loan_status = 'Fully Paid' or loan_status = 'Current';

-- Good Loan Funded Amount

select sum(loan_amount) as Good_Loan_Funded_Amount
from loan
where loan_status = 'Fully Paid' or loan_status = 'Current';

-- Good Loan Amount Received

select sum(total_payment) as Good_Loan_Amount_Recieved
from loan
where loan_status = 'Fully Paid' or loan_status = 'Current';

-- BAD LOAN ISSUED

-- Bad Loan Percentage

select count(
	case when loan_status = 'Charged Off' then id end)*100 /
    count(id) as Bad_loan_percentage
from loan;

-- Bad Loan Applications

select count(
	case when loan_status = 'Charged Off' then id end) as Bad_loan_applications
from loan; 
-- or
select count(id) as Bad_loan_applications
from loan
where loan_status = 'Charged Off';

-- Bad Loan Funded Amount

select sum(loan_amount) as Bad_Loan_Funded_Amount
from loan
where loan_status = 'Charged off';

-- Bad Loan Amount Received

select sum(total_payment) as Bad_Loan_Amount_Recieved
from loan
where loan_status = 'Charged off';

-- LOAN STATUS

select loan_status,
	   count(id) as Total_Loan_applications,
	   sum(loan_amount) as Total_Funded_amount,
       sum(total_payment) as Total_Amount_recieved,
       avg(int_rate)*100 as Interest_Rate,
	   avg(dti)*100 as DTI
from loan
group by loan_status;

-- MTD Loan Status

select loan_status,
	   sum(loan_amount) as MTD_Total_Funded_amount,
       sum(total_payment) as MTD_Total_Amount_recieved
from loan
where month(issue_date) = 12 and year(issue_date) = 2021
group by loan_status;

-- PMTD Loan status

select loan_status,
	   sum(loan_amount) as PMTD_Total_Funded_amount,
       sum(total_payment) as PMTD_Total_Amount_recieved
from loan
where month(issue_date) = 11
group by loan_status;

-- B.	BANK LOAN REPORT | OVERVIEW

-- MONTH

select month(issue_date) as Month_no,
	   monthname(issue_date) as Month_name,
	   count(id) as Total_Loan_applications,
	   sum(loan_amount) as Total_Funded_amount,
       sum(total_payment) as Total_Amount_recieved
from loan
group by Month_no, Month_name
order by Month_no;

-- STATE

select address_state as State,
	   count(id) as Total_Loan_applications,
	   sum(loan_amount) as Total_Funded_amount,
       sum(total_payment) as Total_Amount_recieved
from loan
group by State
order by Total_Funded_amount desc;

-- TERM

select term as Term,
	   count(id) as Total_Loan_applications,
	   sum(loan_amount) as Total_Funded_amount,
       sum(total_payment) as Total_Amount_recieved
from loan
group by Term
order by Term;

-- EMPLOYEE LENGTH

select emp_length as Employee_length,
	   count(id) as Total_Loan_applications,
	   sum(loan_amount) as Total_Funded_amount,
       sum(total_payment) as Total_Amount_recieved
from loan
group by 1
order by 2 desc;

-- PURPOSE

select purpose,
	   count(id) as Total_Loan_applications,
	   sum(loan_amount) as Total_Funded_amount,
       sum(total_payment) as Total_Amount_recieved
from loan
group by 1
order by 2 desc;

-- HOME OWNERSHIP

select home_ownership,
	   count(id) as Total_Loan_applications,
	   sum(loan_amount) as Total_Funded_amount,
       sum(total_payment) as Total_Amount_recieved 
from loan
group by 1
order by 2 desc;