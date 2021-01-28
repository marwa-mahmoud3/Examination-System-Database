--procedure run if email is found in Account table
create procedure SP_TrainingManagerAddInstructor
(
@idIns int ,
@InstructorAccount nvarchar(100),
@InstuctorName nvarchar(30),
@Birthdate date,
@IDManager int
)
as
begin
if(@IDManager=1 or @IDManager=2)
begin
insert into Instructor values(@idIns,@InstructorAccount,@InstuctorName,@Birthdate,@IDManager)
end
else
select 'you must be training manager to add instructor';
end
exec SP_TrainingManagerAddInstructor 10,'alaaa111a@gmail.com','Alaa','1/1/1985',1
exec SP_TrainingManagerAddInstructor 10,'alaaa111a@gmail.com','Alaa','1/1/1985',3

select * from Instructor

-------------------------------------------procedure to insert Account
create procedure InsertAccount
(
@Email nvarchar(100),
@Passward nvarchar(30)
)
as
begin
insert into Account values (@Email,@Passward)
end
Exec InsertAccount 'mona@gail.com','mo12345'
Exec InsertAccount 'AymanAyad@gmail.com','ayman12345'
Exec InsertAccount 'Ahmedddd@gmail.com','ahmed12345'


exec SP_TrainingManagerAddInstructor 11,'mona@gail.com','Alaa','1/1/1985',1

select * from Account
select * from Instructor

------procedure training namager to update in training manager
create procedure UpdateInstructor(@IDManager int)
as
begin
if(@IDManager=1 or @IDManager=2)
begin
update Instructor set IDManager=2 where
idIns=9
end
else 
select 'You must be an training manager to update an Instructor'
end
exec UpdateInstructor 1
exec UpdateInstructor 4



select * from Instructor
-------procedure to delete instructor
create procedure SP_DeleteInstructor(@IDManager int)
as
begin
if(@IDManager=1 or @IDManager=2)
begin
delete from Instructor
where idIns=10
end
else
select 'You must be an training manager to delete an Instructor';
end
exec SP_DeleteInstructor 1
exec SP_DeleteInstructor 3
select * from Instructor


------------------
create procedure SP_AddCourses
(
@idCourse int,
@CourseName nvarchar(20),
@MinDegree int,
@MaxDegree int,
@Coursedescription nvarchar(400),
@IDManager int
)
as
begin
if(@IDManager=1 or @IDManager=2)
begin
insert into Course values
(
@idCourse,@CourseName,@MinDegree,@MaxDegree,@Coursedescription
)
end
else
select 'you must be training manager to add course';
end
Exec SP_AddCourses 13,'CSS',50,120,'CSS stands for Cascading Style Sheets. CSS describes how HTML elements are to be displayed on screen, paper, or in other media',1
Exec SP_AddCourses 15,'LINQ',50,100,'LINQ (Language Integrated Query) is a Microsoft programming model and methodology that essentially adds formal query capabilities into Microsoft',3
Exec SP_AddCourses 16,'DataSientist',50,100,'Data scientists utilize their analytical, statistical, and programming skills to collect, analyze, and interpret large data sets ',2



select * from Course
------------procedure to training manager to update in course
create procedure SP_UpdatecourseNameandCoursedescription(@IDManager int)
as
begin
if(@IDManager=1 or @IDManager=2)
begin
update Course set CourseName='HTML5',Cousredescription='HTML5 is a markup language used for structuring and presenting content on the World Wide Web. It is the fifth and last major HTML version that is a World Wide Web Consortium (W3C) recommendation'
where idCourse=12
end
else
select 'You must be an training manager to update an Course'
end
exec SP_UpdatecourseNameandCoursedescription 1
exec SP_UpdatecourseNameandCoursedescription 4
select * from Course



-------procedure to delete course from course by training manager
create procedure SP_DelelteCourse(@IDManager int)
as
begin
if(@IDManager=1 or @IDManager=2)
begin
delete from Course
where idCourse=16
end
else
select 'You must be an training manager to delete an Course';
end
exec SP_DelelteCourse 1
exec SP_DelelteCourse 3



create procedure SP_AddInstructorForEachCourse
(
@IDTeachInstructor int,
@IDTeachCourse int,
@YEARTYpe int,
@id_ssequence int,
@IDManager int
)
as
begin
if(@IDManager=1 or @IDManager=2 )
begin
insert into TeachCourse values(@IDTeachInstructor,@IDTeachCourse, @YEARTYpe,@id_ssequence)
end
else
select 'You Must an Trainaning Manager to add Instructor For each course'
end
Exec SP_AddInstructorForEachCourse 2,3,2005,26,1
Exec SP_AddInstructorForEachCourse 2,3,2009,27,4
Exec SP_AddInstructorForEachCourse 7,4,2005,27,1

