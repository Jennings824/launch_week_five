SELECT * FROM movies WHERE year < 2000;
SELECT * FROM categories;
SELECT * FROM movies WHERE id = 4;
SELECT title FROM movies ORDER BY year ASC;
SELECT title, year FROM movies ORDER BY  title, year ASC;  --how do you sort by group?
SELECT title FROM movies LIMIT (5);
UPDATE categories SET category = 'Science Fiction' WHERE id = 5;
DELETE FROM movies WHERE id = 3;

SELECT movies.title, categories.category
FROM movies
JOIN categories ON movies.category_id = categories.id
ORDER BY movies.title ASC;
