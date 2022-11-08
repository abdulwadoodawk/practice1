--create a table for Registration--(fname,lname,emailid(pk),password(not null)-check
--,phone,address,dob,gender,security_Question,answer)--constraint
-------------------------SP(usp_tblRegistration_Insert)-----------------------
---sp--Login-------------------------
--showusersinfo-------select * from Registration where emailid=--------------------
------Editusersinfo-----update basis of emailid---------------------
-----ChangePassword:------update of ,oldpass,newpass emailid--------------------------
--forgetPassword:-----show secQues basis of emailid----------

create database gmail;
go
use gmail;

create table registration(fname varchar(256), lname varchar(256),emailid varchar(256) primary key, 
password varchar(256) not null check(datalength(password)>=6), phone bigint, address varchar(256), dob date, gender varchar(10),
security_q varchar(256), security_a varchar(256));

insert into registration values ('Anil','Sharma','anil@gmail.com','anil@123',9876543210,'Delhi','1996-01-10','Male','City you live in?',
'Delhi');
insert into registration values ('Anas','khan','anas@gmail.com','anas@123',9876543210,'Bombay','1996-10-03','Male','City you live in?',
'Bombay');
insert into registration values ('Riya','gupta','riya@gmail.com','riya@123',9876543210,'Delhi','1999-01-10','Female','City you live in?',
'Delhi');

select *from registration;
create procedure usp_tblRegistration_Insert (@fname varchar(256), @lname varchar(256),@emailid varchar(256), 
@password varchar(256) , @phone bigint, @address varchar(256), @dob date, @gender varchar(10),
@security_q varchar(256), @security_a varchar(256))
as
begin
insert into registration values (@fname, @lname,@emailid,@password,@phone, @address, @dob, @gender,@security_q, @security_a)
end

exec usp_tblRegistration_Insert 'Abdul', 'Wadood','abdul@gmail.com','abdul@123',7896541230,'Delhi','1999-10-01','Male','City you live in',
'Delhi';

create proc usp_tbl_Registration_login(@emailid varchar(256),@password varchar(256))
as
begin
select emailid, password from registration where emailid = @emailid and password = @password;
end

exec usp_tbl_Registration_login 'abdul@gmail.com', 'wadood@123';

create proc usp_tblRegistration_showUserInfo(@emailid varchar(256),@password varchar(256))
as
begin
select * from registration where emailid = @emailid and password = @password;
end

exec usp_tblRegistration_showUserInfo 'abdul@gmail.com','abdul@123';

create proc usp_tblRegistration_EditUserInfo(@emailid varchar(256),@fname varchar(256), @lname varchar(256), 
@phone bigint, @address varchar(256), @dob date, @gender varchar(10),
@security_q varchar(256), @security_a varchar(256))
as
begin
update registration set fname = @fname, lname=@lname, phone = @phone, address = @address, dob = @dob, gender= @gender,
security_q = @security_q, security_a = @security_a where emailid = @emailid;
end
drop proc usp_tblRegistration_EditUserInfo;

exec usp_tblRegistration_EditUserInfo 'anas@gmail.com','Anas','Alam',6547893210,'Rampur','2000-12-12','Male',
'Favourite sports?','Football';

create proc usp_tblRegistration_ChangePassword(@emailid varchar(256),@oldpass varchar(256),@newpass varchar(256))
as
begin
update registration set password = @newpass where emailid = @emailid and password = @oldpass;
end

exec usp_tblRegistration_ChangePassword 'abdul@gmail.com', 'abdul@123','wadood@123';

create proc usp_tblRegistration_ForgetPassword (@emailid varchar(256))
as
begin
select security_q from registration where emailid = @emailid;
end

exec usp_tblRegistration_ForgetPassword 'abdul@gmail.com';