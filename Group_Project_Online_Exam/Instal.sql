use master
go
drop database dbSD20
go
create database dbSD20
go
use dbSD20
go

-----------------------------------------------

create table tbSession
(
	SessionId int primary key identity(1,1),
	SessionCode Varchar(60)
)
go

-----------------------------------------------

create table tbProgram
(
	ProgramId int primary key identity(1,1),
	ProgramName varchar(60),
	SessionId int foreign key references tbSession(SessionId) 
)
go

insert into tbProgram(ProgramName, SessionId)values
	('Software and Database Developer', '1'),('Accounting Specialist', '2'),('Administrative Professional', '3'),
	('Business Administration', '4'),('Casino / Resort / Event Coordinator', '5'),('Legal Assistant', '6'),
	('Travel Counsellor', '7'),('Veterinary Office Assistant', '8'),('Network Engineering', '9'),
	('Enhanced Health Care Aide', '10'),('Health Care Aide ', '11'),('Massage Therapy ', '12'),
	('Medical Laboratory Assistant', '13'),('Medical Office Assistant', '14'),('Nursing Assistant', '15'),
	('Pharmacy Technician', '16')
go

-----------------------------------------------

create table tbTeacher
(
	TeacherId int primary key identity(1,1),
	UserName Varchar(60),
	Password Varchar(60),
	Email Varchar(50),
	Admin int 
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
	ProgramId int foreign key references tbProgram(ProgramId),
	SessionId int foreign key references tbSession(SessionId)	
)
go

-----------------------------------------------

create table tbDifficulty
(
	DifficultyId int primary key identity(1,1),
	Name Varchar(60)
)
go

-----------------------------------------------
create table tbQuestion
(
  QuestionId int primary key identity(1,1),
  Question varchar(500),
  Answer1 varchar(50),
  Answer2 varchar(50),
  Answer3 varchar(50),
  Answer4 varchar(50),
  CorrectAnswer varchar(4),
  Marks int
)
go

------------------------------------------------
create table tbQuestionResponse
(
  QuestionResponseId int primary key identity(1,1),
  QuizResponseId int foreign key references tbQuizResponse(QuizResponseId),
  QuestionId int foreign key references tbQuestion(QuestionId),
  Response varchar(4)   
)
go

------------------------------------------------
create table tbQuize
(
  QuizeId int primary key identity(1,1),
  ProgramID int foreign key references tbProgram(ProgramId),
  DifficultyID int foreign key references tbDifficulty(DifficultyId)	
     
)
go
