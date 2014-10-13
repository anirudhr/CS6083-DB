USE videoRentalChain;
SELECT balance, cid FROM customer
WHERE cid IN (
                SELECT cid FROM rented
                WHERE outdate >= (SELECT DATE_SUB(curdate(), INTERVAL 2 WEEK))
                GROUP BY cid
                HAVING COUNT(cid) >= 5
            )