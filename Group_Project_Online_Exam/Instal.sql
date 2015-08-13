﻿use master
go
drop database dbSD20
go
create database dbSD20
go
use dbSD20
go
create table tbProgram
(
	ProgramId int primary key identity(1,1),
	ProgramName varchar(max)
)
go
insert into tbProgram(ProgramName)values
	('Software and Database Developer'),('Accounting Specialist'),
	('Administrative Professional'),('Business Administration'),
	('Casino / Resort / Event Coordinator'),('Legal Assistant'),
	('Travel Counsellor'),('Veterinary Office Assistant'),('Network Engineering'),
	('Enhanced Health Care Aide'),('Health Care Aide '),('Massage Therapy '),
	('Medical Laboratory Assistant'),('Medical Office Assistant'),('Nursing Assistant'),
	('Pharmacy Technician')
go
create table tbSession
(
	SessionId int primary key identity(1,1),
	SessionCode Varchar(max),
	ProgramId int foreign key references tbProgram(ProgramId) 
)
go
insert into tbSession(SessionCode,ProgramId) values
('AP12',1),('AP13',2),('CREC01',4),('CREC02',4),('CREC03',4),
('LA10',5),('LA11',5),('LA12',5),
('TC002',6),('TC003',6),('TC004',6),
('VOA1',7),('VOA2',7),('VOA3',7),
('NA001',8),('NA002',8),('NA003',8),
('EHCA31',9),('EHCA32',9),('EHCA3',9),
('HCA07',10),('HCA08',10),('HCA09',10),
('MT03',11),('MT04',11),('MT05',11),
('MLA022',12),('MLA023',12),('MLA024',12),
('MOA11',13),('MOA12',13),('MOA14',13),
('NA15',14),('NA16',14),('NA17',14),
('PT007',15),('PT008',15),('PT009',15)
go
-----------------------------------------------
create table tbTypeOfQuestions
(
TypeOfQuestionsId int primary key identity(1,1),
Name varchar(max)
)
go
insert into tbTypeOfQuestions(Name)values
			('Multiple Questions/Fill the Blanks'),
			('True/False')
			
go
create table tbDifficulty
(
	DifficultyId int primary key identity(1,1),
	Name Varchar(max)
)
go
Insert into tbDifficulty(Name)values
			('Beginner'),
			('Intermediate'),
			('Advance')											
go

-----------------------------------------------

create table tbUser
(
	UserId int primary key identity(1,1),
	FirstName Varchar(max),
	LastName Varchar(max),
	Email Varchar(60) unique,---User Name----
	Password Varchar(max),
	SecurityLevel int 
	
)
go

Insert into tbUser (FirstName,LastName,Email,Password,SecurityLevel) values 
('Mohammad','Rahim','mohammad.rahim@robertsoncollege.net','1234',1),
('Mandeep','Kainth','mandeep.kainth@robertsoncollege.net','1234',2),
('Rimon','Bishay','rimon.bishay@robertsoncollege.net','1234',3)

go 
select * from tbUser
go
-----------------------------------------------

create table tbUserSession
(
UserSessionId int primary key identity(1,1),
UserId int foreign key references tbUser(UserId),
	SessionId int foreign key references tbSession(SessionId)	
)
go

-----------------------------------------------

create table tbQuestion
(
  QuestionId int primary key identity(1,1),
  Question varchar(max),
  Answer1 varchar(max) NULL,
  Answer2 varchar(max) NULL,
  Answer3 varchar(max) NULL,
  Answer4 varchar(max) NULL,
  CorrectAnswer varchar(max),
  Marks int
)
go

---------------------------------------------
------------------------------------------------

create table tbQuiz
(
  QuizId int primary key identity(1,1),
  QuizTitle varchar(max),
  TimeinMinute datetime,
  ProgramId int foreign key references tbProgram(ProgramId),
  DifficultyId int foreign key references tbDifficulty(DifficultyId),
  TypeOfQuestionsId int foreign key references tbTypeOfQuestions(TypeOfQuestionsId)	
     
)
go

------------------------------------------------

create table tbQuizResponse
(
  QuizResponseId int primary key identity(1,1),
  ExamDate Date,
  UserId int foreign key references tbUser(UserId)	    
)
go

------------------------------------------------
create table tbQuestionResponse
(
  QuestionResponseId int primary key identity(1,1),
  QuizResponseId int foreign key references tbQuizResponse(QuizResponseId),
  QuestionId int foreign key references tbQuestion(QuestionId),
  Response varchar(max)   
)
go

------------------------------------------------

