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
	('Software and Database Developer', 1),('Accounting Specialist', 2)/*('Administrative Professional', 3),
	('Business Administration', 4),('Casino / Resort / Event Coordinator', 5),('Legal Assistant', 6),
	('Travel Counsellor', 7),('Veterinary Office Assistant', 8),('Network Engineering', 9),
	('Enhanced Health Care Aide', 10),('Health Care Aide ', 11),('Massage Therapy ', 12),
	('Medical Laboratory Assistant', 13),('Medical Office Assistant', 14),('Nursing Assistant', 15),
	('Pharmacy Technician', 16)*/
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

---------------------------------------------
create table tbDifficulty
(
	DifficultyId int primary key identity(1,1),
	Name Varchar(60)
)
go

------------------------------------------------

create table tbQuiz
(
  QuizId int primary key identity(1,1),
  QuizTitle varchar(60),
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

-----------------------------------------------



create proc spQuestionsInsert
(

  @Question varchar(500),
  @Answer1 varchar(50),
  @Answer2 varchar(50),
  @Answer3 varchar(50),
  @Answer4 varchar(50),
  @CorrectAnswer varchar(4),
  @Marks int
  )

  as begin
  insert into tbQuestion(Question,Answer1,Answer2,Answer3,Answer4,CorrectAnswer,Marks)values
						(@Question,@Answer1,@Answer2,@Answer3,@Answer4,@CorrectAnswer,@Marks)

end
go
create proc spQuestionsUpdate
(
@QuestionId int,
  @Question varchar(500),
  @Answer1 varchar(50),
  @Answer2 varchar(50),
  @Answer3 varchar(50),
  @Answer4 varchar(50),
  @CorrectAnswer varchar(4),
  @Marks int
  )

  as begin
  update tbQuestion
  set Question=@Question,
	  Answer1=@Answer1,
	  Answer2=@Answer2,
	  Answer3=@Answer3,
	  Answer4=@Answer4,
	  CorrectAnswer=@CorrectAnswer,
	  Marks=@Marks
	  where QuestionId=@QuestionId

end
go
create proc spQuestionDelete
(
@QuestionId int
)
as begin
	delete from tbQuestion
	where QuestionId=@QuestionId
end
go
create proc spQuestion
(
@QusetionId int
)
as begin
	select * from tbQuestion
end 
go
--------------------------------------------------------------
-----------------*******STUDENT CRUD*******-------------------
create procedure spGetStudentById
(
  @StudentId int = NULL
)
as begin
 select * from tbStudent where StudentId=ISNULL(@StudentId, StudentId)
end
go
create procedure spInsertStudent
(
  @FirstName Varchar(max),
  @LastName Varchar(max),
  @Email Varchar(60),---User Name----
  @Password Varchar(60),	
  @ProgramId int,
  @SessionId int
)
as begin
 insert into tbStudent(FirstName, LastName, Email, Password, ProgramId, SessionId)values
                      (@FirstName, @LastName, @Email, @Password, @ProgramId, @SessionId)
end
go
create procedure spUpdateStudent
(
 @StudentId int,
 @FirstName Varchar(max),
 @LastName Varchar(max),
 @Email Varchar(60),---User Name----
 @Password Varchar(60),
 @ProgramId int,
 @SessionId int	
)
as begin
  update tbStudent set
   FirstName = @FirstName,
   LastName = @LastName,
   Email = @Email,
   Password = @Password,
   ProgramId = @ProgramId,
   SessionId = @SessionId 
  where StudentId = @StudentId
end
go
create procedure spDeleteStudent
(
  @StudentId int = NULL
)
as begin
  delete from tbStudent where StudentId = @StudentId
end 
go