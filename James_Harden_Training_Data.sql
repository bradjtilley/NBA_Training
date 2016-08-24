--By Month %
SELECT  MONTH(date) as month,
		cast(cast(round(SUM(FGM)/SUM(FGA),3)*100 as decimal(18,1)) as varchar(4)) + ' %' as fg_perc 
FROM Harden_Training
GROUP BY MONTH(date)
;
--100 Shots
SELECT cast(cast(round(SUM(FGM)/SUM(FGA),3)*100 as decimal(18,1)) as varchar(4)) + ' %' as fg_perc 
FROM Harden_Training
WHERE shot_type not in ('20 - 40','40 - 80')
;
--Overall %
SELECT cast(cast(round(SUM(FGM)/SUM(FGA),3)*100 as decimal(18,1)) as varchar(4)) + ' %' as fg_perc 
FROM Harden_Training
;
--Shot Type %
SELECT shot_type,
	   cast(cast(round(SUM(FGM)/SUM(FGA),3)*100 as decimal(18,1)) as varchar(4)) + ' %' as fg_perc,
	   count(distinct id) as sample_size
FROM Harden_Training
GROUP BY shot_type
ORDER BY cast(cast(round(SUM(FGM)/SUM(FGA),3)*100 as decimal(18,1)) as varchar(4)) + ' %' desc
;
--% By Side
SELECT side,
	   cast(cast(round(SUM(FGM)/SUM(FGA),3)*100 as decimal(18,1)) as varchar(4)) + ' %' as fg_perc,
	   count(distinct id) as sample_size
FROM Harden_Training
GROUP BY side
ORDER BY cast(cast(round(SUM(FGM)/SUM(FGA),3)*100 as decimal(18,1)) as varchar(4)) + ' %' desc
;

