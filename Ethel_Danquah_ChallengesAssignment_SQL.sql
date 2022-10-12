/*Project Famous People */
CREATE DATABASE Project_Famous_People;
USE Project_Famous_People;

CREATE TABLE Famous_people (id INT PRIMARY KEY AUTO_INCREMENT, fullname TEXT, gender TEXT, no_of_children INT);
INSERT INTO Famous_people (fullname, gender, no_of_children) VALUES ('Chris Evans', 'Male', 0),
('Ella Fanning', 'Female', 0),
('Chris Pine', 'Male', 0),
('Chris Hemsworth', ' Male', 3),
('Jennifer Lopez', 'Female', 2),
('George Clooney', 'Male', 2),
('Lee Min Ho', 'Male', 0);

CREATE TABLE movies (id INT PRIMARY KEY AUTO_INCREMENT, movies_id INT, movie_title TEXT, year_released INT, supporting_character TEXT);
INSERT INTO movies (movies_id, movie_title, year_released, supporting_character) VALUES (1, 'Captain America', 2006, 'Robert Downy Jr'),
					(2, 'Malevolent', 2006, 'Angelina Jolie'),
                    (3, 'Star Trek', 2002, 'Zachary Quinto'),
					(4, 'Thor', 2008, 'Natalie Portman'),
                    (5, 'Maid in Manhattan', 1999, 'Stanley Tucci'),
                    (6, 'Ides of March', 2004, 'Ryan Gosling'),
                    (7, 'Boys over Flowers', 2000, 'Lucy Chan');
                    

CREATE TABLE weekend_vibes (id INT PRIMARY KEY AUTO_INCREMENT, movie1_id INT, movie2_id INT, movie3_id INT);
INSERT INTO weekend_vibes (movie1_id, movie2_id, movie3_id) VALUES (1, 3, 7),
												(2, 4, 6),
                                                (3, 5, 7),
                                                (4, 7, 5);

                    
SELECT * FROM movies;
SELECT * FROM Famous_people;
SELECT * FROM weekend_vibes;

/*With this, I am able to view information pertaning to all my movies */
SELECT movies.id, fullname, gender, movie_title, year_released, supporting_character FROM Famous_people
JOIN movies
ON movies.movies_id = Famous_people.id;

SELECT a.movie_title AS first_movie, a.year_released, 
b.movie_title AS second_movie, b.year_released, 
c.movie_title AS third_movie, c.year_released 
FROM weekend_vibes
JOIN movies a 
ON weekend_vibes.movie1_id = a.movies_id
JOIN movies b
ON weekend_vibes.movie2_id = b.movies_id
JOIN movies c
ON weekend_vibes.movie3_id = c.movies_id;

/*I want to have all the information to be able to have a wonderful weekend, by combining the 3 tables I just enjoyed my weekend
I saw who acted what and when */                  
SELECT a.movie_title AS first_movie, e.fullname, a.supporting_character, a.year_released, 
b.movie_title AS second_movie, f.fullname, b.supporting_character, b.year_released, 
c.movie_title AS third_movie, g.fullname, c.supporting_character, c.year_released 
FROM weekend_vibes
JOIN movies a 
ON weekend_vibes.movie1_id = a.movies_id
JOIN movies b
ON weekend_vibes.movie2_id = b.movies_id
JOIN movies c
ON weekend_vibes.movie3_id = c.movies_id
JOIN Famous_people e
ON a.movies_id = e.id
JOIN Famous_people f
ON b.movies_id = f.id
JOIN Famous_people g
ON c.movies_id = g.id;


/*CHALLENGE 1: Clothing alterations */
CREATE TABLE clothes (id INTEGER PRIMARY KEY AUTO_INCREMENT, type TEXT,design TEXT);
INSERT INTO clothes (type, design)
 VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
 VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
 VALUES ("blazer", "black sequin");
 
 SELECT * FROM clothes;
 ALTER TABLE clothes ADD price INT;
 UPDATE clothes SET price = 10 WHERE id = 1; 
 UPDATE clothes SET price = 20 WHERE id = 2;
 UPDATE clothes SET price = 30 WHERE id = 3;
 SELECT * FROM clothes;
 
 INSERT INTO clothes (type, design, price) VALUES ('shoes', 'patent leather', 25);
 SELECT * FROM clothes;
 
 
 
 /*CHALLENGE 2: Dynamic Documents*/
 CREATE table documents (id INTEGER PRIMARY KEY AUTO_INCREMENT, title TEXT,content
TEXT,author TEXT);
INSERT INTO documents (author, title, content)
 VALUES ("Puff T.M. Dragon", "Fancy Stuff", "Ceiling wax, dragon wings, etc.");
