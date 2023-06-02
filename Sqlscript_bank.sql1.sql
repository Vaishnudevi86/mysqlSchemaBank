INSERT INTO bank_schema.bank (bank_id, bank_name,address,contact_number) VALUES ('234', 'Axis','No 23 first street GA', '4343553767');
INSERT INTO bank_schema.bank (bank_id, bank_name,address,contact_number) VALUES ('235', 'ICICI','No 56 first street GA', '4453553767');
INSERT INTO bank_schema.bank (bank_id, bank_name,address,contact_number) VALUES ('236', 'SBI','No 26 first street GA', '4453553797');
INSERT INTO bank_schema.bank (bank_id, bank_name,address,contacbankt_number) VALUES ('237', 'Ameris','No 59 first street GA', '4453553297');
INSERT INTO bank_schema.bank (bank_id, bank_name,address,contact_number) VALUES ('238', 'KYB','No 48 first street GA', '4456663797');
INSERT INTO bank_schema.branch (branch_id, branch_name,bank_id,address,contact_number) VALUES ('5', 'SBI1','236','No 26 first street GA', '4456663797');
INSERT INTO bank_schema.branch (branch_id, branch_name,bank_id,address,contact_number) VALUES ('6', 'ICICI1','235','No 56 first street GA', '4453553767');
INSERT INTO bank_schema.customer (customer_id, customer_name,branch_id,address,contact_number) VALUES ('12453', 'James','5','No 5674 first street GA', '445987557');
INSERT INTO bank_schema.customer (customer_id, customer_name,branch_id,address,contact_number) VALUES ('12457', 'Jones','6','No 590 first street GA', '442488557');

UPDATE bank_schema.bank SET bank_name = 'New Bank A' WHERE bank_id = 234;
UPDATE bank_schema.bank SET bank_name = 'New Bank B' WHERE bank_id = 235;
UPDATE bank_schema.branch SET branch_name = 'New Branch 2' WHERE branch_id = 4;
UPDATE bank_schema.branch SET branch_name = 'New Branch 1' WHERE branch_id = 3;
UPDATE  bank_schema.account SET account_holder_id = '11111111' WHERE account_id = 2;
UPDATE  bank_schema.account SET account_holder_id = '22222222' WHERE account_id = 4;
UPDATE  bank_schema.account SET account_holder_id  = '33333333' WHERE account_id = 3;

DELETE FROM  bank_schema.bank WHERE bank_id = 1;
DELETE FROM  bank_schema.bank WHERE bank_id = 2;
DELETE FROM  bank_schema.bank WHERE bank_id = 3;
DELETE FROM  bank_schema.branch WHERE branch_id = 1;
DELETE FROM  bank_schema.branch WHERE branch_id = 2;
DELETE FROM  bank_schema.branch WHERE branch_id = 3;
DELETE FROM  bank_schema.account WHERE account_id = 1;
DELETE FROM  bank_schema.account WHERE account_id = 2;
DELETE FROM  bank_schema.account WHERE account_id = 3;

ALTER TABLE  bank_schema.bank ADD COLUMN created_date DATE;
-- Drop a column from the branch table
ALTER TABLE  bank_schema.branch DROP COLUMN branch_manager;
-- Modify the data type of a column in the account table---
ALTER TABLE  bank_schema.account MODIFY COLUMN account_type varchar(20);
-- Rename the branch table to new_branch
ALTER TABLE  bank_schema.branch RENAME TO new_branch;
-- Add a foreign key constraint to the account table
ALTER TABLE  bank_schema.account ADD CONSTRAINT fk_branch_id FOREIGN KEY (branch_id) REFERENCES branch(branch_id);

SELECT *
FROM bank_schema.bank
JOIN branch ON bank.bank_id = branch.bank_id
JOIN account ON branch.branch_id = account.branch_id;

SELECT *
FROM bank_schema.bank
LEFT JOIN branch ON bank.bank_id = branch.bank_id;

SELECT *
FROM  bank_schema.bank
RIGHT JOIN branch ON bank.bank_id = branch.bank_id;

SELECT *
FROM bank
INNER JOIN branch ON bank.bank_id = branch.bank_id;

SELECT *
FROM  bank_schema.bank
FULL JOIN branch ON bank.bank_id = branch.bank_id;

SELECT *
FROM  bank_schema.bank
JOIN branch ON bank.bank_id = branch.bank_id;


SELECT bank_id, COUNT(*) AS branch_name
FROM bank_schema.branch
GROUP BY bank_id;

SELECT branch_id, AVG(balance) AS balance
FROM bank_schema.account
GROUP BY branch_id;

SELECT branch_id, max(balance) AS balance
FROM bank_schema.account
GROUP BY branch_id;

SELECT branch_id, MIN(balance) AS balance
FROM bank_schema.account
GROUP BY branch_id;

SELECT branch_id, SUM(balance) AS total_balance
FROM bank_schema.account
GROUP BY branch_id;

SELECT branch_id, COUNT(DISTINCT branch_name) AS unique_branches
FROM bank_schema.branch
GROUP BY branch_id;

SELECT branch_id, CONCAT('Branch Count: ', COUNT(*), ', Total Balance: $', SUM(balance)) AS summary
FROM bank_schema.account
GROUP BY branch_id;



SELECT branch_id, AVG(balance) AS balance
FROM bank_schema.account
GROUP BY branch_id
HAVING AVG(balance) > 10000;

SELECT branch_id, MAX(balance) AS balance
FROM bank_schema.account
GROUP BY branch_id
HAVING MAX(balance) > 40000;

SELECT branch_id, MIN(balance) AS balance
FROM bank_schema.account
GROUP BY branch_id
HAVING MIN(balance) < 10000;

SELECT branch_id, SUM(balance) AS total_balance
FROM bank_schema.account
GROUP BY branch_id
HAVING SUM(balance) > 40000;

SELECT loan_id, COUNT(DISTINCT loan_type) AS unique_loan_type
FROM bank_schema.loan
GROUP BY loan_id
HAVING COUNT(DISTINCT loan_type);

