/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:*/
/*Question: d) Update the database as follows: in each branch and for each movie, if the copies of this movie were rented out more than 90% of the time on average in this branch, add one additional copy of this movie to the database for this branch.*/

DROP VIEW IF EXISTS CustView;
CREATE VIEW CustView AS
    SELECT customer.cid, customer.cname FROM customer
