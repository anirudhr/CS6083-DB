/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:*/
/*Question: b) Build a view CustView that lists only the cid and cname of each customer, but not the other attributes of that table. Afterwards, try to insert a new tuple into this view. Can you do it? Explain why.*/
USE videostore;
DROP VIEW IF EXISTS CustView;
CREATE VIEW CustView AS
    SELECT customer.cid, customer.cname FROM customer
;/*Insertion can be done because the other attributes (caddress, cphone, balance) are not specified as NOT NULL and have a default value of NULL.*/