---------------degree student 1 in Multiple choice in oop exam-----------
create procedure Degree(@IDStudent int ,@idExam int)
as 
begin 
declare @totaldegree int ,@degree int ,@degreeText int ,@degreeTF int 
set @degree=0;
set @degreeText =0 
set @degreeTF = 0
     if (@IDStudent =1 or @IDStudent=2 or @IDStudent=3)
	   begin	   
	      declare @a nvarchar(300)
		  set @a= (select studnetAnswerMult from MultipleAnswer_Student where id_Student =@IDStudent and idQustionsMultiple=1  and id_numExam =@idExam)
		  declare @aa nvarchar(300)
		  set @aa =(select CorrectAnswer from MultibleChoiceQuestions where IDQuestMulti=1)
	      declare @b nvarchar(300)
		  set @b= (select studnetAnswerMult from MultipleAnswer_Student where id_Student =@IDStudent and idQustionsMultiple=8 and id_numExam =@idExam)
		  declare @bb nvarchar(300)
		  set @bb =(select CorrectAnswer from MultibleChoiceQuestions where IDQuestMulti=8)
		  declare @c nvarchar(300)
		  set @c= (select studnetAnswerMult from MultipleAnswer_Student where id_Student =@IDStudent and idQustionsMultiple=9 and id_numExam =@idExam)
		  declare @cc nvarchar(300)
		  set @cc =(select CorrectAnswer from MultibleChoiceQuestions where IDQuestMulti=9)
		  if (@a = @aa)
		    begin 
			set @degree = @degree+1
			end
		  if (@b = @bb)
		    begin 
			set @degree = @degree+1
			end
		  if (@c = @cc)
		    begin 
			set @degree = @degree+1
			end
		  declare @x nvarchar(300)
		  set @x= (select studnetAnswerText from TextAnswer_Student where id_Student=@IDStudent and id_numExam =@idExam and idQustionsT =48 )
		  declare @x1 nvarchar(300)
		  set @x1= (select studnetAnswerText from TextAnswer_Student where id_Student=@IDStudent and id_numExam =@idExam and idQustionsT =49 )
		  declare @x2 nvarchar(300)
		  set @x2= (select studnetAnswerText from TextAnswer_Student where id_Student=@IDStudent and id_numExam =@idExam and idQustionsT =50 )
		  declare @x3 nvarchar(300)
		  set @x3= (select studnetAnswerText from TextAnswer_Student where id_Student=@IDStudent and id_numExam =@idExam and idQustionsT =51 )
		  declare @x4 nvarchar(300)
		  set @x4= (select studnetAnswerText from TextAnswer_Student where id_Student=@IDStudent and id_numExam =@idExam and idQustionsT =52 )
		  declare @x5 nvarchar(300)
		  set @x5= (select studnetAnswerText from TextAnswer_Student where id_Student=@IDStudent and id_numExam =@idExam and idQustionsT =53 )
		  declare @x6 nvarchar(300)
		  set @x6= (select studnetAnswerText from TextAnswer_Student where id_Student=@IDStudent and id_numExam =@idExam and idQustionsT =54 )
		  
		  if(len(@x) >=20 and @x like '%[abstract and Inheritance]%' )
		   begin 
		      set @degreeText = @degreeText +( select Degree from TextQuestions where IDT = 48);
		   end
		   if(len(@x1) >=20 and @x1 like '%[Polymorphism]%' )
		   begin 
		      set @degreeText = @degreeText + ( select Degree from TextQuestions where IDT = 49);
		   end
		   if(len(@x2) >=20 and @x2 like '%[developer]%' )
		   begin 
		      set @degreeText = @degreeText + ( select Degree from TextQuestions where IDT = 50);
		   end
		   if(len(@x3) >=10 and @x3 like '%[part of]%' )
		   begin 
		      set @degreeText = @degreeText +( select Degree from TextQuestions where IDT = 51);
		   end
		   if(len(@x4) >=10 and @x4 like '%[abstreact]%' )
		   begin 
		      set @degreeText = @degreeText + ( select Degree from TextQuestions where IDT = 52);
		   end
		   if(len(@x5) >=20 and @x5 like '%[extensable]%' )
		   begin 
		      set @degreeText = @degreeText + ( select Degree from TextQuestions where IDT = 53);
		   end
		   if(len(@x6) >=10 and @x6 like '%[Structure]%' )
		   begin 
		      set @degreeText = @degreeText + ( select Degree from TextQuestions where IDT = 54);
		   end
		  declare @y nvarchar(300)
		  set @y= (select studnetAnswerTrueAndFalse from TrueAndFalseAnswer_Student where id_Student=@IDStudent and id_numExam =@idExam and idQustionsTF =18 )
		  declare @y1 nvarchar(300)
		  set @y1= (select studnetAnswerTrueAndFalse from TrueAndFalseAnswer_Student where id_Student=@IDStudent and id_numExam =@idExam and idQustionsTF =44 )
		  declare @y2 nvarchar(300)
		  set @y2= (select studnetAnswerTrueAndFalse from TrueAndFalseAnswer_Student where id_Student=@IDStudent and id_numExam =@idExam and idQustionsTF =45 )
		  declare @y3 nvarchar(300)
		  set @y3= (select studnetAnswerTrueAndFalse from TrueAndFalseAnswer_Student where id_Student=@IDStudent and id_numExam =@idExam and idQustionsTF =46 )
		  declare @y4 nvarchar(300)
		  set @y4= (select studnetAnswerTrueAndFalse from TrueAndFalseAnswer_Student where id_Student=@IDStudent and id_numExam =@idExam and idQustionsTF =47 )
		  declare @y5 nvarchar(300)
		  set @y5= (select studnetAnswerTrueAndFalse from TrueAndFalseAnswer_Student where id_Student=@IDStudent and id_numExam =@idExam and idQustionsTF =48 )
		  
		  if (@y = (select CorrectAnswer from TrueAndFalse where IDTF =18))
		    begin 
			  set @degreeTF = @degreeTF +1;
			end
		 if (@y1 = (select CorrectAnswer from TrueAndFalse where IDTF =44))
		    begin 
			  set @degreeTF = @degreeTF +1;
			end
		if (@y2 = (select CorrectAnswer from TrueAndFalse where IDTF =45))
		    begin 
			  set @degreeTF = @degreeTF +1;
			end
		 if (@y3 = (select CorrectAnswer from TrueAndFalse where IDTF =46))
		    begin 
			  set @degreeTF = @degreeTF +1;
			end
		 if (@y = (select CorrectAnswer from TrueAndFalse where IDTF =47))
		    begin 
			  set @degreeTF = @degreeTF +1;
			end
		if (@y = (select CorrectAnswer from TrueAndFalse where IDTF =48))
		    begin 
			  set @degreeTF = @degreeTF +1;
			end	
	set @totaldegree =@degree + @degreeText + @degreeTF
	declare @m nvarchar(100)
	set @m= (select StudentName from Student where idStud =@IDStudent)
	select 'Total degree of ' + @m + '  is' + str(@totaldegree)+'  from 80  in OOP Course'
	 
		if(@totaldegree <=55)
		begin
		   update QuestionExam_Student set TypeExam= 'Corrective' where id_Student=@IDStudent 
		end	
   end
