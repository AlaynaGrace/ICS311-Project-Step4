use humanesociety;
-- main tables
create table staff(
    staff_id integer primary key,
    name varchar(120),
    address varchar(200),
    salary float,
    title varchar(20)
);
create table pets(
    pet_id integer primary key,
    name varchar(25),
    gender varchar(6),
    type varchar(20),
    price float,
    arrival_date date,
    adoption_date date
);
create table veterinarians(
    vet_id integer primary key,
    name varchar(120),
    clinic_name varchar(120),
    clinic_address varchar(200)
);
create table customers(
    customer_id integer primary key,
    name varchar(120),
    address varchar(200),
    phone_number varchar(15)
);
create table items(
    item_id integer primary key,
    item_name varchar(120),
    quantity integer,
    price float
);

-- Referenced tables (tables w/ foreign keys)
create table hours(
    hours_id integer primary key,
    date date,
    hours_works float,
    staff_id integer,
    foreign key (staff_id) references staff(staff_id)
);
create table pet_care(
    pet_care_id integer primary key,
    action varchar(120),
    date date,
    staff_id integer,
    pet_id integer,
    foreign key (staff_id) references staff(staff_id),
    foreign key (pet_id) references pets(pet_id)
);
create table vet_visits(
    visit_id integer primary key,
    date date,
    vet_id integer,
    pet_id integer,
    foreign key (vet_id) references veterinarians(vet_id),
    foreign key (pet_id) references pets(pet_id)
);
create table adoptions(
    adoption_id integer primary key,
    pet_id integer,
    customer_id integer,
    foreign key (customer_id) references customers(customer_id),
    foreign key (pet_id) references pets(pet_id)
);
create table item_sales(
    sale_id integer primary key,
    item_id integer,
    customer_id integer,
    date date,
    foreign key (customer_id) references customers(customer_id),
    foreign key (item_id) references items(item_id)
);

-- insert data
-- staff
insert into staff values(1,"Sally Johnson","1234 Main Street, Minneapolis, MN",50000.00,"Full Time Employee");
insert into staff values(2,"Josh Smith", "54 S Apple Drive, Bloomington, MN", 0.0,"Volunteer");
insert into staff values(3,"Jenny Anderson", "1212 View Drive, Burnsville, MN", 0.0, "Volunteer");
insert into staff values(4,"Alexa Nelson", "1111 4th Street, Minneapolis, MN", 40000.00,"Full Time Employee");
insert into staff values(5,"Aaron Russell", "5420 Sky Bird Lane, Saint Paul, MN", 70000.00, "Manager");
insert into staff values(6,"Melissa Zack", "201 Oak Street, Apple Valley, MN", 0.0, "Volunteer");
insert into staff values(7,"Kayla Saint-Martin", "8081 3rd Street N, Mounds View, MN", 0.0, "Volunteer");
insert into staff values(8,"Taylor Smith", "2004 Elk Drive, Savage, MN", 40000.00,"Full Time Employee");
insert into staff values(9,"Chelsea Anne", "901 8th Street, Brooklyn Park, MN", 0.0, "Volunteer");
insert into staff values(10,"Brad Freeman", "4351 Poppy Lane, Minneapolis, MN", 0.0, "Volunteer");

-- pets
insert into pets values(1001,"Princess","Female","Cat",150.00,'2019-10-17',NULL);
insert into pets values(1002,"Jake","Male","Dog",300.00,'2019-11-11','2019-11-12');
insert into pets values(1003,"Fuzzy","Male","Rabbit",100.00,'2019-09-27',NULL);
insert into pets values(1004,"Bella","Female","Dog",500.00,'2019-06-14','2019-06-21');
insert into pets values(1005,"Jack","Male","Dog",200.00,'2019-05-15','2019-06-07');
insert into pets values(1006,"Mickey","Male","Cat",150.00,'2019-07-10',NULL);
insert into pets values(1007,"Buddy","Male","Dog",150.00,'2019-10-01','2019-10-07');
insert into pets values(1008,"Riley","Male","Dog",200.00,'2019-11-01','2019-11-02');
insert into pets values(1009,"Cleo","Female","Cat",125.00,'2019-11-11',NULL);
insert into pets values(1010,"Luna","Female","Rabbit",100.00,'2019-02-02','2019-03-01');
insert into pets values(1011,"Lola","Female","Rabbit",100.00,'2019-04-12','2019-05-01');
insert into pets values(1012,"Tao","Male","Cat",700.00,'2019-06-20','2019-06-21');
insert into pets values(1013,"Jasmine","Female","Dog",350.00,'2019-10-28',NULL);
insert into pets values(1014,"Oscar","Male","Bird",250.00,'2019-11-01','2019-11-07');
insert into pets values(1015,"Lady","Female","Bird",200.00,'2019-11-01','2019-11-07');

-- vets
insert into veterinarians values(10,"Jenna Kennedy", "South Minneapolis Pet Care","54 S 4th Street, Minneapolis, MN");
insert into veterinarians values(20, "Mark Vann", "Emergency Animal Care","700 Oak Street, Brooklyn Park, MN");
insert into veterinarians values(30, "Susie LaBeau", "Family Pet Care and Services","9001 Main Street, Saint Paul, MN");
insert into veterinarians values(40, "Aaron Nelson", "Bloomington Pet Clinic", "2342 S Diamond Drive, Bloomington, MN");
insert into veterinarians values(50, "Melisa Zahiro", "Burnsville Emergency Pet Clinic", "2112 N Burnsville Parkway, Burnsville, MN");
insert into veterinarians values(60, "Rob Smith", "Family Pet Care and Services","9001 Main Street, Saint Paul, MN");
insert into veterinarians values(70, "Andy Anderson", "Burnsville Emergency Pet Clinic", "2112 N Burnsville Parkway, Burnsville, MN");
insert into veterinarians values(80, "Megan Davis", "South Minneapolis Pet Care","54 S 4th Street, Minneapolis, MN");
insert into veterinarians values(90, "Maddie Taylor", "Emergency Animal Care","700 Oak Street, Brooklyn Park, MN");
insert into veterinarians values(100, "Paul Moore", "South Minneapolis Pet Care","54 S 4th Street, Minneapolis, MN");

