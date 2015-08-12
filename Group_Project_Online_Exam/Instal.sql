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

	insert into tbSession (SessionCode) values ('SD20'),('AS')
-----------------------------------------------

create table tbProgram
(
	ProgramId int primary key identity(1,1),
	ProgramName varchar(max),
	SessionId int foreign key references tbSession(SessionId) 
)
go

insert into tbProgram(ProgramName, SessionId)values
	('Software and Database Developer', 1),('Accounting Specialist', 2)
	--('Administrative Professional', '3'),
	--('Business Administration', '4'),('Casino / Resort / Event Coordinator', '5'),('Legal Assistant', '6'),
	--('Travel Counsellor', '7'),('Veterinary Office Assistant', '8'),('Network Engineering', '9'),
	--('Enhanced Health Care Aide', '10'),('Health Care Aide ', '11'),('Massage Therapy ', '12'),
	--('Medical Laboratory Assistant', '13'),('Medical Office Assistant', '14'),('Nursing Assistant', '15'),
	--('Pharmacy Technician', '16')
go
-----------------------------------------------

create table tbTeacher 
(
	TeacherId int primary key identity(1,1),
	TeacherName Varchar(60),
	Password Varchar(60),
	Email Varchar(50),---Email is use as UserName---
	Admin int 
)
go

--select * from tbTeacher
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

------------------------spInsertTeacher--------------------------

go
create proc spInsertTeacher
(
	@TeacherName Varchar(60),
	@Password Varchar(60),
	@Email Varchar(60),---Email is use as UserName---
	@Admin int 
)
	as begin
	if exists (select Email from tbTeacher where Email=@Email)
	begin
	select 'ERROR!' as Message
		end
		else begin
			insert into tbTeacher(TeacherName,Password,Email,Admin)values
			(@TeacherName,@Password,@Email,@Admin)
			select 'OK' as Message
end
end

---select * from tbTeacher---

--------------------spGetTeacher---------------------------------
go
create proc spGetTeacher
(
	@TeacherId int=NULL
)
	as begin
	Select TeacherId, TeacherName, Password, Email, Admin from tbTeacher
	Where TeacherId=ISNULL (@TeacherId, TeacherId)
end

--------------------spDeleteTeacher-----------------------------

go
create proc spDeleteTeacher
(
	@TeacherId varchar (60)
)
	as begin
	delete from tbTeacher
	where TeacherId = @TeacherId
end

--exec spDeleteTeacher @TeacherId='Rahim'

--------------------spUpdateTeacher-----------------------------

go
create proc spUpdateTeacher
(
	@TeacherId int,
	@TeacherName Varchar(60),
	@Password Varchar(60),
	@Email Varchar(50),
	@Admin int
)
	as begin update tbTeacher set TeacherName=@TeacherName,Password=@Password, Email=@Email,Admin=@Admin
	where teacherId=@TeacherId
	end







