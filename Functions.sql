create function StudentAccount_Name(@temp nvarchar(100))
returns @t table
(
Std_name nvarchar(50),
Account nvarchar(100)
)
as
begin
if(@temp='Std_Name_Account')
insert into @t
select StudentName,studentAccount from Student
return
end
select*from StudentAccount_Name('Std_Name_Account')