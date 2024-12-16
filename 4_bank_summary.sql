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
(1203, 'Maisha Mazuri','2025-01-16','Withdrawal', 8000)
;
SELECT
    AccountNumber,
    AccountHolder,
    SUM(CASE WHEN TxnType = 'Deposit' THEN TxnAmount ELSE -TxnAmount END) AS AccountBalance
FROM bank_summary
GROUP BY accountnumber, accountholder
ORDER BY accountnumber
;