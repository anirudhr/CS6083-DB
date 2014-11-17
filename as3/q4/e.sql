/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:*/
/*Question: e) Write a query that lists the number of tables and the total number of attributes of this database.*/
USE information_schema;
SELECT COUNT(DISTINCT tables.table_name) AS num_tables, COUNT(columns.column_name) AS num_attribs
FROM tables JOIN columns ON tables.table_schema = columns.table_schema AND tables.table_name=columns.table_name
WHERE tables.table_schema = 'videostore';
