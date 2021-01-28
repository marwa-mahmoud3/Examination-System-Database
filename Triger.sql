create TRIGGER CourseDelete
ON Course
After Delete
as
begin
	select 'Delete Is Run'
end

Create TRIGGER CourseUpdate
ON Course
After Update
as
begin
	select 'Update Is Run'
end
