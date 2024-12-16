SELECT
    AccountNumber,
    AccountHolder,
    SUM(CASE WHEN TxnType = 'Deposit' THEN TxnAmount ELSE -TxnAmount END) AS AccountBalance
FROM bank_summary
GROUP BY accountnumber, accountholder
ORDER BY accountnumber
;