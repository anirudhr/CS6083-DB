/*Define a view called “analyst” that contains, for each movie and branch, the total number of movies rented and the total income due to rentals during 2009. Write queries using this view for the following tasks:
(i) Output the number of rentals of the movie “Terminator 2” in the “Brooklyn Heights” branch in 2009.
(ii) Output the name of the branch that made the most money from rentals in 2009.*/
USE videoRentalChain;
DROP VIEW analyst;
CREATE VIEW analyst AS 
    SELECT movie.mid, branch.bid, COUNT(rented.copyid) AS num_rented, SUM(rented.cost) AS tot_income FROM movie
    INNER JOIN copy ON movie.mid = copy.mid
    INNER JOIN branch ON copy.bid = branch.bid
    INNER JOIN rented ON copy.copyid = rented.copyid AND YEAR(rented.outdate) = '2009'
    /*WHERE YEAR(rented.outdate) = '2009'*/
    GROUP BY branch.bid
;