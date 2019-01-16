Select count(distinct(shikshaSaathi.SchoolName))
from
shikshaSaathi
inner join
(Select SchoolName, PercentAB
from
(Select a.SchoolName, (b.gradeA+c.gradeB)/a. total_stud as PercentAB 
from
(select SchoolName, sum(Observation) as total_stud
from shikshaSaathi
where Question = "Total number of students in class 3 Mat"
or Question = "Total number of students in class 3  Hin"
group by SchoolName) as a

inner join
(select SchoolName, sum(Observation) as gradeA
from shikshaSaathi
where Question = "Number of students in grade A Mat"
or Question = "Number of students in grade A Hin"
group by SchoolName) as b
on b.SchoolName = a.SchoolName

inner join 
(select SchoolName, sum(Observation) as gradeB
from shikshaSaathi
where Question = "Number of students in grade B  Mat"
or Question = "Number of students in grade B Hin"
group by SchoolName) as c
on c.SchoolName = a.SchoolName) as D

where PercentAB <= 0.50) as E

on shikshaSaathi.SchoolName = E.SchoolName
where {{District}}
and {{InspectionDate}}