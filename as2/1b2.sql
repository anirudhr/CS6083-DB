/*- List the names of all customers who have rented the same movie more than 2 times.*/
USE videoRentalChain;
SELECT customer.cid,cname FROM customer
INNER JOIN rented ON rented.cid = customer.cid
INNER JOIN copy ON copy.copyid = rented.copyid
INNER JOIN movie ON movie.mid = copy.mid
GROUP BY customer.cid,movie.title
HAVING COUNT(movie.mid)>2
