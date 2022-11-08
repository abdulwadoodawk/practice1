use loan;
CREATE TABLE loan_card_master
(
	loan_id				varchar(10)		PRIMARY KEY,
	loan_type			varchar(20),
	duration_in_years	int
);
CREATE TABLE employee_master
(
	employee_id 		varchar(10)		PRIMARY KEY,
	employee_name		varchar(30),
	designation			varchar(255),
	
	department			varchar(255),
gender				varchar(6),
	date_of_birth		date,
	date_of_joining		date
);

CREATE TABLE item_master
(
	item_id				varchar(10)		PRIMARY KEY,
	item_description	varchar(50),
	issue_status		varchar(10),
	item_make			varchar(20),
	item_category		varchar(20),
	item_valuation		decimal(7,2)
);

CREATE TABLE employee_card_details
(
	employee_id 		varchar(10) 	REFERENCES 	employee_master(employee_id),
	loan_id				varchar(10)		REFERENCES	loan_card_master(loan_id),
	card_issue_date		date
);

CREATE TABLE employee_issue_details
(
	issue_id			varchar(10)		PRIMARY KEY,
	employee_id 		varchar(10) 	REFERENCES 	employee_master,
	item_id				varchar(10)		REFERENCES	item_master,
	issue_date			date,
	return_date			date	
);
select * from employee_issue_details
select * from employee_card_details
select * from  loan_card_master;
select * from employee_master;
select * from item_master;

insert into loan_card_master
values('00001','stationary',5);
insert into loan_card_master
values('00002','recurring',0);
insert into loan_card_master
values('00003','Crockery',1);



insert into employee_master 
values('E00001','Ram','Manager','Finance','M','1973-12-01','2001-01-01');

insert into employee_master 
values('E00002','Abhay','Assistant Manager',
'Finance','M','1976-01-01','2006-12-01');

insert into employee_master 
values('E00003','Anita','Senior Executive','Marketing','F','1977-05-12','2007-03-21');

insert into employee_master 
values('E00004','Zuben','Manager','Marketing','M','1974-10-12','2003-07-23');

insert into employee_master 
values('E00005','Radica','Manager','HR','F','1976-07-22','2004-01-23');

insert into employee_master 
values('E00006','John','Executive','HR','M','1983-11-08','2010-05-17');




insert into item_master 
values ('I00001','Tea Table','Y','Wooden','furniture',5000);

insert into item_master 
values ('I00002','Dining Table','N','Wooden','furniture',15000);

insert into item_master 
values ('I00003','Tea Table','N','Steel','furniture',6000);

insert into item_master 
values ('I00004','Side Table','Y','Wooden','furniture',2000);

insert into item_master 
values ('I00005','Side Table','Y','Steel','furniture',1500);

insert into item_master 
values ('I00006','Tea Table','N','Steel','furniture',7000);

insert into item_master 
values ('I00007','Dining Chair','Y','Wooden','furniture',1500);

insert into item_master 
values ('I00008','Tea Table','Y','Wooden','furniture',4000);

insert into item_master 
values ('I00009','Sofa','N','Wooden','furniture',18000);

insert into item_master 
values ('I00010','Cupboard','Y','Steel','furniture',10000);

insert into item_master 
values ('I00011','Cupboard','N','Steel','furniture',14000);


insert into item_master 
values ('I00012','Double Bed','Y','Wooden','furniture',21000);

insert into item_master 
values ('I00013','Double Bed','Y','Wooden','furniture',20000);

insert into item_master 
values ('I00014','Single Bed','Y','Steel','furniture',10000);

insert into item_master 
values ('I00015','Single Bed','N','Steel','furniture',10000);


insert into item_master 
values ('I00016','Tea Set','Y','Glass','Crockery',3000);

insert into item_master 
values ('I00017','Tea Set','Y','Bonechina','Crockery',4000);

insert into item_master 
values ('I00018','Dining Set','Y','Glass','Crockery',4500);

insert into item_master 
values ('I00019','Dining Set','N','Bonechina','Crockery',5000);

insert into item_master 
values ('I00020','Pencil','Y','Wooden','Stationary',5);

insert into item_master 
values ('I00021','Pen','Y','Plastic','Stationary',100);

insert into item_master 
values ('I00022','Pen','N','Plastic','Stationary',200);




insert into employee_card_details
values('E00001','00001','2000-01-01');

insert into employee_card_details
values('E00001','00002','2000-01-01');

insert into employee_card_details
values('E00001','00003','2002-12-14');

insert into employee_card_details
values('E00002','00001','2007-02-01');



