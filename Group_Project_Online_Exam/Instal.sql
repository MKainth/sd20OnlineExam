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
	Email Varchar(60),---User Name----
	Password Varchar(60),	
	SubjectId int foreign key references tbSubject
)
go

-----------------------------------------------