-- customers
insert into customers values(2001, "Mary Smith","4432 4th Street SE, Minneapolis, MN", "612-435-8937");
insert into customers values(2002, "John Anderson","634 Birch Road N, Brooklyn Park, MN", "952-473-3950");
insert into customers values(2003, "Tom Taylor", "78 Idaho Lane, Maple Grove, MN", "651-937-8323");
insert into customers values(2004, "Sally Davidson", "9001 Oak Circle, Burnsville, MN", "952-382-9421");
insert into customers values(2005, "Mike Moore", "831 Wild Flower Drive, Saint Paul, MN", "612-038-6392");
insert into customers values(2006, "Oscar Zack", "1122 Vista Lane S, Lakeville, MN", "612-092-3829");
insert into customers values(2007, "Jake Johnson", "2009 Main Street, Minneapolis, MN", "612-092-3467");
insert into customers values(2008, "Aaron Kennedy", "899 Poppy Lane, Minnetonka, MN", "952-849-3800");
insert into customers values(2009, "Paul Nelson", "530 Ice Winter Road, Duluth, MN", "612-947-9237");
insert into customers values(2010, "Melissa Smith", "23 N Daisy Circle, Plymouth, MN", "651-211-0071");

-- items
insert into items values(80,"Dog Collar",10,15.00);
insert into items values(81,"Dog Leash",25,10.00);
insert into items values(82,"Cat Food",25,30.00);
insert into items values(83,"Dog Food",20,45.00);
insert into items values(84,"Bird Food",5,15.00);
insert into items values(85,"Rabbit Food",8,10.00);
insert into items values(86,"Large Kennel",2,50.00);
insert into items values(87,"Medium Kennel",4,35.00);
insert into items values(88,"Small Kennel",10,20.00);
insert into items values(89,"Food and Water Bowl Set",5,35.00);

-- hours
insert into hours values(1,'2019-11-01',8.5,1);
insert into hours values(2,'2019-11-01',7.5,2);
insert into hours values(3,'2019-11-02',8,3);
insert into hours values(4,'2019-11-02',8,4);
insert into hours values(5,'2019-11-03',10,1);
insert into hours values(6,'2019-11-03',6,5);
insert into hours values(7,'2019-11-04',7,7);
insert into hours values(8,'2019-11-04',9.5,6);
insert into hours values(9,'2019-11-05',5,5);
insert into hours values(10,'2019-11-05',11,9);


-- pet_care
insert into pet_care values(1,"Fed dinner",'2019-11-01',1,1003);
insert into pet_care values(2,"Took for walk",'2019-11-11',2,1002);
insert into pet_care values(3,"Cleaned kennel", '2019-06-14', 6, 1004);
insert into pet_care values(4, "Took for walk", '2019-11-01', 7,1008);
insert into pet_care values(5, "Fed breakfast", '2019-09-10', 3, 1006);
insert into pet_care values(6, "Fed dinner", '2019-04-15', 6, 1011);
insert into pet_care values(7, "Took for walk", '2019-05-28', 3, 1005);
insert into pet_care values(8, "Gave water", '2019-11-11', 9, 1009);
insert into pet_care values(9, "Taught basic commands", '2019-10-04', 2, 1007);
insert into pet_care values(10, "Cleaned cage", '2019-11-03', 10, 1015);

-- vet_visits
insert into vet_visits values(1,'2019-11-01', 10, 1003);
insert into vet_visits values(2,'2019-11-03', 70, 1015);
insert into vet_visits values(3,'2019-05-29', 30, 1005);
insert into vet_visits values(4, '2019-11-02', 90, 1015);
insert into vet_visits values(5, '2019-10-05', 20, 1007);
insert into vet_visits values(6, '2019-10-06', 20, 1007);
insert into vet_visits values(7, '2019-09-10', 40, 1006);
insert into vet_visits values(8, '2019-06-17', 60, 1004);
insert into vet_visits values(9, '2019-06-18', 60, 1004);
insert into vet_visits values(10, '2019-06-19', 60, 1004);


-- adoptions
insert into adoptions values(1, 1002, 2001);
insert into adoptions values(2, 1004, 2001);
insert into adoptions values(3, 1005, 2003);
insert into adoptions values(4, 1007, 2009);
insert into adoptions values(5, 1008, 2007);
insert into adoptions values(6, 1010, 2008);
insert into adoptions values(7, 1011, 2005);
insert into adoptions values(8, 1012, 2004);
insert into adoptions values(9, 1014, 2002);
insert into adoptions values(10, 1015, 2002);

-- item_sales item_id,customer_id integer,date
insert into item_sales values(1,80,2001,'2019-04-03');
insert into item_sales values(2,82,2010,'2019-05-01');
insert into item_sales values(3,81,2007,'2019-06-28');
insert into item_sales values(4,89,2007,'2019-10-12');
insert into item_sales values(5,80,2004,'2019-10-23');
insert into item_sales values(6,83,2003,'2019-11-01');
insert into item_sales values(7,80,2008,'2019-11-02');
insert into item_sales values(8,84,2002,'2019-11-02');
insert into item_sales values(9,86,2005,'2019-11-03');
insert into item_sales values(10,87,2006,'2019-11-04');