create table tbUserProgram
(
  UserProgramId int primary key identity(1,1),
  UserId int foreign key references tbUser(UserId),
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

------------------------spInsertUser--------------------------

go
create proc spInsertUser
(
	@FirstName Varchar(60),
	@LastName varchar(60),
	@Password Varchar(60),
	@Email Varchar(60),
	@SecurityLevel int 
)
	as begin
	if exists (select Email from tbUser where Email=@Email)
	begin
	select 'ERROR!' as Message
		end
		else begin
			insert into tbUser(FirstName,LastName,Password,Email,SecurityLevel)values
			(@FirstName,@LastName,@Password,@Email,@SecurityLevel)
			select 'OK' as Message
end
end



--------------------spGetUser---------------------------------
go
create proc spGetUser
(
	@UserId int=NULL
)
	as begin
	Select  * from tbUser
	Where UserId=ISNULL (UserId,@UserId)
end

--------------------spDeleteUser-----------------------------

go
create proc spDeleteUser
(
	@UserId varchar (60)
)
	as begin
	delete from tbUser
	where UserId = @UserId
end

--exec spDeleteUser @UserId='Rahim'

--------------------spUpdateUser-----------------------------

go
create proc spUpdateUser
(
	@UserId int,
	@FirstName Varchar(60),
	@LastName Varchar(60),
	@Password Varchar(60),
	@Email Varchar(50),
	@SecurityLevel int
)
	as begin update tbUser 
	set FirstName=@FirstName, 
		LastName=@LastName,
		Password=@Password, 
		Email=@Email, 
		SecurityLevel=@SecurityLevel
	where UserId=@UserId
	end
go
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


---------------------Create Login Proc For User--------------------------

create procedure UserspLogin(
@Email varchar(60),
@Password varchar(60)
)
as begin
	select * from tbUser where tbUser.Email = @Email and tbUser.Password = @Password 
end
go
-----------------------------------
create proc spSelectSession
as begin
select * from tbSession
end
go
exec spSelectSession


go
create proc spSelectProgram
as begin
select * from tbProgram
end
go
exec spSelectProgram
go

create proc spSelectDifficulty
as begin
select * from tbDifficulty
end
go
exec spSelectDifficulty
go
create proc spSelectTypeofQusetions
as begin
select * from tbTypeOfQuestions
end
go
exec spSelectTypeofQusetions
go

----------------------------------------------------------------------------
create procedure spTeacher
as begin
  select FirstName, LastName, Password, Email, SecurityLevel from tbUser
                   where SecurityLevel=1
end 
go

----------------------------------------------------------------------
create procedure spStudent
as begin
  select FirstName, LastName, Password, Email, SecurityLevel from tbUser
                  where SecurityLevel=2
end
go
-----------------------------------------------------------------------
create proc spInsertQuestionMultiChoice
(
@QuizTitle varchar(60),
@ProgramId int,
@DifficultyId int,
@TimeInMinute dateTime,
@TypeOfQuestionsId int,
@Question varchar(max),
@Answer1 varchar(60),
@Answer2 varchar(60),
@Answer3 varchar(60),
@Answer4 varchar(60),
@CorrectAnswer varchar(60),
@Mark int
)
as begin
 insert into tbQuiz(QuizTitle,TimeInMinute,ProgramId,DifficultyId,TypeOfQuestionsId)values
				   (@QuizTitle,@TimeInMinute,@ProgramId,@DifficultyId,@TypeOfQuestionsId)
 insert into tbQuestion(Question,Answer1,Answer2,Answer3,Answer4,CorrectAnswer,Marks)values
						(@Question,@Answer1,@Answer2,@Answer3,@Answer4,@CorrectAnswer,@Mark)
end
go
create proc spInsertQuestionTrueFalse
(
@QuizTitle varchar(max),
@ProgramId int,
@DifficultyId int,
@TimeInMinute dateTime,
@TypeOfQuestionsId int,
@Question varchar(max),
--@Answer1 varchar(60),
--@Answer2 varchar(60),
@CorrectAnswer varchar(max),
@Mark int
)
as begin
 insert into tbQuiz(QuizTitle,TimeInMinute,ProgramId,DifficultyId,TypeOfQuestionsId)values
				   (@QuizTitle,@TimeInMinute,@ProgramId,@DifficultyId,@TypeOfQuestionsId)
 insert into tbQuestion(Question,CorrectAnswer,Marks)values
						(@Question,@CorrectAnswer,@Mark)
end
go


select * from tbQuiz
select * from tbQuestion
---------------------------------------------------------------------------------------------
-----------------------------------------------------tbResetpasswordRequest---------------------------------------------
--drop table tbResetpasswordRequest
go
create table tbResetpasswordRequest
(
ID uniqueidentifier primary key,
UserId int foreign key references tbUser(UserId),
ResetRequestDateTime datetime 
)
go
insert into tbResetpasswordRequest values ('a1c52544-0eb8-4912-8d38-241fbfcf9753',1,GETDATE())



go
create proc spResetPassword 
(
@Email varchar(60)
)
as begin
    Declare @UserId INT

	select @UserId=UserId, @Email=Email
		from tbUser
		where Email=@Email

    if (@UserId is Not null)
	  begin
		Declare @GUID uniqueIdentifier
		set @GUID=NEWID()
     
		INSERT INTO tbResetpasswordRequest (ID,UserId,ResetRequestDateTime)
		VALUES (@GUID,@UserId,GETDATE())

		SELECT 1 AS RETURNCODE,@UserId as Uniqueid, @Email as Email
	 end
	 else 
	 begin	 
		 -- if username does not exist
		 select 0 as RETURNCODE, NULL AS UNIQUEID, NULL AS EMAIL
	 END
	 END
	
	select* from tbUser