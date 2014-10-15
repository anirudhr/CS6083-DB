/*(i) Output the number of rentals of the movie “Terminator 2” in the “Brooklyn Heights” branch in 2009.*/
USE videoRentalChain;
SELECT num_rented FROM analyst
WHERE title = "Terminator2"
AND bname = "Brooklyn Heights"