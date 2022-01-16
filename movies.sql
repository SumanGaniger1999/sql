select variable, set_time from sys.sys_config;
create database  movie;

use movie;
create table movies_details(
movie_id int primary key,
Name varchar(20),
Lang varchar(20),
director varchar(10),
platform varchar(20),
budget  int,
collections int,
ratings float check(ratings>0 and ratings<10)
);

select * from movies_details;

insert  into movies_details(movie_id,name,lang,director,platform,budget,collections,ratings)value(1,'ASN','Kannada','Sachin','Theater',2200000,5600000,8.8);
insert into movies_details(movie_id,name,lang,director,platform,budget,collections,ratings)value(2,'KGF','Kannada','Prashanth','Theaters',80000000,20000000,9.0),
(3,'Yuvarathna','Kannada','Santhosh','Theaters',3000000,3000000,8.2),
(4,'Dia','Kannada','Ashok','Theater',3000000,500000,8.2),
(5,'Jackie','Kannada','Duniya','Theaters',6000000,7000000,8.2),
(6,'Roberrt','Kannada','Tappu','Theaters',1000000,2000000,8.0),
(7,'Ulidavaru Kandanthe','Kannada','Rakshith','Theaters',100000,20000,8.9),
(8,'Rajakumar','Kannada','Santosh','Theaters',6000000,2000000,8.2),
(9,'Ratna','Kannada','Rohith','Amazon Prime',3000000,2000000,8.9),
(10,'love mocktail','Kannada','Krishna','Theaters',3000000,200000,8.3),
(11,'Kuruksetra','Kannada','Naganna','Theaters',3000000,2000000,6.7); 

select * from movies_details where ratings>=8 and platform='Amazon Prime';

select * from movies_details where platform ='Theaters' or platform='Amazon Prime';

select * from movies_details where collections =200000;

select * from movies_details where lang='Kannada';

select * from movies_details where director='Sachine' or director='Santosh' or director='Prashanth';

select * from movies_details where director IN('Rohith','Tappu','Santosh');

select * from movies_details where budget>20000 and budget<=400000;

select name from movies_details;

select director from movies_details;

select distinct director from movies_details;

update  movies_details set director='Santosh' where name='Yuvarathna';

select distinct director,platform from movies_details;

select*from movies_details order by budget;

select * from movies_details order by ratings desc;

insert  into movies_details value(12,'ABCD','Hindi','','Theater',2200000,5600000,8.8);

update  movies_details set director=null where movie_id=12;

select * from movies_details where director is null;

alter table movies_details modify column platform varchar(20) not null;

desc movies_details;

-- Alter table movies_details add primary key(Id);

delete from movies_details where name='ABCD';

select * from movies_details;

delete from movies_details where name='Jackie' and director='Duniya';

select * from movies_details limit 5;

select * from movies_details order by movie_id desc limit 5;

select * from movies_details;

select* from movies_details where name like'%mocktail';

select * from movies_details where name like 'Ulida%';

select * from movies_details where name like '%rathna%';

select * from movies_details where director like '%Santosh';

select * from movies_details where name like '_a%';

select * from movies_details where name like 'r_b%';

select * from movies_details where name like '_u_u%';

select * from movies_details where name like 'R_j%';

select * from movies_details where name like '_a%';

select name as movie_name from movies_details;

select collections as total_movie_collections from movies_details;

select movies_details.name ,movies_details.director from movies_details;

select M.name,M.director from movies_details M;

select max(collections) as highest_collection from movies_details;

select min(budget) as lowest_budget from movies_details;

select avg(collections) as Average_collection from movies_details;

select sum(collections) as Sum_Collections from movies_details;

select count(budget) as Count_Budget   from movies_details;

select count(*) as Count_Budget   from movies_details;

select count(distinct director) as no_of_movies_by_unique_directors from movies_details;

select curdate();

select curdate() as Present_Date;

select current_time() as Present_Time; 

select now() as Present_DateTime;

Insert into movies_details value(now());

alter table movies_details ADD column released_date_time DATETIME ;

desc movies_details;

insert into movies_details value (12,'Badava Rascal','Kannada','Tappu','Theaters','200000','300000',8.3,'2021-12-19 13:05:05');
insert into movies_details value (13,'SpiderMan','English','Tappu','Theaters','200000','300000',6.0,'2021-12-18 13:03:03');

select  name,date(released_date_time) from movies_details where movie_id=12;
select * from movies_details;

select  name,time(released_date_time) from movies_details where movie_id=12;

select  name,monthname(released_date_time) from movies_details where movie_id=12;

select name,year(released_date_time) from movies_details where movie_id=12;

select name,day(released_date_time) from movies_details where movie_id=12;

select name,hour(released_date_time) from movies_details where movie_id=12;

select name,min(released_date_time) from movies_details where movie_id=12;

select name,second(released_date_time) from movies_details where movie_id=12;
-- no of movies in each year
select count(name)as no_of_movies_ratings, ratings from movies_details 
Group by ratings;
-- no of movies done by each director
select count(name) as no_of_movies_by_director,director from movies_details Group By director;

