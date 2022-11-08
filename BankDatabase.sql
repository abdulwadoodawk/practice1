------ Create Table-------
create database Bank;
go
use Bank
go
CREATE TABLE customer_master(
    CUSTOMER_NUMBER VARCHAR(6),
    FIRSTNAME VARCHAR(30),
    middlename VARCHAR(30),
    lastname VARCHAR(30),
    CUSTOMER_CITY VARCHAR(15),
    CUSTOMER_CONTACT_NO VARCHAR(10),
    occupation VARCHAR(10),
    CUSTOMER_DATE_OF_BIRTH DATE,
    CONSTRAINT customer_custid_pk PRIMARY KEY (CUSTOMER_NUMBER)
); 
CREATE TABLE branch_master(
    branch_id VARCHAR(6),
    branch_name VARCHAR(30),
    branch_city VARCHAR(30),
    CONSTRAINT branch_bid_pk PRIMARY KEY (branch_id)
);
 CREATE TABLE account_master
(   account_number VARCHAR(6),
    customer_number VARCHAR(6),
    branch_id VARCHAR(6),
    opening_balance BIGINT,
    account_opening_date DATE,
    account_type VARCHAR(10),
    account_status VARCHAR(10),
    PRIMARY KEY (account_number),
    FOREIGN KEY (customer_number) references customer_master(customer_number),
    FOREIGN KEY (branch_id) references branch_master(branch_id)
);
CREATE TABLE transaction_details(
    transaction_number VARCHAR(6),
    account_number VARCHAR(6),
    date_of_transaction DATE,
    medium_of_transaction VARCHAR(20),
    transaction_type VARCHAR(20),
    transaction_amount BIGINT,
    CONSTRAINT transaction_details_tnumber_pk PRIMARY KEY (transaction_number),
    CONSTRAINT transaction_details_acnumber_fk FOREIGN KEY (account_number) REFERENCES account_master (account_number)
);
create table loan_details
(
customer_number varchar(6),
branch_id varchar(6),
loan_amount bigint,
foreign key(customer_number) references customer_master(customer_number)
);


---- Record Insertion ----------
insert into customer_master values
('C00001','RAMESH','CHANDRA','SHARMA','DELHI','9543198345','SERVICE','1976-12-06'),
('C00002','AVINASH','SUNDER','MINHA','DELHI','9876532109','SERVICE','1974-10-16'),	
('C00003','RAHUL','NULL','RASTOGI','DELHI','9765178901','STUDENT','1981-09-26'),	
('C00004','PARUL','NULL','GANDHI','DELHI','9876532109','HOUSEWIFE','1976-11-03'),	
('C00005','NAVEEN','CHANDRA','AEDEKAR','MUMBAI','8976523190','SERVICE','1976-09-19'),	
('C00006','CHITRESH','NULL','BARWE','MUMBAI','7651298321','STUDENT','1992-11-06'),	
('C00007','AMIT','KUMAR','BORKAR','MUMBAI','9875189761','STUDENT','1981-09-06'),	
('C00008','NISHA',NULL,'DAMLE','MUMBAI','7954198761','SERVICE','1975-12-03'),	
('C00009','ABHISHEK',NULL,'DUTTA','KOLKATA','9856198761','SERVICE','1973-05-22'),	
('C00010','SHANKAR',NULL,'NAIR','CHENNAI','8765489076','SERVICE','1976-07-12');

insert into branch_master values
('B00001','ASAF ALI ROAD','DELHI'),
('B00002','NEW DELHI MAIN BRANCH','DELHI'),
('B00003','DELHI CANTT','DELHI'),
('B00004','JASOLA','DELHI'),
('B00005','MAHIM','MUMBAI'),
('B00006','VILE PARLE','MUMBAI'),
('B00007','MANDVI','MUMBAI'),
('B00008','JADAVPUR','KOLKATA'),
('B00009','KODAMBAKKAM','CHENNAI');

insert into account_master values
('A00001','C00001','B00001',1000,'2012-12-15','SAVING','ACTIVE'),
('A00002','C00002','B00001',1000,'2012-06-12','SAVING','ACTIVE'),
('A00003','C00003','B00002',1000,'2012-05-17','SAVING','ACTIVE'),
('A00004','C00002','B00005',1000,'2013-01-27','SAVING','ACTIVE'),
('A00005','C00006','B00006',1000,'2012-12-17','SAVING','ACTIVE'),
('A00006','C00007','B00007',1000,'2010-08-12','SAVING','SUSPENDED'),
('A00007','C00007','B00001',1000,'2012-10-02','SAVING','ACTIVE'),
('A00008','C00001','B00003',1000,'2009-11-09','SAVING','TERMINATED'),
('A00009','C00003','B00007',1000,'2008-11-30','SAVING','TERMINATED'),
('A00010','C00004','B00002',1000,'2013-03-01','SAVING','ACTIVE');

