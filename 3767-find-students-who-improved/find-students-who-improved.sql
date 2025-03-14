# Write your MySQL query statement below
with a as(select student_id, subject, count(score) as cnt, min(exam_date) as mn, max(exam_date) as mx
from scores
group by student_id, subject)
, mn_score as (
select student_id, subject, score min_score, exam_date min_date
from scores
where (student_id, subject, exam_date) IN (select student_id, subject, mn from a) )
, mx_score as(
select student_id, subject, score max_score, exam_date max_date
from scores
where (student_id, subject, exam_date) IN (select student_id, subject, mx from a) )
, CTE as (
select A.student_id ,B.subject , min_score first_score , max_score latest_score 
from mn_score A
join mx_score B
on A.student_id = B.student_id and A.subject = B.subject)
select * from CTE where latest_score - first_score > 0 order by student_id, subject 