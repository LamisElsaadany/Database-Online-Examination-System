alter proc enterquestionMCQ
(
@question nvarchar(50),
@labl1 char(1),
@Choic1 nvarchar(30),
@labl2 char(1),
@Choic2 nvarchar(30),
@labl3 char(1),
@Choic3 nvarchar(30),
@ModelAns char(1),
@Level char(1),
@Type bit,
@grade float
)
as
declare @queID int
insert into Question (QuestionBody,Correct_Answer,Que_Level,Type,Grade)
values (@question,@ModelAns,@Level,@Type,@grade)

select @queID= q.ID
from Question q
where QuestionBody=@question

insert into Choices (Q_ID,Choice,label)
values(@queID,@Choic1,@labl1),
	(@queID,@Choic2,@labl2),
	(@queID,@Choic3,@labl3)
	



