SELECT District, count(distinct InspectionID), 
CASE 
WHEN District = "BILASPUR (H.P.)" THEN count(distinct InspectionID)*100/(18*5*months)
WHEN District = "CHAMBA" THEN count(distinct InspectionID)*100/(18*15*months)
WHEN District = "HAMIRPUR (H.P.)" THEN count(distinct InspectionID)*100/(18*6*months)
WHEN District = "KANGRA" THEN count(distinct InspectionID)*100/(18*19*months)
WHEN District = "KINNAUR" THEN count(distinct InspectionID)*100/(18*3*months)
WHEN District = "KULLU" THEN count(distinct InspectionID)*100/(18*6*months)
WHEN District = "MANDI" THEN count(distinct InspectionID)*100/(18*21*months)
WHEN District = "SHIMLA" THEN count(distinct InspectionID)*100/(18*21*months)
WHEN District = "SIRMAUR" THEN count(distinct InspectionID)*100/(18*14*months)
WHEN District = "SOLAN" THEN count(distinct InspectionID)*100/(18*8*months)
WHEN District = "UNA" THEN count(distinct InspectionID)*100/(18*6*months)
WHEN District = "LAHUL & SPITI" THEN count(distinct InspectionID)*100/(18*4*months)
END as Compliance_percentage
FROM (
select *, period_diff(date_format(now(), '%Y%m'), date_format(InspectionDate, '%Y%m')) as months
from
shikshaSaathi
WHERE {{InspectionDate}}
and {{Designation}} ) as abc
GROUP BY District, months
ORDER BY District ASC
