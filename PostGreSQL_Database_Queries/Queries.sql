--Answer 1

SELECT TOP 1 C.customer_id, C.first_name, C.last_name, C.email, C.store_id, COUNT(C.customer_id) AS CustomerMostRentalsStore_2
FROM film F
INNER JOIN inventory I on I.film_id = F.film_id
INNER JOIN rental R on R.inventory_id=I.inventory_id
INNER JOIN customer C on C.customer_id=R.customer_id
WHERE C.store_id=2
GROUP BY C.customer_id, C.first_name, C.last_name, C.email, C.store_id
ORDER BY CustomerMostRentalsStore_2 DESC;

--Answer: It’s the customer with the name Karl Seal with 45 rentals.

--Answer 2
SELECT F.film_id,I.inventory_id, F.title,C.store_id,R.rental_date,R.return_date
FROM film F
INNER JOIN inventory I on I.film_id = F.film_id
INNER JOIN rental R on R.inventory_id=I.inventory_id
INNER JOIN customer C on C.customer_id=R.customer_id
WHERE F.title='Image Princess' and C.store_id=2
ORDER BY R.rental_date;

--Answer: The result from the above query is that customer couldn’t rent it from the second store, because the book was returned on the 31/07/2005 and time 13:10:47.

--Answer 3
SELECT to_char(rental_date, 'MM/YYYY'), COUNT(DISTINCT customer_id) AS Active_Customers
FROM rental
GROUP BY to_char(rental_date, 'MM/YYYY')
ORDER BY COUNT(DISTINCT customer_id) DESC;
--Answer:  The active and unique customers for 05/2005 were 520
--	       The active and unique customers for 06/2005 were 590
--         The active and unique customers for 07/2005 were 599
--         The active and unique customers for 08/2005 were 599
--	       The active and unique customers for 02/2006 were 158

--Answer 4
SELECT TOP 1 C.name, COUNT(FC.category_id) AS MostPopularCategory
FROM film_category FC
INNER JOIN category C on C.category_id=FC.category_id
INNER JOIN film F on F.film_id=FC.film_id
INNER JOIN inventory I on I.film_id = F.film_id
INNER JOIN rental R on R.inventory_id=I.inventory_id
GROUP BY C.name
ORDER BY MostPopularCategory DESC;
--Answer: The most popular category amongst customers is “Sports” with 1179 rentals. 

--Answer 5:
SELECT TOP 2 F.title, COUNT(F.Title) AS MostPopularFilmInSports
FROM film_category FC
INNER JOIN category C on C.category_id=FC.category_id
INNER JOIN film F on F.film_id=FC.film_id
INNER JOIN inventory I on I.film_id = F.film_id
INNER JOIN rental R on R.inventory_id=I.inventory_id
WHERE C.name='Sports'
GROUP BY F.title
ORDER BY MostPopularFilmInSports DESC;
--Answer: The most popular film in category “Sports” amongst customers is "Talented Homicide" and "Gleaming Jawbreaker" with 29 rentals.


