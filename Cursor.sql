select * from Instructor
declare Ins_cur cursor
for select [idIns] ,[InstuctorName] from Instructor
for read only
declare @idI int
declare @nameI nvarchar(30)
declare @counter int
open Ins_cur
begin
fetch Ins_cur into @idI,@nameI --for enter while first time
While @@fetch_status=0
begin
select @idI AS IDInstructor,@nameI AS InstructorName
fetch Ins_cur into @idI,@nameI
end
end
close Ins_cur
deallocate Ins_cur