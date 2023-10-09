use sakila;
select *
from address;
select *
from category;
select *
from city;
select *
from customer;
select*
from actor;

/*1*/
SELECT customer.first_name,
 customer.last_name, 
 customer.email, 
 address.address, 
 city.city_id, 
 city.city
FROM customer LEFT JOIN address
	ON customer.address_id = address.address_id
LEFT JOIN city
	ON city.city_id = address.city_id
WHERE address.city_id = 312;

/*2*/
SELECT film.title AS 'Título', 
    film.description AS 'Descripción', 
    film.release_year AS 'Año de Estreno', 
    film.rating AS 'Calificación', 
    film.special_features AS 'Características Especiales',
    category.name AS 'Género'
FROM film
JOIN film_category 
ON film.film_id = film_category.film_id
JOIN category 
ON film_category.category_id = category.category_id
WHERE category.name = 'Comedy';

/*3*/
SELECT 
    actor.actor_id AS 'ID del Actor',
    CONCAT(actor.first_name, ' ', actor.last_name) AS 'Nombre del Actor',
    film.title AS 'Título de la Película',
    film.description AS 'Descripción',
    film.release_year AS 'Año de Lanzamiento'
FROM actor
JOIN film_actor 
ON actor.actor_id = film_actor.actor_id
JOIN film 
ON film_actor.film_id = film.film_id
WHERE actor.actor_id = 5;

/*4*/
SELECT 
	city_id AS 'Id',
    c.first_name AS 'Nombre', 
    c.last_name AS 'Apellido', 
    c.email AS 'Correo Electrónico', 
    a.address AS 'Dirección'
FROM customer c
JOIN address a 
ON c.address_id = a.address_id
WHERE c.store_id = 1 AND a.city_id IN (1, 42, 312, 459);

/*5*/
SELECT 
    film.title AS 'Título',
    film.description AS 'Descripción',
    film.release_year AS 'Año de Lanzamiento',
    film.rating AS 'Calificación',
    film.special_features AS 'Característica Especial'
FROM 
    film
JOIN 
    film_actor 
    ON film.film_id = film_actor.film_id
WHERE 
    film.rating = 'G' 
    AND film.special_features LIKE '%Behind the Scenes%' 
    AND film_actor.actor_id = 15;


/*6*/
SELECT 
    film_actor.film_id,
    film.title,
    actor.actor_id,
    CONCAT(actor.first_name, ' ', actor.last_name) AS actor_name
FROM film_actor
JOIN film 
ON film_actor.film_id = film.film_id
JOIN actor 
ON film_actor.actor_id = actor.actor_id
WHERE 
    film_actor.film_id = 369;

/*7*/
SELECT 
    film.title AS 'Título',
    film.description AS 'Descripción',
    film.release_year AS 'Año de Estreno',
    film.rating AS 'Calificación',
    film.special_features AS 'Características Especiales',
    category.name AS 'Género'
FROM film
JOIN film_category 
ON film.film_id = film_category.film_id
JOIN category 
ON film_category.category_id = category.category_id
WHERE 
    film.rating = 'PG-13' 
    AND film.rental_rate = 2.99 
    AND category.name = 'Drama';

/*8*/
SELECT 
	actor.actor_id,
	CONCAT(actor.first_name, ' ', actor.last_name) AS 'Nombre del Actor',
    film.title, 
    film.film_id,
    film.description, 
    film.release_year, 
    film.rating, 
    film.special_features, 
    category.name AS 'Género'
FROM 
    film
    JOIN film_category ON film_category.film_id = film.film_id
    JOIN category ON category.category_id = film_category.category_id
    JOIN film_actor ON film.film_id = film_actor.film_id
    JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE 
    category.name LIKE '%action'
    AND actor.first_name = 'SANDRA'
    AND actor.last_name = 'KILMER';



