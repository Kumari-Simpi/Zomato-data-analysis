SELECT * FROM zomato;

-- Top-rated Restaurants.
SELECT name, rate, votes
FROM zomato
ORDER BY rate DESC
LIMIT 10;

-- Online Orders vs Table Bookings.
SELECT online_order, COUNT(*) AS order_count
FROM zomato
GROUP BY online_order;
SELECT book_table, COUNT(*) AS table_count
FROM zomato
GROUP BY book_table;

-- Average Cost for Two People by Rating
SELECT rate, AVG(`approx_cost(for two people)`) AS avg_cost
FROM zomato
GROUP BY rate
ORDER BY rate;

-- Category Popularity
SELECT `listed_in(type)`, SUM(votes) AS total_votes
FROM zomato
GROUP BY `listed_in(type)`
ORDER BY total_votes DESC
LIMIT 10;

-- Customer Segmentation Based on Rating & Votes
SELECT name, rate, votes, 
       CASE 
           WHEN rate > 4 THEN 'High Rating'
           WHEN rate BETWEEN 3 AND 4 THEN 'Moderate Rating'
           ELSE 'Low Rating'
       END AS rating_segment
FROM zomato
WHERE votes > 100
ORDER BY votes DESC;