else 
	  select 'Student not exam Or This Exam Not occure'
end
exec Degree 1,11
exec Degree 2,11
exec Degree 3,11
exec Degree 4,5
 
 select *from QuestionExam_Student


create procedure UpdateInstructorForEachCourse(@IDManager int)
as
begin
if(@IDManager=1 or @IDManager=2)
	begin
	update TeachCourse set YearInstructorTeachCourse=2006 where
	IDTeachInstructor=2
	end
else
	select 'You must be an training manager to update an Instructor for each course'
end
EXEC UpdateInstructorForEachCourse 1

select * from TeachCourse


create procedure SP_DeleteInstructorForEachCiurse(@IDManager int)
as
begin
if(@IDManager=1 or @IDManager=2)
begin
delete from TeachCourse
where IDTeachInstructor=2
end
else
select 'You must be an training manager to delete an Instructor for each course';
end
exec SP_DeleteInstructorForEachCiurse 2

select * from TeachCourse



-------------------

create procedure sp_addBranch
(@Id_Branch int,
@Name_Branch nvarchar(100),
@Address_Branch nvarchar(500),
@IDManager int
)as
begin
if(@IDManager=1 or @IDManager=2)
   begin
   insert into Branch values(@Id_Branch,@Name_Branch,@Address_Branch)
   end
   else
   select 'You Must an Training Manager To Add New Branch'
end
select*from Branch
exec sp_addBranch 8,'Luxor Branch','Teba ,Luxor University,Luxor Governate',1
exec sp_addBranch 8,'Luxor Branch','Teba ,Luxor University,Luxor Governate',3

