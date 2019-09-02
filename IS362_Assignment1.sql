-- Question 1

SELECT COUNT(speed) FROM planes WHERE speed IS NOT NULL ;
SELECT MAX(speed) FROM planes;
SELECT MIN(speed) FROM planes;

-- Question 2

SELECT SUM(distance) FROM flights
WHERE month = 1 AND year = 2013;

SELECT SUM(distance) FROM flights
WHERE month = 1 AND year = 2013 AND tailnum IS NULL;

-- Question 3: Inner join shows both tables where they intersect and Left Outer Join shows what's on the left side in
-- addition to the intersection.

SELECT P.manufacturer,(F.distance) FROM flights F
INNER JOIN planes P 
ON F.tailnum = P.tailnum 
WHERE F.year = 2013 AND F.month = 1 AND F.day = 5
GROUP BY P.manufacturer;

SELECT P.manufacturer,(F.distance) FROM flights F
LEFT OUTER JOIN planes P 
ON F.tailnum = P.tailnum 
WHERE F.year = 2013 AND F.month = 1 AND F.day = 5
GROUP BY P.manufacturer;

-- -- Question 4: Show all the Carriers that had delays into EWR/Airport where visibility 10

SELECT A.carrier, F.dest, W.visib FROM flights F
JOIN airlines A ON F.carrier = A.carrier 
JOIN weather W ON F.origin = W.origin
WHERE W.visib <= 5;