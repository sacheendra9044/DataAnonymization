

USE IPRJ605;



CREATE TABLE data_set
(LIMIT_BAL integer,
SEX varchar(10) CHECK (SEX in ('Male','Female')),
EDUCATION varchar(20),
MARRIAGE varchar(20),
AGE integer,
BILL_AMOUNT integer,
PAY_DUE varchar(5));

commit

SELECT * FROM data_set;

commit;


CREATE TABLE kanon
(LIMIT_BAL integer,
SEX varchar(10),
EDUCATION varchar(20),
MARRIAGE varchar(20),
AGE integer,
BILL_AMOUNT integer,
PAY_DUE varchar(5));

SELECT * FROM kanon;

SELECT COUNT(*) FROM kanon;

SELECT * FROM kanon WHERE SEX="Person" AND EDUCATION = "University" AND PAY_DUE = "Yes"

