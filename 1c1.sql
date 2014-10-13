/*Give $5 of extra credit to any customer who has rented at least 5 movies in the last two weeks.*/
USE videoRentalChain;
UPDATE customer
SET balance = balance + 5
WHERE cid IN (
                SELECT cid FROM rented
                WHERE outdate >= (SELECT DATE_SUB(curdate(), INTERVAL 2 WEEK))
                GROUP BY cid
                HAVING COUNT(cid) >= 5
            )
/*UPDATE customer
INNER JOIN rented ON customer.cid = rented.cid
SET balance = balance + 5
WHERE outdate >= (SELECT DATE_SUB(curdate(), INTERVAL 2 WEEK))
GROUP BY customer.cid
HAVING COUNT(customer.cid) >= 5*/