USE videoRentalChain;
SELECT cname,title,bname FROM customer
INNER JOIN rented ON rented.cid = customer.cid
INNER JOIN copy ON copy.copyid = rented.copyid
INNER JOIN movie ON movie.mid = copy.mid
INNER JOIN branch ON branch.bid = copy.bid
ORDER BY title
/*GROUP BY movie.title*/
/*HAVING COUNT(movie.title) > 2;*/
