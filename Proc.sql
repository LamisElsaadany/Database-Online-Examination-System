Insert_Instructor('Lamis',1)
Insert_Instructor('Aya',2)
Insert_Instructor('Youmna',1)


Insert_CourseIns(1,1)
Insert_CourseIns(1,2)


create trigger t
on Exam_Question_Student
for update
as
    if(St_grade not null)
	  select 'Not Allowed to update student grade'


