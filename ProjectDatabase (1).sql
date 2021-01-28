create database FundamentalAdvanced
on
 PRIMARY
  ( NAME='MyDB_Primary',
    FILENAME=
       'D:\Database1.mdf',
    SIZE=4MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB
  ),
FILEGROUP MyDB_FileGroup
  ( NAME = 'MyDB_FG1_Dat1',
    FILENAME =
       'D:\Database1File.mdf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB
   )
   LOG ON
   ( NAME = 'MyDB_Dat1',
    FILENAME =
       'D:\Database1FileLOG.ldf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB
   )
use FundamentalAdvanced;

create table InstructorPhone
(
   phone nvarchar (50) ,
   idInstructor int ,
   constraint idInstructor foreign key(idInstructor) references Instructor(idIns)
) on MyDB_FileGroup
select * from InstructorPhone


create table Instructor 
(
    idIns int primary key ,
	InstructorAccount nvarchar(100),
	InstuctorName nvarchar(30),
	Birthdate Date ,
    IDManager int, 
    constraint InstuctotManager foreign key (IDManager) references Instructor(idIns),
	age as (DATEDIFF(year,BirthDate,GETDATE())+CONVERT(int,(DATEDIFF(month, BirthDate,GETDATE()) % 12))/12),
    constraint AccountInstructor foreign key(InstructorAccount) references Account(Email)
) on MyDB_FileGroup
go
select * from Instructor

create table StudentPhone
(
   phone nvarchar (50) ,
   idStudent int ,
   constraint idStudent foreign key(idStudent) references Student(idStud)
)on MyDB_FileGroup

create table  Student 
(
	idStud int primary key,
	studentAccount nvarchar(100) not null,
	StudentName nvarchar(50),
	Id_intake int,
	id_track int,
	BirthDate Date ,
    age as (DATEDIFF(year,BirthDate,GETDATE())+CONVERT(int,(DATEDIFF(month, BirthDate,GETDATE()) % 12))/12),
	constraint AccountStudent foreign key(studentAccount) references Account(Email),
	constraint idintake foreign key (Id_intake) references Intake(IDIntak),
	constraint idtrack foreign key (id_track) references Track(IDTrack)
)on MyDB_FileGroup
go
select * from Student


create table AllowanceOptionExam
( 
   idAllowanceExam int,
   AllownceOption nvarchar(100),
   constraint idAllowanceExam foreign key (idAllowanceExam) references Exam(idExam)
)on MyDB_FileGroup
select * from AllowanceOptionExam


create table Exam
(
   idExam int primary key ,
   ExamName nvarchar(20),
   StartTime time(0),
   EndTime time (0),
   TotalTime time(0),
   TypeExam nvarchar(20) default 'Exam',
   ExamYear int
)on MyDB_FileGroup
go
select * from EXam


create table Course 
(
   idCourse int Primary Key ,
   CourseName nvarchar(20),
   MinDegree int, 
   MaxDegree int ,
   Cousredescription nvarchar(400)
)on MyDB_FileGroup
go
select * from Course;


create table Branch
(
  IDBranch int primary key,
  NameBranch nvarchar(100),
  Address nvarchar(500)
)on MyDB_FileGroup
go
select * from Branch;

create table Track
(
 IDTrack int primary key,
 TrackName nvarchar(50),
 NumberOfMonths int,
 ID_Dept int,
 constraint IDDepartement foreign key(ID_Dept) references Depatement(iDDept)
)on MyDB_FileGroup
go
select * from Track;


create table Depatement
(
 iDDept int primary key,
 NameDept nvarchar(100)
)on MyDB_FileGroup
go
select * from Depatement


create table Intake
(
 IDIntak int primary key,
 IntakeNum int
)on MyDB_FileGroup
go
select * from Intake


create table Account
(
  Email nvarchar(100) primary Key,
  Passward nvarchar(30)
)on MyDB_FileGroup
go
select * from Account

create table QuestionPool
(
	idQP int primary key,
	questions nvarchar(300)
)on MyDB_FileGroup
go
select * from QuestionPool


