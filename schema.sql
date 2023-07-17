/* Database schema to keep the structure of entire database. */
CREATE TABLE IF NOT EXISTS animals (
  id serial PRIMARY KEY,
  name varchar(255),
  date_of_birth date,
  escape_attempts integer,
  neutered boolean,
  weight_kg decimal(10, 2)
);
