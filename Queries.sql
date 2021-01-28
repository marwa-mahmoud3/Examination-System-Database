select NameBranch,TrackName from Branch,Track where IDBranch in
(
   select id_Branch from TrackBranch where IDBranch=id_Branch and IDTrack=id_Track
)


select InstuctorName ,CourseName from Instructor,Course where idIns in
(
   select IDTeachInstructor from TeachCourse where IDTeachInstructor = idIns and idCourse =IDTeachCourse
)


select StudentAccount from Student

select InstuctorName,InstructorAccount from Instructor


-------instructor has many number phone
select InstuctorName,phone  from [dbo].[Instructor],[dbo].[InstructorPhone]
where idInstructor=idIns


-------student has many number phone
select StudentName,phone from [dbo].[Student],[dbo].[StudentPhone]
where idStudent=idStud order by idStudent


---------------------------
select ExamName,AllownceOption from 
Exam,AllowanceOptionExam 
where idExam=idAllowanceExam


-------------OOP Exam----------------------
select questions  from QuestionPool where idQP in 
(
  select idQuestion_Exam from QuestionExam where idQuestion_Exam =idQP  and id_Exam=11
)

    -----------Random oop exam ----------
select idQP,questions  from QuestionPool where idQP in 
(
  select idQuestion_Exam from QuestionExam where idQuestion_Exam =idQP  and id_Exam=11 and idQP >= RAND()*(SELECT MAX(idQP) FROM QuestionPool )
)

DECLARE @random1 int,@random2 int 
SET @random1 = (SELECT FLOOR(RAND()*(1-10+1))+1)
SET @random2 = (SELECT FLOOR(RAND()*(6-10+1))+5)
;
WITH CTE_Random
AS
(
  SELECT ROW_NUMBER() OVER(ORDER BY idQP) AS CNT,q.[questions],c.[True],c.[False] from QuestionPool q,True_False c,TrueAndFalseAnswer_Student tfs where idQp in 
	(
		 select tfs.idQustionsTF from TrueAndFalseAnswer_Student where tfs.idQustionsTF =q.idQp and tfs.id_Student =1 
	) 
)
SELECT * FROM CTE_Random WHERE cnt between @random1 and @random2


  

------------OS Exam--------------
select questions from QuestionPool where idQP in 
(
  select idQuestion_Exam from QuestionExam where idQuestion_Exam =idQP  and id_Exam=3
)

------------C# Exam--------------
select questions from QuestionPool where idQP in 
(
  select idQuestion_Exam from QuestionExam where idQuestion_Exam =idQP  and id_Exam=13
)

------------SWE Exam--------------
select questions from QuestionPool where idQP in 
(
  select idQuestion_Exam from QuestionExam where idQuestion_Exam =idQP  and id_Exam=12
)

------------C++ Exam--------------
select questions from QuestionPool where idQP in 
(
  select idQuestion_Exam from QuestionExam where idQuestion_Exam =idQP  and id_Exam=14
)

------------C Exam--------------
select questions from QuestionPool where idQP in 
(
  select idQuestion_Exam from QuestionExam where idQuestion_Exam =idQP  and id_Exam=15
)

-------------------Exam And Choices ---------------
------------ multiple choice in oop exam and answer student 1 ------------
select q.questions,c.A,c.B,c.C,c.D,mps.studnetAnswerMult from QuestionPool q,choices c ,MultipleAnswer_Student mps where  idQp in 
(
   select mps.idQustionsMultiple from MultipleAnswer_Student where mps.idQustionsMultiple =q.idQp and  mps.idQustionsMultiple=c.idQuestion and mps.id_Student =2
)


------------ True and false in oop exam student  1------------

----------------------------Course -----------------
select I.InstuctorName ,C.CourseName,T.YearInstructorTeachCourse from Instructor I,Course C,TeachCourse T where idIns in
(
select T.IDTeachInstructor from TeachCourse where T.IDTeachInstructor = I.idIns and C.idCourse =T.IDTeachCourse
)


SELECT OBJECT_NAME(IXOS.OBJECT_ID) TeachCourse
,IX.name Index_Name
,IX.type_desc Index_Type
,SUM(PS.[used_page_count]) * 8 IndexSizeKB
,IXOS.LEAF_INSERT_COUNT NumOfInserts
,IXOS.LEAF_UPDATE_COUNT NumOfupdates
,IXOS.LEAF_DELETE_COUNT NumOfDeletes

FROM SYS.DM_DB_INDEX_OPERATIONAL_STATS (NULL,NULL,NULL,NULL ) IXOS
INNER JOIN SYS.INDEXES AS IX ON IX.OBJECT_ID = IXOS.OBJECT_ID AND IX.INDEX_ID = IXOS.INDEX_ID
INNER JOIN sys.dm_db_partition_stats PS on PS.object_id=IX.object_id
WHERE OBJECTPROPERTY(IX.[OBJECT_ID],'IsUserTable') = 1
GROUP BY OBJECT_NAME(IXOS.OBJECT_ID), IX.name, IX.type_desc,IXOS.LEAF_INSERT_COUNT, IXOS.LEAF_UPDATE_COUNT,IXOS.LEAF_DELETE_COUNT

-------------------
