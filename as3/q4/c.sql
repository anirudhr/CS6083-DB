/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:*/
/*Question: c) Add a new table OldAddresses that stores the old address of a customer when the customer does an address change. Then implement a trigger that adds the cid and old address to this table whenever the address attribute in the Customer table is updated. (Check: does the table contain an address?)^@)*/
USE videostore;
DROP TABLE IF EXISTS OldAddresses;
CREATE TABLE OldAddresses (cid int(10), oldaddress varchar(40), foreign key (cid) references customer(cid));
DROP TRIGGER IF EXISTS update_caddress;
DELIMITER //
CREATE TRIGGER update_caddress BEFORE UPDATE ON customer
    FOR EACH ROW
    BEGIN
        IF NEW.caddress IS NOT NULL AND OLD.caddress IS NOT NULL THEN
            INSERT INTO OldAddresses VALUES (OLD.cid, OLD.caddress);
        END IF; 
    END;//  
DELIMITER ;
