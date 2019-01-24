Select * from
(SELECT Block, count(distinct `shikshaSaathi`.`InspectionID`) AS `count`
FROM `shikshaSaathi`
where {{District}}
and {{InspectionDate}}
and {{Designation}}
GROUP BY `shikshaSaathi`.`Block`) as abc
order by count desc
LIMIT 20