insert into employee_card_details
values('E00002','00002','2007-03-11');

insert into employee_card_details
values('E00003','00001','2007-04-15');

insert into employee_card_details
values('E00003','00002','2007-04-15');

insert into employee_card_details
values('E00003','00003','2007-04-15');



insert into employee_issue_details
values('ISS001','E00001','I00001','2012-02-03','2014-02-03');
insert into employee_issue_details
values('ISS002','E00001','I00004','2012-02-03','2020-02-03');

insert into employee_issue_details
values('ISS003','E00002','I00005','2013-01-03','2015-01-03');
insert into employee_issue_details
values('ISS004','E00003','I00007','2010-07-04','2012-07-04');


insert into employee_issue_details
values('ISS005','E00003','I00008','2010-07-04','2012-08-05');

insert into employee_issue_details
values('ISS006','E00003','I00010','2012-03-14','2012-06-15');

insert into employee_issue_details
values('ISS007','E00004','I00012','2013-04-14','2016-04-14');

insert into employee_issue_details
values('ISS008','E00006','I00018','2012-08-18','2019-04-17');

insert into employee_issue_details
values('ISS009','E00004','I00018','2013-04-18','2013-05-18');

select * from employee_issue_details
select * from employee_card_details
select * from  loan_card_master;
select * from employee_master;
select * from item_master;
--query1
select item_category, count(item_id) as Count_category from item_master group by item_category order by Count_category desc;

--query2
select count(employee_id) as No_of_Employees from employee_master where department= 'HR'; 

--query3
select em.employee_id, em.employee_name, em.designation, em.department from employee_master em where employee_id not in (select 
employee_id from employee_issue_details) order by employee_id;

--query4
SELECT eid.employee_id, employee_name FROM employee_master em INNER JOIN employee_issue_details eid
ON em.employee_id=eid.employee_id
INNER JOIN item_master im
ON eid.item_id=im.item_id
WHERE item_valuation=(SELECT max(item_valuation)
FROM employee_issue_details eid INNER JOIN item_master im
ON eid.item_id=im.item_id) order by eid.employee_id;

--query5
select eid.issue_id, eid.employee_id, em.employee_name from employee_issue_details eid inner join employee_master em on
eid.employee_id  = em.employee_id order by issue_id;

--query6
select em.employee_id, em.employee_name from employee_master em  where employee_id not in 
(select employee_id from employee_card_details) order by employee_id;

--query7
select count(loan_id) as No_Of_Cards from employee_card_details ecd inner join employee_master em on ecd.employee_id = em.employee_id
where em.employee_name = 'Ram';

--query8
SELECT count(employee_id) as Count_stationary
FROM  employee_card_details ecd INNER JOIN  loan_card_master lcd
ON ecd.loan_id=lcd.loan_id
WHERE  loan_type='stationary';

--query9
SELECT eid.employee_id, em.employee_name, count(item_id) Count
FROM  employee_issue_details eid INNER JOIN employee_master em
ON em.employee_id=eid.employee_id
GROUP BY eid.employee_id order by count DESC, eid.employee_id;

--query10
SELECT eid.employee_id, employee_name FROM employee_master em INNER JOIN employee_issue_details eid ON em.employee_id=eid.employee_id
INNER JOIN item_master im ON eid.item_id=im.item_id WHERE item_valuation=(SELECT min(item_valuation)FROM employee_issue_details eid 
INNER JOIN item_master im ON eid.item_id=im.item_id) order by eid.employee_id;

--query11
SELECT eid.employee_id, --employee_name--
sum(item_valuation) TOTAL_VALUATION FROM employee_master em INNER JOIN employee_issue_details
eid ON em.employee_id = eid.employee_id INNER JOIN item_master im ON eid.item_id = im.item_id GROUP BY eid.employee_id 
ORDER BY eid.employee_id; 

--query12


--query13


--query14
SELECT gender , count(gender) No_of_Employees FROM employee_master GROUP BY gender ORDER BY gender;

--query15
SELECT employee_id, employee_name FROM employee_master WHERE year(date_of_joining)>2005 order by employee_id;

--query16
SELECT  issue_status, count(item_id) No_of_Furnitures FROM item_master WHERE  item_category='Furniture' GROUP BY issue_status
ORDER BY issue_status

--query17
SELECT item_category, item_make,item_description, count(item_description) No_of_Items FROM item_master GROUP BY item_category, 
item_make, item_description ORDER BY item_category, item_make,item_description;

--query20
SELECT item_id, item_description
FROM item_master
WHERE item_id
NOT IN ( SELECT item_id from employee_issue_details)
ORDER BY item_id;