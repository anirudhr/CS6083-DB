USE videoRentalChain;
SELECT branch.bid, branch.bname, rented.cost AS total FROM branch
INNER JOIN copy ON copy.bid = branch.bid
INNER JOIN rented ON rented.copyid = copy.copyid
ORDER BY branch.bid