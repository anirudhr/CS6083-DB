/*List all customer who have rented “Terminator 1” and “Terminator 2” but not “Terminator 3”.*/
USE videoRentalChain;
SELECT DISTINCT customer.cid,cname FROM customer
INNER JOIN rented ON rented.cid = customer.cid
INNER JOIN copy ON copy.copyid = rented.copyid
INNER JOIN movie ON movie.mid = copy.mid
WHERE title IN ('Terminator1','Terminator2')
GROUP BY customer.cid
HAVING COUNT(DISTINCT movie.mid) = 2
