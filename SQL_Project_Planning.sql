
SELECT 
    Start_Date, 
    (SELECT MIN(End_Date) 
     FROM Projects 
     WHERE End_Date NOT IN (SELECT Start_Date FROM Projects) 
       AND End_Date > P.Start_Date) as Real_End_Date
FROM Projects P
WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)
ORDER BY (Real_End_Date - Start_Date) ASC, Start_Date;