insert into transaction_details  values
('T00001','A00001','2013-01-01','CHEQUE','DEPOSIT',2000),
('T00002','A00001','2013-02-01','CASH','WITHDRAWAL',1000),
('T00003','A00002','2013-01-01','CASH','DEPOSIT',2000),
('T00004','A00002','2013-02-01','CASH','DEPOSIT',3000),
('T00005','A00007','2013-01-11','CASH','DEPOSIT',7000),
('T00006','A00007','2013-01-13','CASH','DEPOSIT',9000),
('T00007','A00001','2013-03-13','CASH','DEPOSIT',4000),
('T00008','A00001','2013-03-14','CHEQUE','DEPOSIT',3000),
('T00009','A00001','2013-03-21','CASH','WITHDRAWAL',9000),
('T00010','A00001','2013-03-22','CASH','WITHDRAWAL',2000),
('T00011','A00002','2013-03-25','CASH','WITHDRAWAL',7000),
('T00012','A00007','2013-03-26','CASH','WITHDRAWAL',2000);


insert into Loan_details  values
('C00001','B00001',100000),
('C00002','B00002',200000),
('C00009','B00008',400000),
('C00010','B00009',500000),
('C00001','B00003',600000),
('C00002','B00001',600000);

select count(*) from account_master;
select count(*) from branch_master;
select count(*) from customer_master;
select count(*) from loan_details;
select count(*) from transaction_details

select * from account_master;
select * from branch_master;
select * from customer_master;
select * from loan_details;
select * from transaction_details

------------------------------------------------------------------------------------
select * from customer_master;
select * from account_master;

--query 1
select am.account_number, am.customer_number, cm.firstname, cm.lastname, am.account_opening_date from account_master am inner join
customer_master cm on am.customer_number = cm.customer_number;

--query 2
select count(customer_number) as Cust_Count from customer_master where customer_city = 'Delhi';

--query3
select cm.customer_number, cm.firstname, am.account_number from customer_master cm inner join account_master am 
on cm.customer_number = am.customer_number where datepart (day,account_opening_date) > 15 order by customer_number, account_number; 

--query4
select cm.customer_number, cm.firstname, am.account_number from customer_master cm inner join account_master am 
on cm.customer_number = am.customer_number where account_status = 'Terminated' order by customer_number, account_number;

--query5
select transaction_type, count(transaction_number) as Trans_Count from transaction_details td inner join account_master am on 
td.account_number = am.account_number where am.customer_number like '%001'  group by transaction_type order by transaction_type; 

--query6
select count(*) as Count_Customer from customer_master cm left outer join account_master am
on cm.customer_number = am.customer_number where am.customer_number is NULL; 


--query7 
select (sum(td.transaction_amount + am.opening_balance)) as Deposit_Amount, am.account_number from transaction_details td inner join
account_master am on td.account_number = am.account_number where td.transaction_type = 'Deposit' group by
am.account_number, am.opening_balance order by am.account_number;

--query8
select cm.customer_city, count(am.account_number) as No_of_Accounts from account_master am, customer_master cm where
 am.customer_number = cm.customer_number group by cm.customer_city; 

 --query9
 select cm.firstname from customer_master cm, account_master am where cm.customer_number = am.customer_number group by cm.firstname
 having count(cm.firstname)>1 order by cm.firstname; 

 --query10
 select cm.customer_number, cm.firstname, cm.lastname from customer_master cm inner join loan_details ld on cm.CUSTOMER_NUMBER = 
 ld.customer_number group by cm.customer_number,cm.firstname, cm.lastname having count(cm.customer_number)>1 order by
 cm.customer_number;

 --query11
 select cm.customer_number, cm.firstname, cm.customer_city, bm.branch_city from customer_master cm inner join account_master am on
 cm.customer_number = am.customer_number inner join branch_master bm on am.branch_id = bm.branch_id where
 cm.customer_city != bm.branch_city;

 --query12
 select count(*) as count from customer_master cm left outer join account_master am on cm.CUSTOMER_NUMBER = am.customer_number
 inner join loan_details ld on ld.customer_number = cm.CUSTOMER_NUMBER where am.account_number is null;
