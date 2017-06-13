CREATE DATABASE Project;

USE Project;

CREATE TABLE data_set
(LIMIT_BAL integer,
BILL_AMOUNT integer,
JOB varchar(25),
SEX varchar(10),
EDUCATION varchar(20),
MARRIAGE varchar(20),
AGE integer,
PAY_DUE varchar(5));

COMMIT;

DROP TABLE data_set;
SELECT * from data_set where marriage='Widow';

commit;anon_data_set

CREATE TABLE anon_data_set
(LIMIT_BAL integer,
BILL_AMOUNT integer,
JOB varchar(25),
SEX varchar(10),
EDUCATION varchar(20),
MARRIAGE varchar(20),
AGE integer,
PAY_DUE varchar(5));

SELECT * FROM anon_data_set WHERE SEX="Any" AND EDUCATION = "University" AND AGE = 4 AND MARRIAGE = "Single" AND JOB = "Shopkeeper"

SELECT * FROM anon_data_set;

SELECT * FROM anon_data_set WHERE SEX="Any" AND EDUCATION = "University" AND AGE = 3 AND JOB = "Engineer"

SELECT * FROM anon_data_set WHERE SEX="Any" AND EDUCATION = "University" AND AGE = 3 AND JOB = "Artist"

SELECT LIMIT_BAL, COUNT(LIMIT_BAL) FROM anon_data_set GROUP BY LIMIT_BAL;