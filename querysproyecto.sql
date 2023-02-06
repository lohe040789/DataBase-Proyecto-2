(SELECT *
FROM actor
LEFT JOIN actor_film
ON actor.actor_id=actor_film.actor_id
LEFT JOIN film
ON film.film_id = actor_film.film_id
LEFT JOIN language
ON language.language_id = film.language_id
LEFT JOIN inventory
ON inventory.film_id = film.film_id
LEFT JOIN rental
ON rental.inventory_id = inventory.inventory_id
LEFT JOIN category
ON category.category_id=actor_film.category_id); 

(SELECT actor.actor_id, first_name, last_name, COUNT(film_id) AS film_count
FROM actor
LEFT JOIN actor_film 
ON actor.actor_id = actor_film.actor_id
GROUP BY actor.actor_id
ORDER BY film_count DESC
LIMIT 3);

SELECT title, COUNT(rental_id) AS rental_count
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE rental.rental_date BETWEEN '2006/06/01' AND '2006/12/31'
GROUP BY film.film_id
ORDER BY rental_count DESC
LIMIT 10;

SELECT category.category_id, name, COUNT(rental_id) AS rental_count
FROM category
LEFT JOIN actor_film
ON category.category_id = actor_film.category_id
LEFT JOIN film 
ON film.film_id = actor_film.film_id
LEFT JOIN inventory 
ON film.film_id = inventory.film_id
LEFT JOIN rental 
ON rental.inventory_id = inventory.inventory_id
GROUP BY category.category_id
ORDER BY rental_count 
DESC;


SELECT film.title, COUNT(rental_id) AS rental_count
FROM film
LEFT JOIN inventory 
ON film.film_id = inventory.film_id
LEFT JOIN rental 
ON inventory.inventory_id = rental.inventory_id
GROUP BY film.film_id
ORDER BY rental_count DESC
LIMIT 5;

SELECT actor.first_name, actor.last_name , film.title ,count(rental.inventory_id) as rental_count
FROM rental
INNER JOIN inventory
ON rental.inventory_id = inventory.inventory_id
INNER JOIN film
ON film.film_id = inventory.film_id
INNER JOIN actor_film
ON actor_film.film_id = film.film_id
INNER JOIN actor
ON actor.actor_id = actor_film.actor_id
GROUP BY actor.first_name , actor.last_name, film.title
ORDER BY rental_count DESC
LIMIT 5;
