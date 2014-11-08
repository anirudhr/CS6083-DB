/*List the customer IDs and balances of all customers who have rented the same movie from 2 different branches.*/
USE videoRentalChain;
SELECT cname,balance FROM customer
INNER JOIN rented ON rented.cid = customer.cid
INNER JOIN copy ON copy.copyid = rented.copyid
INNER JOIN movie ON movie.mid = copy.mid
INNER JOIN branch ON branch.bid = copy.bid
/*ORDER BY cname,title*/
GROUP BY customer.cid,movie.mid
HAVING COUNT(DISTINCT branch.bid) = 2
