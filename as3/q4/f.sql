/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:*/
/*Question: f) Write a query that lists all foreign keys in this database*/

/*SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'FOREIGN KEY' AND CONSTRAINT_SCHEMA = 'videostore';*/
SELECT table_name, column_name, referenced_table_name, referenced_column_name FROM information_schema.key_column_usage
WHERE referenced_table_name IS NOT NULL AND constraint_schema = 'videostore';

