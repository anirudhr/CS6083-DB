/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:*/
/*Question: f) Write a query that lists all foreign keys in this database*/

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'FOREIGN KEY' AND CONSTRAINT_SCHEMA = 'videostore';
