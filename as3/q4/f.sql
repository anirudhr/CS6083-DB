/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:*/
/*Question: f) Write a query that lists all foreign keys in this database*/

DROP VIEW IF EXISTS CustView;
CREATE VIEW CustView AS
    SELECT customer.cid, customer.cname FROM customer
