/*List all customer who have rented “Terminator 1” and “Terminator 2” but not “Terminator 3”.*/
USE videoRentalChain;
SELECT customer.cid,cname,title FROM customer
INNER JOIN rented ON rented.cid = customer.cid
INNER JOIN copy ON copy.copyid = rented.copyid
INNER JOIN movie ON movie.mid = copy.mid
ORDER BY cname,movie.title;
/*GROUP BY movie.title*/
/*HAVING COUNT(movie.title) > 2;*/
