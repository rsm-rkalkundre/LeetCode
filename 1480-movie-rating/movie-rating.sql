WITH user_ranked AS (
    SELECT u.name AS results, COUNT(rating) AS r1
    FROM MovieRating mr
    LEFT JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
    ORDER BY r1 DESC, u.name
    LIMIT 1
),
movie_ranked AS (
    SELECT m.title AS results, AVG(rating) AS r
    FROM MovieRating mr
    LEFT JOIN Movies m ON m.movie_id = mr.movie_id
    WHERE MONTH(mr.created_at) = 2 AND YEAR(mr.created_at) = 2020
    GROUP BY m.title
    ORDER BY r DESC, m.title
    LIMIT 1
)
SELECT results FROM user_ranked
UNION ALL
SELECT results FROM movie_ranked;