------------procedure to ubdate branch
create procedure sp_updateBranch
(@Id_Branch int,
@Name_Branch nvarchar(100),
@IDManager int
)as
begin
if(@IDManager=1 or @IDManager=2)
   begin
   update Branch
   set NameBranch=@Name_Branch
   where IDBranch=@Id_Branch
   end
   else
   select 'You Must an Training Manager To Update Branch'
end
exec sp_updateBranch 8,'Luxor Branch11',1
select*from Branch

--- procedure add track in department
create procedure sp_addTrack(
@id_track int,
@Name_Track nvarchar(50),
@NumOFMonth int,
@id_Dept int,
@IDManager int
)
as
begin
if(@IDManager=1 or @IDManager=2)
   begin
   insert into Track values(@id_track,@Name_Track,@NumOFMonth,@id_Dept)
   end
   else
   select 'You Must an Training Manager To Add New Track'
end
exec sp_addTrack 11,'Data Science',3,1,1
select*from Track


----procedure to ubdate Track
create procedure sp_updateTrack
(@id_track int,
@id_Dept int,
@IDManager int
)as
begin
if(@IDManager=1 or @IDManager=2)
   begin
   update Track
   set ID_Dept=@id_Dept
   where IDTrack=@id_track
   end
   else
   select 'You Must an Training Manager To Update Track'
end
exec sp_updateTrack 8,3,1
select*from Track

----procedure to add intake
create procedure sp_addIntake
(@Id_Intake int,
@Num_Intake int,
@IDManager int
)as
begin
if(@IDManager=1 or @IDManager=2)
   begin
   insert into Intake values(@Id_Intake,@Num_Intake)
   end
   else
   select 'You Must an Training Manager To Add New Intake'
end
exec sp_addIntake 10,39,1
select*from Intake


--procedure to add new students	
create procedure sp_addStudent
(@Id_Student int,
@Std_Account nvarchar(100),
@Std_Name nvarchar(500),
@id_intake int ,
@id_track int,
@birth_date date,
@IDManager int
)as
begin
if(@IDManager=1 or @IDManager=2)
   begin
   insert into Student values(@Id_Student,@Std_Account,@Std_Name,@id_intake,@id_track,@birth_date)
   end
   else
   select 'You Must an Training Manager To Add New Student'
end

exec sp_addStudent 22,'Eman@gmail.com','Eman Abd ElZaher',8,7,'1/1/1995',1
select*from Student


create procedure sp_addQuestionInQuestionPool(
@id_qpool int,
@Question nvarchar(300),
@id_instructor int,
@id_course int
)
as
begin
declare @idinstructor int
if exists(select IDTeachInstructor from TeachCourse where IDTeachInstructor=@id_instructor and IDTeachCourse=@id_course)
begin
    insert into QuestionPool values(@id_qpool,@Question)
end
else
  select 'You Must Add A Question In Your Course Only'
end

exec sp_addQuestionInQuestionPool 86,'what is an interface in C#?',1,1
exec sp_addQuestionInQuestionPool 87,'what Comparable in C#?',1,1
exec sp_addQuestionInQuestionPool 88,'what is an interface in C#?',1,2
select*from QuestionPool

--procedure to UPDATE in Question Pool
create procedure sp_updateQuestionInQuestionPool(
@id_qpool int,
@Question nvarchar(300),
@id_instructor int,
@id_course int
)
as
begin
declare @idinstructor int
if exists(select IDTeachInstructor from TeachCourse where IDTeachInstructor=@id_instructor and IDTeachCourse=@id_course)
begin
update QuestionPool
set questions=@Question
where idQP=@id_qpool
end
else
  select 'You Must UPDATE A Question In Your Course Only'
end

exec sp_updateQuestionInQuestionPool 57,'What the Comparable in C#?',1,1
exec sp_updateQuestionInQuestionPool 57,'What the Comparable in C#?',1,2

select*from QuestionPool

create procedure sp_deleteQuestionInQuestionPool(
@id_qpool int,
@id_instructor int,
@id_course int
)
as
begin
declare @idinstructor int
if exists(select IDTeachInstructor from TeachCourse where IDTeachInstructor=@id_instructor and IDTeachCourse=@id_course)
begin
delete from QuestionPool
where idQP=@id_qpool
end
else
  select 'You Must DELETE A Question In Your Course Only'
end

exec sp_deleteQuestionInQuestionPool 57,1,1
exec sp_deleteQuestionInQuestionPool 57,1,2

select*from QuestionPool