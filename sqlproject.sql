REM   Script: Project_Script
REM   Project Script

create table company_domains( 
domain_id int not null primary key, 
domain varchar(50), 
server varchar(18), 
region varchar(12) 
);

create table traffic_report( 
traffic_id int not null primary key references company_domains (domain_id), 
Date_Of_Purchase date, 
Requests_In_Last24hrs int, 
Crashes_In_Last24hrs int, 
server varchar(18) 
);

insert into company_domains values (1, 'https://jwill1.test', '4.4.4.4', 'Asia');

insert into traffic_report values (1, date'2022-01-04', 344, 2, '1.2.3.4');

insert into company_domains values (2, 'https://jwill2.test', '2.1.5.4', 'Europe');

insert into traffic_report values (2, date'2022-01-14', 587, 0, '9.1.5.5');

select * from company_domains, traffic_report;

select * from traffic_report;

INSERT INTO company_domains 
    WITH domain AS ( 
        SELECT 3, 'https://jwill3.test', '0.4.5.7', 'USA'    FROM dual UNION ALL 
        SELECT 4, 'https://jwill4.test', '4.3.5.2', 'Middle East'   FROM dual UNION ALL 
        SELECT 5, 'https://jwill5.test', '2.8.2.5', 'Asia'  FROM dual 
    ) 
    SELECT * FROM domain;

INSERT INTO traffic_report 
    WITH report AS ( 
        SELECT 3, date'2022-02-09', 777, 1, '1.4.6.7'    FROM dual UNION ALL 
        SELECT 4, date'2022-02-13', 1453, 6, '4.3.4.2'  FROM dual UNION ALL 
        SELECT 5, date'2022-02-27', 478, 14, '1.1.2.5'  FROM dual 
    ) 
    SELECT * FROM report;

select * from traffic_report;

alter table company_domains add company_cost varchar (11);

update company_domains set company_cost = '$200/mth' where domain_id = 1;

select * from company_domains;

update company_domains set company_cost = '$275/mth' where domain_id = 2;

update company_domains set company_cost = '$100/mth' where domain_id = 3;

update company_domains set company_cost = '$335/mth' where domain_id = 4;

update company_domains set company_cost = '$125/mth' where domain_id = 5;

select * from company_domains;

commit
