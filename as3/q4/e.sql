/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:*/
/*Question: e) Write a query that lists the number of tables and the total number of attributes of this database.*/
USE information_schema;
SELECT COUNT(*) AS num_tables FROM information_schema.tables
WHERE table_schema = 'videostore';
