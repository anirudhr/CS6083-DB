/*List the title of any movie that has been rented more than 5 times total (counted across all branches), together with the number of times it has been rented.*/
USE videoRentalChain;
SELECT title,count(rented.copyid) FROM movie
INNER JOIN copy ON copy.mid = movie.mid
INNER JOIN branch ON branch.bid = copy.bid
INNER JOIN rented ON rented.copyid = copy.copyid
GROUP BY movie.mid
HAVING COUNT(rented.copyid) > 5