INSERT INTO documents (author, title, content)
 VALUES ("Puff T.M. Dragon", "Living Things", "They're located in the left ear, you know.");
INSERT INTO documents (author, title, content)
 VALUES ("Jackie Paper", "Pirate Recipes", "Cherry pie, apple pie, blueberry pie.");
 INSERT INTO documents (author, title, content)
 VALUES ("Jackie Paper", "Boat Supplies", "Rudder - guitar. Main mast - bed post.");
INSERT INTO documents (author, title, content)
 VALUES ("Jackie Paper", "Things I'm Afraid Of", "Talking to my parents, the sea, giant pirates,
heights.");

SELECT * FROM documents;
UPDATE documents SET author = 'Jackie Draper' WHERE author = 'Jackie Paper';
SELECT * FROM documents;

DELETE FROM documents WHERE title = "Things I'm Afraid Of";
SELECT * FROM documents;


/*CHALLENGE 3: Bobby's Hobbies*/
CREATE TABLE persons (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, age
INTEGER);
INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12);
INSERT INTO persons (name, age) VALUES ("Lucy BoBucie", 25);
INSERT INTO persons (name, age) VALUES ("Banana FoFanna", 14);
INSERT INTO persons (name, age) VALUES ("Shish Kabob", 20);
INSERT INTO persons (name, age) VALUES ("Fluffy Sparkles", 8);
INSERT INTO persons (name, age) VALUES ("Jerry Jay", 9);

CREATE table hobbies (id INTEGER PRIMARY KEY AUTO_INCREMENT, person_id INTEGER,
 name TEXT);
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");
INSERT INTO hobbies (person_id, name) VALUES (5, "hunting");

SELECT *  FROM persons;
SELECT * FROM hobbies;

INSERT INTO persons (name, age) VALUES ('Sashimi Wasabi', 30);
INSERT INTO hobbies (person_id, name) VALUES (7, 'cooking');

SELECT persons.name, hobbies.name AS hobbies FROM hobbies
RIGHT OUTER JOIN persons
ON persons.id = hobbies.person_id;

SELECT persons.name, hobbies.name AS hobbies FROM hobbies
RIGHT OUTER JOIN persons
ON persons.id = hobbies.person_id
WHERE persons.name = 'Bobby McBobbyFace';


/*CHALLENGE 4: Customer's orders*/
CREATE TABLE customers (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, email
TEXT);
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (id INTEGER PRIMARY KEY AUTO_INCREMENT,customer_id INTEGER,item
TEXT,price REAL);
INSERT INTO orders (customer_id, item, price)
 VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
 VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
 VALUES (1, "TARDIS", 1000000.00);
 
 SELECT * FROM customers;
 SELECT * FROM orders;
 SELECT customers.name, customers.email,
 orders.item, orders.price FROM customers
 LEFT OUTER JOIN orders
 ON customers.id = orders.customer_id;
 
 SELECT customers.name, customers.email, SUM(price) FROM customers
 LEFT OUTER JOIN orders
 ON customers.id = orders.customer_id
 GROUP BY customers.name
 ORDER BY SUM(price) DESC;
 
 
 
 /*CHALLENGE 5: Sequels in SQL*/
 CREATE TABLE movies (id INTEGER PRIMARY KEY AUTO_INCREMENT,title TEXT,released
INTEGER,sequel_id INTEGER);
INSERT INTO movies VALUES (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
INSERT INTO movies VALUES (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
INSERT INTO movies VALUES (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
INSERT INTO movies VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 5);
INSERT INTO movies VALUES (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
INSERT INTO movies VALUES (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
INSERT INTO movies VALUES (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
INSERT INTO movies VALUES (8, "Harry Potter and the Deathly Hallows – Part 2", 2011, NULL);

SELECT * FROM movies;
SELECT movies.title, a.title AS sequel_title FROM movies
LEFT OUTER JOIN movies a
ON movies.sequel_id = a.id;