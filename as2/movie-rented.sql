USE videoRentalChain;
SELECT movie.mid, movie.title, copy.copyid, rented.returndate FROM movie
INNER JOIN copy ON copy.mid = movie.mid
INNER JOIN rented ON rented.copyid = copy.copyid
ORDER BY movie.mid, rented.returndate