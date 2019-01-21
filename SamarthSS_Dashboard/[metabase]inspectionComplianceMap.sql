SELECT District, count(distinct InspectionID), @month_diff := max(months),
CASE 
WHEN District = "BILASPUR (H.P.)" THEN count(distinct InspectionID)*100/(18*5*@month_diff)
WHEN District = "CHAMBA" THEN count(distinct InspectionID)*100/(18*15*@month_diff)
WHEN District = "HAMIRPUR (H.P.)" THEN count(distinct InspectionID)*100/(18*6*@month_diff)
WHEN District = "KANGRA" THEN count(distinct InspectionID)*100/(18*19*@month_diff)
WHEN District = "KINNAUR" THEN count(distinct InspectionID)*100/(18*3*@month_diff)
WHEN District = "KULLU" THEN count(distinct InspectionID)*100/(18*6*@month_diff)
WHEN District = "MANDI" THEN count(distinct InspectionID)*100/(18*21*@month_diff)
WHEN District = "SHIMLA" THEN count(distinct InspectionID)*100/(18*21*@month_diff)
WHEN District = "SIRMAUR" THEN count(distinct InspectionID)*100/(18*14*@month_diff)
WHEN District = "SOLAN" THEN count(distinct InspectionID)*100/(18*8*@month_diff)
WHEN District = "UNA" THEN count(distinct InspectionID)*100/(18*6*@month_diff)
WHEN District = "LAHUL & SPITI" THEN count(distinct InspectionID)*100/(18*4*@month_diff)
END as Compliance_percentage
FROM (
select *, period_diff(date_format(now(), '%Y%m'), date_format(InspectionDate, '%Y%m')) as months
from
shikshaSaathi
WHERE {{InspectionDate}}
and {{Designation}} 
) as abc
GROUP BY District
ORDER BY District ASC
