# Bank Summary SQL Project

## Overview
This project demonstrates basic SQL operations such as creating tables, inserting data, and querying for specific insights. The primary focus of this project is managing and calculating balances for a fictional bank account system.

---

## Table Structure

The table **`bank_summary`** holds transaction data for multiple account holders, including deposits and withdrawals. The table consists of the following columns:

- **AccountNumber (INT)**: The unique identifier for each bank account.
- **AccountHolder (VARCHAR)**: The name of the account holder.
- **TxnDate (DATE)**: The date of the transaction.
- **TxnType (VARCHAR)**: The type of transaction (either 'Deposit' or 'Withdrawal').
- **TxnAmount (DECIMAL)**: The amount of money involved in the transaction.

---

## SQL Script

### 1. Create Table

The **`bank_summary`** table is created using the following SQL command:

```sql
CREATE TABLE bank_summary (
    AccountNumber INT,
    AccountHolder VARCHAR(255),
    TxnDate DATE,
    TxnType VARCHAR(255),
    TxnAmount DECIMAL (10,2)
); 

INSERT INTO bank_summary (
    AccountNumber,
    AccountHolder,
    TxnDate,
    TxnType,
    TxnAmount
)
VALUES
(1201, 'Samuel Mukoma','2025-01-03','Deposit', 102355),
(1201, 'Samuel Mukoma','2025-01-04','Withdrawal', 5000),
(1202, 'Boy Kid','2025-01-05','Withdrawal', 20000),
(1201, 'Samuel Mukoma','2025-01-07','Deposit', 62700),
(1203, 'Maisha Mazuri','2025-01-08','Deposit', 108000),
(1202, 'Boy Kid','2025-01-09','Deposit', 86000),
(1201, 'Samuel Mukoma','2025-01-10','Deposit', 102355),
(1203, 'Maisha Mazuri','2025-01-12','Withdrawal', 12500),
(1201, 'Samuel Mukoma','2025-01-13','Deposit', 500000),
(1202, 'Boy Kid','2025-01-15','Deposit', 32000),
(1203, 'Maisha Mazuri','2025-01-16','Withdrawal', 8000);
```
2. Insert Data
The table is populated with transaction records for different account holders:

```sql
INSERT INTO bank_summary (
    AccountNumber,
    AccountHolder,
    TxnDate,
    TxnType,
    TxnAmount
)
VALUES
(1201, 'Samuel Mukoma','2025-01-03','Deposit', 102355),
(1201, 'Samuel Mukoma','2025-01-04','Withdrawal', 5000),
(1202, 'Boy Kid','2025-01-05','Withdrawal', 20000),
(1201, 'Samuel Mukoma','2025-01-07','Deposit', 62700),
(1203, 'Maisha Mazuri','2025-01-08','Deposit', 108000),
(1202, 'Boy Kid','2025-01-09','Deposit', 86000),
(1201, 'Samuel Mukoma','2025-01-10','Deposit', 102355),
(1203, 'Maisha Mazuri','2025-01-12','Withdrawal', 12500),
(1201, 'Samuel Mukoma','2025-01-13','Deposit', 500000),
(1202, 'Boy Kid','2025-01-15','Deposit', 32000),
(1203, 'Maisha Mazuri','2025-01-16','Withdrawal', 8000);
```

Query for Account Balances
The following SQL query calculates the balance for each account based on the transaction history. It sums the deposits and subtracts the withdrawals to calculate the AccountBalance:
```sql
SELECT
    AccountNumber,
    AccountHolder,
    SUM(CASE WHEN TxnType = 'Deposit' THEN TxnAmount ELSE -TxnAmount END) AS AccountBalance
FROM bank_summary
GROUP BY AccountNumber, AccountHolder
ORDER BY AccountNumber;
```
Explanation:
SUM(CASE WHEN ... ELSE ... END): This conditional aggregation sums the deposit amounts and subtracts the withdrawal amounts for each account.
GROUP BY AccountNumber, AccountHolder: Groups the results by AccountNumber and AccountHolder, so the balance is calculated per account holder.
ORDER BY AccountNumber: Sorts the result by AccountNumber.
## Project Insights ##
This project demonstrates the use of SQL to:

- Create a table structure for tracking transaction data.
- Insert and manage transactional data.
- Calculate the balance of each account using conditional aggregation.

## Future Improvements ##
- Add more account holders and transactions for a more realistic dataset.
- Implement more complex queries to track other metrics, such as average transaction amounts.
- Use indexes on frequently queried columns (like AccountNumber) to improve query performance.