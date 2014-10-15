/*(ii) Output the name of the branch that made the most money from rentals in 2009.*/
USE videoRentalChain;
/*
SELECT branch.bname FROM branch
WHERE bid = (SELECT bid FROM analyst
            GROUP BY bid
            ORDER BY SUM(tot_income) DESC
            LIMIT 1)
*/
SELECT branch.bname FROM branch
INNER JOIN analyst ON branch.bid = analyst.bid
GROUP BY branch.bid
ORDER BY SUM(tot_income) DESC
LIMIT 1