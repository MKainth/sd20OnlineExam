use master
go
drop database dbSD20
go
create database dbSD20
go
use dbSD20
go
--------------------------------------------------------------
create table tbSession
(
	SessionId int primary key identity(1,1),
	SessionCode Varchar(60)
	
)
go


insert into tbSession (SessionCode) values ('SD20'),('AS'),
	('SD18'),('SD19'),('SD20'),
('AS01'),('AS02'),('AS03')
/*('AP12',2),('AP13',2),('AP14',2),
('BA23',3),('BA24',3),('BA25',3),
('CREC01',4),('CREC02',4),('CREC03',4),
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
('PT007',15),('PT008',15),('PT009',15)*/
go
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

create table tbUser
(
	UserId int primary key identity(1,1),
	FirstName Varchar(max),
	LastName Varchar(max),
	Email Varchar(60) unique,---User Name----
	Password Varchar(60),	
	SecurityLevel int 
	
)
go

-----------------------------------------------

create table tbUserSession
(
UserSessionId int primary key identity(1,1),
UserId int foreign key references tbUser(UserId),
SessionId int foreign key references tbSession(SessionId)	
)


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
  UserId int foreign key references tbUser(UserId)	    
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
	as begin update tbUser set FirstName=@FirstName, LastName=@LastName,Password=@Password, Email=@Email, SecurityLevel=@SecurityLevel
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

