/*List the title of any movie that has been rented at least once in every branch.*/
USE videoRentalChain;
SELECT DISTINCT title,branch.bid,bname FROM movie
INNER JOIN copy ON copy.mid = movie.mid
INNER JOIN branch ON branch.bid = copy.bid
INNER JOIN rented ON rented.copyid = copy.copyid
ORDER BY title,bname
