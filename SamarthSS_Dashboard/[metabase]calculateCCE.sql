Select distinct(shikshaSaathi.UdiseCode), InspectionDate, District, Block, PercentAB
from
shikshaSaathi
inner join
(Select UdiseCode, PercentAB
from
(Select a.UdiseCode, (b.gradeAB)/a.total_stud as PercentAB 
from
(select UdiseCode, sum(Observation) as total_stud
from shikshaSaathi
where Question = "Total number of students in class 3 Mat"
or Question = "Total number of students in class 3  Hin"
group by UdiseCode) as a

inner join

(select UdiseCode, sum(Observation) as gradeAB
from shikshaSaathi
where Question = "Number of students in grade A Mat"
or Question = "Number of students in grade A Hin"
or Question = "Number of students in grade B  Mat"
or Question = "Number of students in grade B Hin"
group by UdiseCode) as b
on b.UdiseCode = a.UdiseCode) as C

where PercentAB <= 0.50) as D

on shikshaSaathi.UdiseCode = D.UdiseCode
where {{District}}
and {{Block}}
and {{Designation}}
and {{InspectionDate}}
order by District, Block