use master
go
drop database dbSD20
go
create database dbSD20
go
use dbSD20
go
-----------------------------------------------
create table tbSubject
(
	SubjectId int primary key identity(1,1),
	SubjectName varchar(60)
)
go
insert into tbSubject(SubjectName)values
 ('Software and Database Developer'),('Accounting Specialist'),('Administrative Professional'),
 ('Business Administration'),('Casino / Resort / Event Coordinator'),('Legal Assistant'),
 ('Travel Counsellor'),('Veterinary Office Assistant'),('Network Engineering'),
 ('Enhanced Health Care Aide'),('Health Care Aide '),('Massage Therapy '),
('Medical Laboratory Assistant'),('Medical Office Assistant'),('Nursing Assistant'),
('Pharmacy Technician')
go
-----------------------------------------------
create table tbTeacher
(
	TeacherId int primary key identity(1,1),
	TeacherName Varchar(max),
	UserName Varchar(60),
	Password Varchar(60),
	SubjectId int foreign key references tbSubject
)
go

-----------------------------------------------
create table tbStudent
(
	StudentId int primary key identity(1,1),
	FirstName Varchar(max),
	LastName Varchar(max),
	Email Varchar(60) unique,---User Name----
	Password Varchar(60),	
	SubjectId int foreign key references tbSubject
)
go

-----------------------------------------------

