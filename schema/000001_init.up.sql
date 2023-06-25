CREATE TABLE IF NOT EXISTS users
(
  id serial primary key not null,
  username varchar(255) not null unique,
  password_hash varchar(255) not null,
  admin bool not null
);

CREATE TABLE IF NOT EXISTS film
(
  id serial not null unique,
  title varchar(255) not null unique,
  description varchar(1000),
  image varchar(255) not null,
  video varchar(255) not null
);

