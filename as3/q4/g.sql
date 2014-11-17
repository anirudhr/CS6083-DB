/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:*/
/*Question: g) Write a query that lists any tables that contain an attribute with a name that has “name” as a substring.*/

DROP VIEW IF EXISTS CustView;
CREATE VIEW CustView AS
    SELECT customer.cid, customer.cname FROM customer
