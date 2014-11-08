USE videoRentalChain;

DROP TABLE rented;
DROP TABLE copy;
DROP TABLE customer;
DROP TABLE movie;
DROP TABLE branch;

CREATE TABLE customer (
   cid int(10),
   cname varchar(40),
   caddress  varchar(40),
   cphone  varchar(10),
   balance int(4),
   primary key (cid));


CREATE TABLE movie (
   mid    int(10),
   title  varchar(40),
   genre  varchar(20),
   year   int(4),
   primary key (mid));


CREATE TABLE branch (
   bid    int(10),
   bname  varchar(40),
   baddress  varchar(40),
   primary key (bid));


CREATE TABLE copy (
  copyid int(10),
  mid int(10),
  bid int(10),
  primary key (copyid),
  foreign key (mid) references movie(mid),
  foreign key (bid) references branch(bid));


CREATE TABLE rented (
  cid    int(10),
  copyid  int(10),
  outdate date,/*outdate       int(8),*/
  returndate date,/*returndate    int(8),*/
  cost       int(4),
  primary key (cid,copyid,outdate),
  foreign key (cid) references customer(cid),
  foreign key (copyid) references copy(copyid));


INSERT INTO customer VALUES (15674, 'John Smith', '67 Jay Street',7183457689,10);
INSERT INTO customer VALUES (45624, 'Bob Jones', '7 Park Place',7188764444,20);
INSERT INTO customer VALUES (87654, 'Karen Lam', '123 Jay Street',3475554846,5);
INSERT INTO customer VALUES (66666, 'Jake Weber', '235 4th Ave',7189876543,14);
INSERT INTO customer VALUES (12345, 'Mary Lopez', '235 Fulton Ave',7189876543,4);

INSERT INTO movie VALUES (64, 'Terminator1', 'Action', 1984);
INSERT INTO movie VALUES (53, 'Terminator2', 'Action', 1991);
INSERT INTO movie VALUES (95, 'Waterworld', 'Bad Movie', 1995);
INSERT INTO movie VALUES (96, 'Scary Movie', 'Comedy', 2000);
INSERT INTO movie VALUES (19, 'Infernal Affairs', 'Foreign', 2002);
INSERT INTO movie VALUES (72, 'Terminator3', 'Action', 1998);

INSERT INTO branch VALUES (674, 'Downtown', '67 Montague Street');
INSERT INTO branch VALUES (451, 'Park Slope', '141 5th Avenue');
INSERT INTO branch VALUES (349, 'Bay Ridge', '1 Carlitos Way');
INSERT INTO branch VALUES (127, 'Sunset Park', '23 Main Street');
INSERT INTO branch VALUES (159, 'Brooklyn Heights', '10 metrotech Jay Street');


INSERT INTO copy VALUES (76543, 64, 674);
INSERT INTO copy VALUES (54589, 64, 674);
INSERT INTO copy VALUES (16537, 53, 159);
INSERT INTO copy VALUES (76235, 96, 674);
INSERT INTO copy VALUES (87125, 95, 451);
INSERT INTO copy VALUES (17965, 19, 451);
INSERT INTO copy VALUES (18745, 19, 451);
INSERT INTO copy VALUES (87135, 64, 451);
INSERT INTO copy VALUES (76211, 64, 451);
INSERT INTO copy VALUES (94712, 95, 349);
INSERT INTO copy VALUES (74583, 53, 349);
INSERT INTO copy VALUES (81723, 64, 127);
INSERT INTO copy VALUES (84923, 64, 127);
INSERT INTO copy VALUES (90321, 72, 127);
INSERT INTO copy VALUES (90324, 72, 451);

INSERT INTO rented VALUES (15674, 76543, 20141006, NULL,3);
INSERT INTO rented VALUES (45624, 54589, 20091010, 20091011,6);
INSERT INTO rented VALUES (45624, 16537, 20091014, 20091017,3);
INSERT INTO rented VALUES (45624, 81723, 20061009, 20061010,8);
INSERT INTO rented VALUES (15674, 76235, 20141003, NULL,3);
INSERT INTO rented VALUES (87654, 81723, 20141004, NULL,4);
INSERT INTO rented VALUES (87654, 94712, 20060812, 20060823,6);
INSERT INTO rented VALUES (87654, 87135, 20060830, 20060903,3);
INSERT INTO rented VALUES (66666, 76211, 20141007, NULL,9);
INSERT INTO rented VALUES (66666, 94712, 20061012, 20061016,12);
INSERT INTO rented VALUES (12345, 76543, 20090812, 20090815,15);
INSERT INTO rented VALUES (87654, 76211, 20090517, 20090524,6);
INSERT INTO rented VALUES (45624, 16537, 20091009, 20091011,4);
INSERT INTO rented VALUES (66666, 81723, 20100107, 20100111,6);
INSERT INTO rented VALUES (15674, 90321, 20101009, 20101015,10);
INSERT INTO rented VALUES (15674, 84923, 20091009, 20091015,10);
INSERT INTO rented VALUES (66666, 16537, 20101009, 20101017,14);
