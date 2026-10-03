create database amazon_delivery;
use amazon_delivery;

create table routes (
    route_id varchar(5) primary key,
    route varchar(50),
    service_type varchar(20)
);

insert into routes (route_id, route, service_type) values
('R1', 'Metro Link', 'Express'),
('R2', 'City Dash', 'Express'),
('R3', 'Highway Freight', 'Standard'),
('R4', 'Rural Feeder', 'Standard');

select * from routes;

create table deliveries (
    record_id int primary key,
    month varchar(3),
    route_id varchar(5),
    hub varchar(50),
    promised_days int,
    actual_days int,
	foreign key (route_id) references routes(route_id)
);

insert into deliveries (record_id, month, route_id, hub, promised_days, actual_days) values
(1, 'Jan', 'R1', 'Mumbai', 2, 2),
(2, 'Jan', 'R2', 'Chennai', 3, 4),
(3, 'Jan', 'R3', 'Delhi', 5, 8),
(4, 'Jan', 'R4', 'Mumbai', 6, 10),
(5, 'Feb', 'R1', 'Chennai', 2, 5),
(6, 'Feb', 'R2', 'Delhi', 3, 3),
(7, 'Feb', 'R3', 'Delhi', 5, 10),
(8, 'Feb', 'R4', 'Chennai', 6, 7),
(9, 'Mar', 'R1', 'Delhi', 2, 8),
(10, 'Mar', 'R2', 'Mumbai', 3, 5),
(11, 'Mar', 'R3', 'Chennai', 5, 5),
(12, 'Mar', 'R4', 'Mumbai', 6, 15);

select * from deliveries;

