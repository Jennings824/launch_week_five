DROP TABLE movies CASCADE;
DROP TABLE categories CASCADE;

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  year INTEGER NOT NULL,
  category_id INTEGER NOT NULL
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  category VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX ON categories (category);
CREATE UNIQUE INDEX ON movies (year, title);
