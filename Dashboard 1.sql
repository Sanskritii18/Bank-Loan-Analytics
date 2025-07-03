-- Dahsboard1

SELECT @@secure_file_priv;
CREATE TABLE loan_data (
    AccountID VARCHAR(50),
    Age varchar(10),
    BHCode VARCHAR(50),
    BHName VARCHAR(100),
    BankCode VARCHAR(50),
    BankName VARCHAR(100),
    BranchName VARCHAR(100),
    Caste VARCHAR(50),
    CenterId VARCHAR(50),
    City VARCHAR(100),
    Clientid VARCHAR(50),
    ClientName VARCHAR(100),
    CloseClient VARCHAR(10),
    ClosedDate DATE,
    CredifOfficerName VARCHAR(100),
    DateofBirth varchar(10),
    DisbBy VARCHAR(50),
    DisbursementDate DATE,
    DisbursementYear VARCHAR(10),
    Gender VARCHAR(10),
    HomeOwnership VARCHAR(20),
    LoanStatus VARCHAR(50),
    LoanTransferdate varchar(10),
    NextMeetingDate varchar(10),
    ProductCode VARCHAR(20),
    Grade VARCHAR(5),
    SubGrade VARCHAR(10),
    ProductId VARCHAR(50),
    PurposeCategory VARCHAR(100),
    RegionName VARCHAR(100),
    Religion VARCHAR(50),
    VerificationStatus VARCHAR(50),
    StateAbbr VARCHAR(10),
    StateName VARCHAR(100),
    TranferLogic VARCHAR(50),
    IsDelinquentLoan varchar(10),
    IsDefaultLoan varchar(10),
    AgeT varchar(10),
    Delinq2Yrs INT,
    ApplicationType VARCHAR(50),
    LoanAmount DECIMAL(15,2),
    FundedAmount DECIMAL(15,2),
    FundedAmountInv DECIMAL(15,2),
    Term varchar(10),
    IntRate DECIMAL(5,2),
    TotalPymnt DECIMAL(15,2),
    TotalPymntinv DECIMAL(15,2),
    TotalRecrncp DECIMAL(15,2),
    TotalFees DECIMAL(15,2),
    TotalRrecint DECIMAL(15,2),
    TotalRecLatefee DECIMAL(15,2),
    Recoveries DECIMAL(15,2),
    CollectionRecoveryfee DECIMAL(15,2)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data1.csv'
INTO TABLE loan_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM loan_data;
SELECT COUNT(DISTINCT AccountID) FROM loan_data;

-- 1. Total Loan Amount Funded
SELECT ROUND(SUM(fundedAmount)/1000000, 0) AS total_funded_million
FROM loan_data;

-- 2. Total Loans
SELECT COUNT(AccountID) AS total_loans 
FROM loan_data;

-- 3. Total Collection
SELECT (TotalRecLatefee + TotalRrecint) AS total_collection 
FROM loan_data;

-- 4. Total Interest
SELECT round(SUM(TotalRrecint) /1000000, 0) AS total_interest 
FROM loan_data;

-- 5. Branch-Wise Revenue
SELECT BranchName, 
       SUM(TotalRrecint) AS interest, 
       SUM(TotalFees) AS fees, 
       SUM(TotalRrecint + TotalFees) AS total_revenue
FROM loan_data
GROUP BY BranchName;

-- 6. State-Wise Loan Count
SELECT StateName, COUNT(*) AS totalloans 
FROM loan_data
GROUP BY StateName;

-- 7. Religion-Wise Loans
SELECT Religion, COUNT(*) AS total_loans 
FROM loan_data 
GROUP BY Religion;

-- 8. Product-Wise Loans
SELECT ProductCode, COUNT(*) AS total_loans 
FROM loan_data 
GROUP BY ProductCode;

-- 9.Disbursement Trend (Monthly)
SELECT 
  DATE_FORMAT(STR_TO_DATE(DisbursementDate, '%Y-%m-%d'), '%Y-%m') AS disbursement_month,
  COUNT(*) AS total_loans
FROM loan_data
WHERE DisbursementDate IS NOT NULL
GROUP BY disbursement_month
ORDER BY disbursement_month;

-- 10. Grade-Wise Loans
SELECT Grade, COUNT(*) AS total_loans 
FROM loan_data 
GROUP BY Grade;

-- 11. Default Loan Count
SELECT COUNT(*) AS default_loan_count 
FROM loan_data
WHERE IsDefaultLoan = 'y';

-- 12. Delinquent Clients Count
SELECT COUNT(*) AS delinquent_clients
FROM loan_data
WHERE `IsDelinquentLoan` = 'Y';

-- 13. Delinquent Loan Rate
SELECT 
  `IsDelinquentLoan`,
  CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM loan_data), 2), '%') AS percentage
FROM loan_data
GROUP BY `IsDelinquentLoan`;

-- 14.Default Loan Rate
SELECT 
  `IsDefaultLoan`,
  CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM loan_data), 2), '%') AS percentage
FROM loan_data
GROUP BY `IsDefaultLoan`;

-- 15.Loan Status Breakdown
SELECT LoanStatus, COUNT(*) AS count 
FROM loan_data
GROUP BY LoanStatus;

-- 16. Age Group-Wise Loan Distribution
SELECT 
  CASE 
    WHEN Age < 25 THEN '<25'
    WHEN Age BETWEEN 25 AND 35 THEN '25-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 60 THEN '46-60'
    ELSE '60+' 
  END AS age_group,
  COUNT(*) AS total_loans
FROM loan_data
GROUP BY age_group;

-- 17. No Verified Loans
SELECT COUNT(*) AS not_verified_loan_count 
FROM loan_data 
WHERE VerificationStatus IS NULL OR VerificationStatus = 'Not Verified';

-- 18. Loan Maturity
SELECT round(AVG(`Term`),0) AS average_loan_maturity_months 
FROM loan_data;

