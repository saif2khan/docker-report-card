Select * from
(SELECT `shikshaSaathi`.`Designation` AS `Designation`,`shikshaSaathi`.`InspectionDate` AS `InspectionDate`,`shikshaSaathi`.`District` AS `District`, `shikshaSaathi`.`Block` AS `Block`, count(distinct `shikshaSaathi`.`InspectionID`) AS `count`
FROM `shikshaSaathi`
where {{District}}
and {{InspectionDate}}
and {{Designation}}
GROUP BY Designation, InspectionDate, District, `shikshaSaathi`.`Block`) as abc
order by count desc
LIMIT 20