-- no of movies available in each platform
select count(name) as no_of_movies_By_Platform,platform from movies_details Group By platform;

-- No of movies done in each month
select count(name) as no_of_movies_By_Month,monthname(released_date_time)As released_month from movies_details group by released_month;

-- No of movies done in each lang
Select count(name)as no_of_movies_By_Lang, lang from movies_details group by lang;

-- No of movies by ratings and director
Select count(name)as no_of_movies_by_year_and_director,ratings,director from movies_details group by ratings,director;

-- Highest Collections done in each year and name
Select max(collections)as Highest_Collection_By_Ratings ,ratings from movies_details group by ratings order by Highest_Collection_By_Ratings DESC;

-- Highest ratings in each platform order by rating desc 
Select max(ratings) as Highest_Rating_By_Platform,platform from movies_details group by platform order by highest_rating_By_Platform Desc;
 
 -- Lowest collectons done in each year
 Select min(ratings) as Lowest_Rating_By_Rating,ratings from movies_details group by  ratings order by lowest_rating_By_Rating ;
 
 -- Lowest budget by each director 
 Select min(budget)as Lowest_Budget_By_Director,director from movies_details group by director order by Lowest_Budget_By_Director;
 
 -- Total Collections done in each platform 
 Select sum(collections)as Total_Collections_By_Platform,platform from movies_details group by platform order by Total_Collections_By_Platform;
 
 -- Average collections by each rating 
 Select avg(collections) as Average_Collection_By_Rating,ratings from movies_details group by ratings order by Average_Collection_By_Rating;
 
 -- Average collection by selected director
 Select avg(collections) as Average_Collection_By_Director,director from movies_details where director IN('Tappu','Santosh') group by director;
 
 -- Average collection by each director having collections greater than 50
 Select avg(collections) as Average_Collection_By_Director,director from movies_details group by director having Average_Collection_By_Director >1000000;
 
 -- Total collections by each directors having total lesser than 100cr
 Select sum(collections) as total_collection_by_director,director from movies_details group by director having  total_collection_by_director<3000000;
 
 -- 
 Select max(collections) as second_highest from movies_details where collections < (select max(collections) from movies_details);
 
 Select * from movies_details where collections=(Select max(collections) from movies_details);
 
 select max(collections)  from movies_details where collections < (select max(collections) from movies_details where lang=Kannada )and lang=Kannada;
 
 -- second highest collection of the movie in kannada lang
SELECT * FROM movies_details WHERE lang='Kannada';
SELECT MAX(collections)AS Second_Highest_Collection_In_Kannada  FROM movies_details WHERE collections<(SELECT MAX(collections)FROM movies_details  WHERE lang='Kannada')AND lang='Kannada';

-- Get the details of the movie which has the second highest collection in kannnada lang
SELECT* FROM movies_details WHERE collections=(SELECT MAX(collections)AS Second_Highest_Collection_In_Kannada  FROM movies_details WHERE collections<(SELECT MAX(collections)FROM movies_details  WHERE lang='Kannada'));

-- get the movie details which has lowest collection 
SELECT * FROM movies_details WHERE collections=(SELECT MIN(collections)FROM movies_details);

-- get the details of the movies which has both highest and lowest
SELECT * FROM movies_details WHERE collections IN ((SELECT MAX(collections)FROM movies_details),(SELECT MIN(collections)FROM movies_details)) ;

-- get the movies details which has the highest collection done by each director
SELECT MAX(collections),director FROM movies_details GROUP BY director;
SELECT * FROM movies_details WHERE collections IN (SELECT MAX(collections) FROM movies_details GROUP BY director);

-- get the movies details which has the highest collection done by each director having greater than 10000
SELECT * FROM movies_details WHERE collections IN (SELECT MAX(collections) FROM movies_details GROUP BY director HAVING MAX(collections)>50000);


create table movies_duplicate(
movie_id int primary key,
Name varchar(20),
Lang varchar(20),
director varchar(10),
platform varchar(20),
budget  int,
collections int,
ratings float check(ratings>0 and ratings<10)
);
ALTER TABLE movies_duplicate ADD COLUMN released_data_time DATETIME;


SELECT * FROM movies_duplicate;

INSERT INTO movies_duplicate SELECT * FROM movies_details WHERE movie_id  IN (SELECT movie_id FROM movies_details);

-- update the rating as 9 for movies the highest collection done by each director
UPDATE movies_details SET ratings=9 WHERE collections IN(SELECT MAX(collections) FROM movies_duplicate GROUP BY director);

DELETE FROM movies_details WHERE movie_id IN(select movie_id FROM movies_duplicate WHERE movie_id>11);
delete from  movies_details_duplicate;

SET autocommit=0;

insert into movies_details(movie_id,name,lang,platform,released_date_time)value (14,'BadavavRascal','Kannada','Theaters','2021-12-24 11:05:05');

commit;

select* from movies_details;

Delete from movies_details where movie_id=14;

rollback;

commit;

UPDATE movies_details set ratings=9 where movie_id=3;

rollback;

commit;


