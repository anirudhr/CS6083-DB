/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:*/
/*Question: e) Write a query that lists the number of tables and the total number of attributes of this database.*/

DROP VIEW IF EXISTS CustView;
CREATE VIEW CustView AS
    SELECT customer.cid, customer.cname FROM customer
