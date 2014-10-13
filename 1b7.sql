/*List the titles of any movies that are currently unavailable because all copies are checked out.*/
USE videoRentalChain;
SELECT movie.title, rented.returndate FROM movie
INNER JOIN copy ON copy.mid = movie.mid
INNER JOIN rented ON rented.copyid = copy.copyid
GROUP BY movie.mid
HAVING rented.returndate IS NULL
