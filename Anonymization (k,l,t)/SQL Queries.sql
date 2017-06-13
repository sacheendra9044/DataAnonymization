CREATE DATABASE miniproject;

use miniproject;

SELECT DISTINCT(Occupation), COUNT(*) from Dataset GROUP BY Occupation;

DROP TABLE Dataset;
CREATE TABLE Dataset
(
Age integer,
Sex varchar(10),
Race varchar(50),
Education varchar(50),
MaritalStatus varchar(50),
Country varchar(50),
WorkClass varchar(50),
Occupation varchar(50),
SalaryClass varchar(20)
);



SELECT COUNT(*) FROM Dataset;



select * from dataset where Education='9th';

SELECT Occupation, COUNT(Occupation) FROM dataset GROUP BY Occupation ORDER BY COUNT(Occupation) DESC;


CREATE TABLE k_anonymous
(
Age integer,
Sex varchar(10),
Race varchar(50),
Education varchar(50),
MaritalStatus varchar(50),
Country varchar(50),
WorkClass varchar(50),
Occupation varchar(50),
SalaryClass varchar(20)
);

CREATE TABLE l_diverse
(
Age integer,
Sex varchar(10),
Race varchar(50),
Education varchar(50),
MaritalStatus varchar(50),
Country varchar(50),
WorkClass varchar(50),
Occupation varchar(50),
SalaryClass varchar(20)
);


CREATE TABLE t_close
(
Age integer,
Sex varchar(10),
Race varchar(50),
Education varchar(50),
MaritalStatus varchar(50),
Country varchar(50),
WorkClass varchar(50),
Occupation varchar(50),
SalaryClass varchar(20)
);

SELECT * FROM l_diverse WHERE Occupation="Exec-managerial";

SELECT * FROM k_anonymous WHERE Age=2 AND Sex="Any" AND Race="Person" AND Education = "School" AND MaritalStatus = "spouse present" AND Country = "Europe" AND WorkClass = "Non-Government" AND SalaryClass = "<=50K";
SELECT * FROM l_diverse WHERE Age=2 AND Sex="Any" AND Race="Person" AND (Education = "School" OR Education = "Any" OR Education = "***") AND (MaritalStatus = "spouse present" OR MaritalStatus = "Any") AND Country = "Europe" AND WorkClass = "Employed" AND SalaryClass = "<=50K";

SELECT * FROM l_diverse WHERE Country= 'Europe';

SELECT * FROM dataset WHERE WorkClass = 'Without-pay';
SELECT * FROM l_diverse WHERE WorkClass = 'Employed';