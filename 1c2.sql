/*Write statements for updating the database when a customer returns a movie, that is, for updating the rental record and reducing the credit balance in the customer record. Assume that the cost of the rental is $3 for the first day plus $1 for each additional day. (Choose one of the copies that is currently checked out in the provided database to be returned.)*/
USE videoRentalChain;
SET @checkedoutcopy = 76211;
SET @returner = (SELECT cid from rented where copyid = @checkedoutcopy AND returndate IS NULL);

SET @ddiff = DATEDIFF(CURDATE(), (SELECT outdate FROM rented WHERE copyid = @checkedoutcopy AND returndate IS NULL));
set @cost = (select if(@ddiff >0,3,0));
set @cost = @cost + (select if(@ddiff >1,@ddiff-1,0));

/*Q1: update rented*/
UPDATE rented
SET cost = @cost
WHERE copyid = @checkedoutcopy AND RETURNDATE IS NULL;
UPDATE rented
SET returndate = CURDATE()
WHERE copyid = @checkedoutcopy AND RETURNDATE IS NULL;
/*Q2: update customer*/
UPDATE customer
SET balance = balance - @cost
WHERE cid = @returner;
