/*List the name of the branch that has made the most money renting out movies in 2009.*/
USE videoRentalChain;
SELECT branch.bid, branch.bname, SUM(rented.cost) AS total FROM branch
INNER JOIN copy ON copy.bid = branch.bid
INNER JOIN rented ON rented.copyid = copy.copyid
GROUP BY branch.bid
ORDER BY total DESC
LIMIT 1
