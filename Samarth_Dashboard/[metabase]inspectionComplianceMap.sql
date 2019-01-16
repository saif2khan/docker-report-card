select abc.*
from 
(SELECT count(distinct InspectionID), 
CASE 
WHEN District = "BILASPUR (H.P.)" THEN count(distinct InspectionID)*100/(18*5)
WHEN District = "CHAMBA" THEN count(distinct InspectionID)*100/(18*15)
WHEN District = "HAMIRPUR (H.P.)" THEN count(distinct InspectionID)*100/(18*6)
WHEN District = "KANGRA" THEN count(distinct InspectionID)*100/(18*19)
WHEN District = "KINNAUR" THEN count(distinct InspectionID)*100/(18*3)
WHEN District = "KULLU" THEN count(distinct InspectionID)*100/(18*6)
WHEN District = "MANDI" THEN count(distinct InspectionID)*100/(18*21)
WHEN District = "SHIMLA" THEN count(distinct InspectionID)*100/(18*21)
WHEN District = "SIRMAUR" THEN count(distinct InspectionID)*100/(18*14)
WHEN District = "SOLAN" THEN count(distinct InspectionID)*100/(18*8)
WHEN District = "UNA" THEN count(distinct InspectionID)*100/(18*6)
WHEN District = "LAHUL & SPITI" THEN count(distinct InspectionID)*100/(18*4)
END as Compliance_percentage,
case
when District = "BILASPUR (H.P.)" then 168
when District = "CHAMBA" then 169
when District = "HAMIRPUR (H.P.)" then 170
when District = "KANGRA" then 171
when District = "KINNAUR" then 172
when District = "KULLU" then 173
when District = "LAHUL & SPITI" then 174
when District = "MANDI" then 175
when District = "SHIMLA" then 176
when District = "SIRMAUR" then 177
when District = "SOLAN" then 178
when District = "UNA" then 179
end as district_id
FROM shikshaSaathi
WHERE {{InspectionDate}}
GROUP BY District
ORDER BY District ASC) as abc
