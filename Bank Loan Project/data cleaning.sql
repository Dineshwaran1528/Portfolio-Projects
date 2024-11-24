-- changing the datatype from text to date 
update loan
set last_credit_pull_date = str_to_date(last_credit_pull_date, '%d-%m-%Y'),
	last_payment_date = str_to_date(last_payment_date, '%d-%m-%Y'),
	next_payment_date = str_to_date(next_payment_date, '%d-%m-%Y');
    
-- Altering the datatypes of the columns in order to import the data from excel

ALTER TABLE `bank_loan_db`.`loan` 
CHANGE COLUMN `issue_date` `issue_date` DATE NULL,
CHANGE COLUMN `last_credit_pull_date` `last_credit_pull_date` DATE NULL,
CHANGE COLUMN `last_payment_date` `last_payment_date` DATE NULL,
CHANGE COLUMN `next_payment_date` `next_payment_date` DATE NULL,
CHANGE COLUMN `emp_length` `emp_length` VARCHAR(20) NULL DEFAULT NULL ,
CHANGE COLUMN `emp_title` `emp_title` VARCHAR(100) NULL DEFAULT NULL ,
CHANGE COLUMN `sub_grade` `sub_grade` VARCHAR(20) NULL DEFAULT NULL ,
CHANGE COLUMN `term` `term` VARCHAR(30) NULL DEFAULT NULL ;
