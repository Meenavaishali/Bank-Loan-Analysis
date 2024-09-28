SELECT * FROM bank_loan_data;

SELECT COUNT(id) AS Total_Loan_Applications FROM bank_loan_data;

SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

SELECT SUM(loan_amount) as MTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT SUM(loan_amount) as PMTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

## AVERAGE INTEREST RATE
SELECT ROUND(AVG(int_rate),4)* 100 AS Avg_Interest_Rate FROM bank_loan_data;

SELECT ROUND(AVG(int_rate),4)* 100 AS MTD_Avg_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT ROUND(AVG(int_rate),4)* 100 AS PMTD_Avg_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

SELECT ROUND(AVG(dti),4)* 100 AS Avg_DTI FROM bank_loan_data ;

SELECT ROUND(AVG(dti),4)* 100 AS MTD_Avg_DTI FROM bank_loan_data 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT ROUND(AVG(dti),4)* 100 AS PMTD_Avg_DTI FROM bank_loan_data 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

SELECT LOAN_STATUS FROM bank_loan_data;

SELECT 
	(COUNT(CASE WHEN LOAN_STATUS = 'Fully Paid' or LOAN_STATUS = 'Current' THEN ID END) * 100) /
	COUNT(ID) AS Good_Loan_Percentage
	FROM bank_loan_data;

SELECT COUNT(ID) AS Good_Loan_Applications FROM bank_loan_data
WHERE LOAN_STATUS = 'Fully Paid' or LOAN_STATUS = 'Current';

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE LOAN_STATUS = 'Fully Paid' or LOAN_STATUS = 'Current';

SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM bank_loan_data
WHERE LOAN_STATUS = 'Fully Paid' or LOAN_STATUS = 'Current';

SELECT 
	(COUNT(CASE WHEN LOAN_STATUS = 'Charged Off' THEN ID END) * 100) /
	COUNT(ID) AS Bad_Loan_Percentage
	FROM bank_loan_data;

SELECT COUNT(ID) AS Bank_Bad_Loan_Applications FROM bank_loan_data
WHERE LOAN_STATUS = 'Charged Off';

SELECT SUM(loan_amount) AS Bank_Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE LOAN_STATUS = 'Charged Off';


SELECT SUM(total_payment) AS Bank_Bad_Loan_Received_Amount FROM bank_loan_data
WHERE LOAN_STATUS = 'Charged Off';

SELECT 
	loan_status,
	COUNT(ID) AS Total_Loan_Applications,
	SUM(Total_Payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate * 100) AS Interest_Rate,
	AVG(dti * 100) AS DTI
	FROM bank_loan_data 
	GROUP BY loan_status;

SELECT 
	loan_status,
	SUM(Total_Payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
	FROM bank_loan_data
	WHERE MONTH(issue_date) = 12
	GROUP BY loan_status;

SELECT 
	MONTH(issue_date) AS Month_Number,
	DATENAME(MONTH, issue_Date) AS Month_Name,
	COUNT(ID) AS Total_Loan_Applications,
	SUM(Total_Payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
	FROM bank_loan_data
	GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_Date) 
	ORDER BY MONTH(issue_date);

SELECT 
	address_state,
	COUNT(ID) AS Total_Loan_Applications,
	SUM(Total_Payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
	FROM bank_loan_data
	GROUP BY address_state 
	ORDER BY COUNT(ID) desc;

SELECT 
	Term,
	COUNT(ID) AS Total_Loan_Applications,
	SUM(Total_Payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
	FROM bank_loan_data
	GROUP BY Term 
	ORDER BY Term;

SELECT 
	emp_length,
	COUNT(ID) AS Total_Loan_Applications,
	SUM(Total_Payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
	FROM bank_loan_data
	GROUP BY emp_length 
	ORDER BY emp_length;

SELECT 
	purpose,
	COUNT(ID) AS Total_Loan_Applications,
	SUM(Total_Payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
	FROM bank_loan_data
	GROUP BY purpose 
	ORDER BY COUNT(ID) desc;

SELECT 
	home_ownership,
	COUNT(ID) AS Total_Loan_Applications,
	SUM(Total_Payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
	FROM bank_loan_data
	GROUP BY home_ownership 
	ORDER BY COUNT(ID) desc;