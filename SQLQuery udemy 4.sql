select * from udemy_courses;

SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'udemy_courses';

alter table udemy_courses 
alter column published_timestamp datetime;

--1.knowing the subjects in the dataset
select  subject 
from udemy_courses
group by subject;


--2.knowing how many courses are (free) in every subject in the dataset
select subject,COUNT(course_title)as num_of_courses
from udemy_courses 
where is_paid= 'false'
group by subject;


--3.knowing how many courses are(not free) in every subject in the dataset
select subject,COUNT(course_title)as num_of_courses 
from udemy_courses
where is_paid= 'true'
group by subject;


--4.Find out the most subscribed course
SELECT course_title, MAX(num_subscribers) as max_subscribers
FROM udemy_courses
GROUP BY course_title
ORDER BY max_subscribers DESC;


--5.Find out the course with the least subscription
SELECT course_title, MIN(num_subscribers) as max_subscribers
FROM udemy_courses
GROUP BY course_title
ORDER BY max_subscribers ASC;


--6.Find out the course with biggest number of lectures
SELECT course_title, MAX(num_lectures) as NUM_OF_LECTURES
FROM udemy_courses
GROUP BY course_title
ORDER BY NUM_OF_LECTURES DESC;


--7.find out the Latest course published
SELECT course_title,max(published_timestamp)as date
from udemy_courses
GROUP BY course_title
ORDER BY date DESC;


--8.find out the number of subscribers in each level
SELECT level,sum(num_subscribers) as num_of_subscribers
from udemy_courses
GROUP BY level;


--9.number of subscribers in each subject
SELECT subject,sum(num_subscribers)as num_of_subscribers
from udemy_courses
GROUP BY subject;


--10.number of subscribers in the year
SELECT
    year(published_timestamp)as year ,
    SUM(num_subscribers) AS num_of_subscribers
FROM 
    udemy_courses
GROUP BY year(published_timestamp)
order by year(published_timestamp) asc;