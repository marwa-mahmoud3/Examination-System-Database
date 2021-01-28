create view multiplechoice
as 
	(select
		q.[questions] 'All Questions',
		c.[A] 'First Choice',
		c.[B] 'Second Choice',
		c.[C] 'Third Choice',
		c.[C] 'Fourth Choice',
		mps.studnetAnswerMult 'Student Answer'
	from QuestionPool q,choices c ,MultipleAnswer_Student mps
	where idQp in 
	(
	  select mps.[idQustionsMultiple] 
	  from MultipleAnswer_Student where mps.idQustionsMultiple =q.idQp and  mps.idQustionsMultiple=c.idQuestion and mps.id_Student =1
    )
  )

select * from multiplechoice

create view True_And_False
as 
	(select
		q.[questions] 'All Questions',
		c.[True],c.[False] ,
		tfs.studnetAnswerTrueAndFalse 'Student Answer'
	from QuestionPool q,True_False c,TrueAndFalseAnswer_Student tfs
	where idQp in 
	(
	  select tfs.idQustionsTF 
	  from TrueAndFalseAnswer_Student where tfs.idQustionsTF =q.idQp and tfs.id_Student =1
    )
  )
select * from True_And_False
