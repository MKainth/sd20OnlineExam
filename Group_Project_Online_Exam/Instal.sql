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
create table tbQuestion
(
  QuestionId int primary key identity(1,1),
  Question varchar(500),
  Answer1 varchar(50),
  Answer2 varchar(50),
  Answer3 varchar(50),
  Answer4 varchar(50),
  CorrectAnswer varchar(4),
  Mark int
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

----------------------------------------------------------
create table tbActiveExam
(
  ActiveExamId int primary key identity(1,1),
  QuizId int foreign key references tbQuiz(QuizId),
  StartTime datetime,
  EndTime datetime,
  SessionId int foreign key references tbSession(SessionId)
)
go 

------------------------------------------------------------