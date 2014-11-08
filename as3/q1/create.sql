/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:
*/
CREATE DATABASE SandwichDelivery;
USE SandwichDelivery;

DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS sandwich;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS orders;

CREATE TABLE customer (   phone char(10) primary key,
                                        building_num int,
                                        street varchar(20),
                                        apartment varchar(20)
                                    );
CREATE TABLE sandwich (   sname varchar(20) primary key,
                                        description varchar (100)
                                    );
CREATE TABLE menu (   sname varchar(20),
                                    size varchar (20),
                                    price decimal(4,2),
                                    primary key (sname, size),
                                    foreign key (sname) references sandwich(sname)
                                );
CREATE TABLE orders (     phone char(10),
                                        sname varchar(20),
                                        size varchar(20),
                                        o_time datetime,
                                        quantity int,
                                        status varchar(10),
                                        primary key (phone, sname, size, o_time),
                                        foreign key (phone) references customer(phone),
                                        foreign key (sname, size) references menu(sname, size)
                                );
