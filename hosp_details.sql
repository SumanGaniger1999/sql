create database hospital;
use hospital;
create table hospital_details(
hosp_id int primary key ,
name varchar(20),
build_date date,
doctor varchar(20),
patients_no int(20)
);
desc hospital_details;
insert into hospital_details values(1,'KLE','1999-04-23','Tappu',1),(2,'ABCD','2004-03-12','Suman',20);
select  * from hospital_details;
rename table hospital_details to hospital_info;

alter table hospital_details add patient_name varchar(20);
select * from hospital_info;

alter table hospital_info modify doctor varchar(30);

update hospital_info set  name='Manipal' where hosp_id=2;
update hospital_info set patient_name='Suman' where hosp_id=1;
update hospital_info set patient_name='XYZ' where hosp_id=2;
desc hospital_info;

alter table hospital_info rename  to hosp_details;
select * from hosp_details;
delete from hosp_details where name='KLE';
select * from hosp_details where patients_no=20;
select * from hosp_details where patients_no>10;

commit;

insert into hosp_details value(2,'KL','1999-04-12','Tapp',2,'Suman Ganiger');

update hosp_details set patients_no=10 where hosp_id=1;

update hosp_details set patients_no=10+20 where hosp_id=1;

update hosp_details set patient_name=patient_name||' Ganiger' where hosp_id=1;

select * from hosp_details where patients_no=30 and doctor='Tappu';
 
select * from hosp_details where not doctor='Tappu'; 

insert into hosp_details values(3,'Manipal','1999-04-12','ABCD',3,'XYZ'),(4,'Nayak','1999-04-10','WER',4,'smt');

select distinct * from hosp_details;

insert into hosp_details values(3,'Manipal','1999-04-12','ABCD',3,'XYZ');
select all * from hosp_details;

select * from hosp_details where hosp_id in(1,2);

select * from hosp_details where hosp_id not in(1,2);

select *from hosp_details where patients_no between 2 and 5;

select * from hosp_details where doctor not like '__p%';

select * from hosp_details where doctor  like '__p%';

create table hospital_details(
id int primary key ,
nam varchar(20),
build date,
doctors varchar(20)
);

select * from hospital_details ;

insert into hospital_details values(1,'KLE','1999-04-23','Tappu',1),(2,'ABCD','2004-03-12','Suman',20),(3,'Manipal','1999-04-12','ABCD',3),(4,'Nayak','1999-04-10','WER',4);;