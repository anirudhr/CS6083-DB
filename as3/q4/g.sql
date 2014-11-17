/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:*/
/*Question: g) Write a query that lists any tables that contain an attribute with a name that has "name" as a substring.*/
USE information_schema;
SELECT tables.table_name FROM tables JOIN columns ON tables.table_schema = columns.table_schema AND tables.table_name=columns.table_name
WHERE tables.table_schema = 'videostore' AND columns.column_name LIKE '%name%';
