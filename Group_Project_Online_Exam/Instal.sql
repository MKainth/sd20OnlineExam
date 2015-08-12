use master
go
drop database dbSD20
go
create database dbSD20
go
use dbSD20
go

create table tbSession
(
	SessionId int primary key identity(1,1),
	SessionCode Varchar(60)
)
go

	--insert into tbSession (SessionCode) values ('SD20'),('AS')
-----------------------------------------------

create table tbProgram
(
	ProgramId int primary key identity(1,1),
	ProgramName varchar(max),
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
	TeacherName Varchar(60),
	Password Varchar(60),
	Email Varchar(50),
	Admin int 
)
go
insert into tbTeacher(TeacherName,Password,Email,Admin) values ('Rimon','1234','rimon.bishay@robertson.com',0)
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

create table tbQuiz
(
  QuizId int primary key identity(1,1),
  ProgramId int foreign key references tbProgram(ProgramId),
  DifficultyId int foreign key references tbDifficulty(DifficultyId)	
     
)
go

------------------------------------------------

create table tbQuizResponse
(
  QuizResponseId int primary key identity(1,1),
  ExamDate Date,
  StudentId int foreign key references tbStudent(StudentId)	    
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

create table tbTeacherProgram
(
  TeacherProgramId int primary key identity(1,1),
  TeacherId int foreign key references tbTeacher(TeacherId),
  ProgramId int foreign key references tbProgram(ProgramId)	    
)
go

------------------------------------------------

create table tbActiveExam
(
  ActiveExamId int primary key identity(1,1),
  StartTime Time,
  EndTime Time,
  SessionId int foreign key references tbSession(SessionId) 	    
)
go

---------------------Create Login Proc For Student--------------------------

create procedure StudentspLogin(
@Email varchar(60),
@Password varchar(60)
)
as begin
	select * from tbStudent where tbStudent.Email = @Email and tbStudent.Password = @Password 
end
go

---------------------Create Login Proc For Teacher--------------------------

create procedure TeacherspLogin(
@Email varchar(60),
@Password varchar(60)
)
as begin
	select * from tbTeacher where tbTeacher.Email = @Email and tbTeacher.Password = @Password 
end
go

