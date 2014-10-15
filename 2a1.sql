/*(i) Output the number of rentals of the movie “Terminator 2” in the “Brooklyn Heights” branch in 2009.*/
USE videoRentalChain;
SELECT num_rented FROM analyst
INNER JOIN movie ON movie.mid = analyst.mid AND movie.title = "Terminator2"
INNER JOIN branch ON branch.bid = analyst.bid AND branch.bname = "Brooklyn Heights"