# 🏦 Bank Loan Analytics
A comprehensive analytics project built using Power BI, Tableau, Excel, and SQL, providing deep insights into loan disbursement, repayment behavior, branch performance, and credit risk metrics using real-world banking data.

## 📌 Project Overview
This project analyzes the loan portfolio of a financial institution using interactive dashboards and reports. It tracks key performance indicators (KPIs) such as disbursed loans, collections, interest income, borrower demographics, and risk metrics like default and delinquency rates.
The aim is to provide business users, credit teams, and analysts with actionable insights to support data-driven decision-making.

## 📂 Dataset Description
The dataset includes structured records related to:
- Loan amounts and funding
- Client profiles and demographics
- Loan statuses (active, closed, delinquent, defaulted)
- Payment and collection data
- Risk flags and credit grades

**Key Fields:**
- `Loan_Amount`, `Funded_Amount`, `Total_Collection`, `Int_Rate`, `Total_Pymnt`
- `Loan_Status`, `Is_Delinquent_Loan`, `Is_Default_Loan`
- `Disbursement_Date`, `Term_In_Months`, `Branch_Name`, `State_Name`
- `Grade`, `Verification_Status`, `Age`, `Religion`, `Product_Code`

## 📊 Key KPIs & Visualizations

1. **Total Loan Amount Funded**
2. **Total Loans Issued**
3. **Total Collection**
4. **Total Interest Earned**
5. **Branch-Wise Revenue (Interest, Fees, Total)**
6. **State-Wise Loan Distribution**
7. **Religion-Wise Loan Distribution**
8. **Product Group-Wise Loan**
9. **Disbursement Trend**
10. **Grade-Wise Loan**
11. **Count of Default Loan**
12. **Count of Delinquent Clients**
13. **Delinquent Loan Rate**
14. **Default Loan Rate**
15. **Loan Status-Wise Loan**
16. **Age Group-Wise Loan**
17. **No Verified Loan Count**
18. **Loan Maturity Timeline**

## 🛠️ Tools & Technologies Used

 📊 Power BI   - DAX, Drillthroughs, Slicers, Bookmarks 
📈 Tableau    -  KPIs, Filters, Trend Charts, Maps      
📁 Excel       -  Data Cleaning, Pivot Tables, Charts     
💾 SQL (MySQL)  - Data Modeling, Risk Querying    

## 🚀 Features

- Fully interactive dashboards with dynamic filters
- Time-series visualizations and disbursement trends
- Risk metrics: Default & Delinquent analysis
- Client profiling based on age, religion, verification
- Drill-down from branch → product → individual loan
- Exportable insights for business presentations
