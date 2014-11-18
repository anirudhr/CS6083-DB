/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:*/
/*Question: d) Update the database as follows: in each branch and for each movie, if the copies of this movie were rented out more than 90% of the time on average in this branch, add one additional copy of this movie to the database for this branch.
There are two ways to interpret "rented out 90% of the time":
-- that 90% of the time, all copies were rented out (so that if someone came into the branch they would not find the copy), or
-- that the copies were on average rented out 90% of the time (so that for 10 copies, and 30 days, the copies were rented out at least 290 of the 300 available rental days).
You may choose either of these two interpretations. Please state which one.
You may assume that all copies in the database already existed 30 days ago. This is because the database does not keep track of then a copy was added to the branch.*/
USE videostore;
/*Query to select movies and the number of days they were rented for:*/
SELECT movie.mid, SUM(DATEDIFF(rental.returndate, rental.outdate)) AS days_out, COUNT(movie.mid) AS num_copies, DATEDIFF(NOW(), MIN(rental.outdate)) AS days_tot
FROM movie
    JOIN copy ON movie.mid = copy.mid
    JOIN rental ON rental.copyid = copy.copyid
WHERE rental.returndate IS NOT NULL
GROUP BY movie.mid;
