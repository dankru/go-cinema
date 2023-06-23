CREATE TABLE IF NOT EXISTS users
(
  id serial primary key not null,
  name varchar(255) not null,
  username varchar(255) not null unique,
  password_hash varchar(255) not null
);

CREATE TABLE IF NOT EXISTS film
(
  id serial not null unique,
  title varchar(255) not null,
  description varchar(255)
);

CREATE TABLE IF NOT EXISTS film_content 
( 
  id serial primary key not null,
  title varchar(255) not null,
  description varchar(255),
  FOREIGN KEY (id) REFERENCES film (id) ON DELETE CASCADE NOT NULL
);

