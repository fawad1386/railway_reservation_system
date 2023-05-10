create database DBS

CREATE TABLE customer(
userid int primary key,
firstname varchar(50),
lastname varchar(50),
gender varchar(50),
phoneno int,
email varchar(50),
city varchar(50),
ustate varchar(50),
cnic int,
);

CREATE TABLE train(
trainno int primary key,
trainname varchar,
arrivaltime time,
departuretime time,
availability_ofseats char,
);

CREATE Table station(
Station_no int primary key,
sname varchar,
arrival_time time,
);

create table fare(
trainno int primary key references train;
fare float,
);

create table ticket(
id int primary key,
userid int foreign key references customer(userid),
status char,
noofpassengers int,
trainno int foreign key references train(trainno),
);

create table passengers(
passengerid int primary key,
age int,
gender char,
userid int foreign key references customer(userid),
reservationstatus char,
seatnumber varchar(5),
name varchar(50),
ticketid int foreign key references ticket(id),
);

create table booking(
userid int foreign key references customer(userid),
id int foreign key references ticket(id),
booking_number int,
);

create table cancel(
userid int foreign key references customer(userid),
id int foreign key references ticket(id),
passengerid int foreign key references passengers(passengerid),

);

insert into customer(userid,firstname,lastname,gender,phoneno,email,city,ustate,cnic)
values (696,'Talal','Bhatty','Male',752,'talalbhatty200@gmail.com','lahore','Punjab',352);

insert into customer(userid,firstname,lastname,gender,phoneno,email,city,ustate,cnic)
values (682,'Huzaifa','Hafeez','Male',755,'huzaifahafeez200@gmail.com','lahore','Punjab',353);

insert into customer(userid,firstname,lastname,gender,phoneno,email,city,ustate,cnic)
values (683,'Fawad','Naeem','Male',735,'fawadnaeem200@gmail.com','lahore','Punjab',313);


select firstname from customer where userid=696;
 

select * from customer;


alter table train
alter column trainname varchar(50);


insert into train(trainno,trainname,arrivaltime,departuretime,availability_ofseats)
values(2,'lahoreexpress','13:23:44','14:23:44','A');

insert into train(trainno,trainname,arrivaltime,departuretime,availability_ofseats)
values(1,'Shujaexpress','14:23:44','14:30:44','A');

insert into passengers(passengerid,age,gender,seatnumber,userid,reservationstatus)
values(1,20,'M',5,696,'A')


select trainno from train where trainname='lahoreexpress';


alter table station
alter column sname varchar(50);


insert into station(Station_no,sname,arrival_time)
values(1,'Canal','13:23:44');

insert into station(Station_no,sname,arrival_time)
values(2,'Gajjumata','14:23:44');

insert into station(Station_no,sname,arrival_time)
values(3,'Shadrah','15:23:44');

insert into station(Station_no,sname,arrival_time)
values(4,'Timber Market','16:23:44');

select arrival_time from station where sname='Canal';

select Station_no,sname from station where arrival_time='15:23:44';


insert into ticket(id,userid,noofpassengers,trainno)
values(619,696,1,1);


select customer.firstname,customer.lastname,customer.email from customer INNER JOIN ticket ON customer.userid=ticket.userid;


insert into fare(trainno,fare)
values (1,30);


select train.trainname from train INNER JOIN fare ON train.trainno=fare.trainno where fare.fare=30;


insert into booking(userid,id,booking_number)
values(696,619,22)


select * from customer INNER JOIN booking ON booking.userid=customer.userid where booking_number=22;


select table_name,table_type from master.INFORMATION_SCHEMA.TABLES
order by TABLE_NAME

select*from INFORMATION_SCHEMA.COLUMNS

select*from INFORMATION_SCHEMA.KEY_COLUMN_USAGE
