USE movies_reviews;

SELECT * FROM movies;

# Top 10 Highest Grossing Movies
SELECT movie_title, movie_revenue
FROM movies
ORDER BY movie_revenue DESC
LIMIT 10;

# Average Movie Budget and Revenue
select avg(movie_budget) as avg_budget, avg(movie_revenue) as avg_revenue
from movies;

# Movies with Runtime Over 3 Hours 
SELECT movie_title, runtime_minutes
FROM movies
WHERE runtime_minutes > 180;

# Most Popular Languages
SELECT language, COUNT(*) AS num_movies
FROM movies
GROUP BY language
ORDER BY num_movies DESC;

# Most Prolific Directors
SELECT director_name, COUNT(*) AS movie_count
FROM movies
GROUP BY director_name
ORDER BY movie_count DESC
LIMIT 10;

# Budget vs Revenue Outliers (Basic Correlation)
SELECT movie_title, movie_budget, movie_revenue, (movie_revenue - movie_budget) AS profit
FROM movies
WHERE movie_budget > 0 AND movie_revenue >= 3 * movie_budget
ORDER BY profit DESC;

#  Biggest Flops
SELECT movie_title, movie_budget, movie_revenue
FROM movies
WHERE movie_budget > 10000000 AND movie_revenue < 1000000
ORDER BY movie_budget DESC;

# Most Common Genres
SELECT COUNT(*) AS drama_count
FROM movies
WHERE genre_list LIKE '%Drama%';

# Movie Release Trend by Year
SELECT year, COUNT(*) AS num_movies
FROM (
    SELECT EXTRACT(YEAR FROM release_date) AS year
    FROM movies
    WHERE release_date IS NOT NULL
) AS sub
WHERE year IS NOT NULL
GROUP BY year
ORDER BY year ASC;