create table MultibleChoiceQuestions
(
	 IDQuestMulti int primary key,
	 Degree int,
	 Question nvarchar(300),
	 coursetype nvarchar(50),
	 CorrectAnswer nvarchar(200),
	 constraint cmulti foreign key (IDQuestMulti) references QuestionPool(idQP)
)on MyDB_FileGroup
go
select * from choices

create table choices
(
  idQuestion int ,
  A nvarchar(300),
  B nvarchar(300),
  C nvarchar(300),
  D nvarchar(300),
  constraint constraintchoices foreign key(idQuestion) references MultibleChoiceQuestions(IDQuestMulti)
)on MyDB_FileGroup


create table TrueAndFalse
(
	 IDTF int primary key,
	 Degree int,
	 Question nvarchar(300),
	 coursetype nvarchar(50),
	 CorrectAnswer char(5),
	 constraint cTF foreign key (IDTF) references QuestionPool(idQP)
)on MyDB_FileGroup
go
select*from TrueAndFalse;



create table TextQuestions
(
	 IDT int primary key,
	 Degree int,
	 Question nvarchar(300),
	 coursetype nvarchar(50),
	 constraint cText foreign key (IDT) references QuestionPool(idQP)
)on MyDB_FileGroup
go
select*from TextQuestions

create table TeachCourse
(
IDTeachInstructor int not null,
IDTeachCourse int not null,
YearInstructorTeachCourse int,
id_sequence int,
constraint constraintInstructor foreign key (IDTeachInstructor) references Instructor(idIns),
constraint constraintCourse foreign key (IDTeachCourse) references Course(idCourse)
)on MyDB_FileGroup

select * from Instructor
create table TrackBranch
(
	id_Branch int not null,
	id_Track int not null,
	constraint constraintHasInstructor foreign key (id_Branch) references Branch(IDBranch), 
	constraint constraintHasStudent foreign key (id_Track) references Track(IDTrack)
) on MyDB_FileGroup
go
select * from TrackBranch

 
create table QuestionExam
(
    idQuestion_Exam int,
	id_Exam int , 
    constraint constraintIdQuestion foreign key (idQuestion_Exam) references QuestionPool(idQP),
	constraint constraintExam foreign key (id_Exam) references Exam(idExam)
)on MyDB_FileGroup

 select * from QuestionExam
 select * from QuestionExam_Student

create table QuestionExam_Student
(
	id_Exam int ,
	id_Student int ,
	TypeExam nvarchar(20) default 'Exam',
	constraint constraintanswerExam foreign key (id_Exam) references Exam(idExam),
	constraint constraintStudentAnswer foreign key (id_Student) references Student(idStud)
)on MyDB_FileGroup

create table MultipleAnswer_Student
(
   id_numExam int ,
   id_Student int,
   idQustionsMultiple int,
   studnetAnswerMult nvarchar(300),
   constraint constrainMultiple foreign key (id_numExam) references Exam(idExam),
   constraint constraintanswerMultiple foreign key (id_Student) references Student(idStud),
   constraint constraintanswerMul foreign key (idQustionsMultiple) references QuestionPool(idQP)
)on MyDB_FileGroup

create table TrueAndFalseAnswer_Student
(
   id_numExam int ,
   id_Student int,
   idQustionsTF int,
   studnetAnswerTrueAndFalse nvarchar(300),
   constraint constrainTandF foreign key (id_numExam) references Exam(idExam),
   constraint constraintanswerTrueandFalse foreign key (id_Student) references Student(idStud),
   constraint constraintanswerTF foreign key (idQustionsTF) references QuestionPool(idQP)
)on MyDB_FileGroup

create table TextAnswer_Student
(
   id_numExam int ,
   id_Student int,
   idQustionsT int,
   studnetAnswerText nvarchar(300),
   constraint constraintTe foreign key (id_numExam) references Exam(idExam),
   constraint constraintanswerText foreign key (id_Student) references Student(idStud),
   constraint constraintanswerT foreign key (idQustionsT) references QuestionPool(idQP)
)on MyDB_FileGroup

create table True_False
(
  True nvarchar(10),
  False nvarchar(10)
)on MyDB_FileGroup










