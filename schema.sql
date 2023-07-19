/* Database schema to keep the structure of entire database. */
CREATE TABLE IF NOT EXISTS animals (
  id serial PRIMARY KEY,
  name varchar(255),
  date_of_birth date,
  escape_attempts integer,
  neutered boolean,
  weight_kg decimal(10, 2)
);

/*Add species column to animals table*/
ALTER TABLE animals
ADD COLUMN species varchar(255);

/*Creating table named owners*/
CREATE TABLE owners (
  id serial PRIMARY KEY,
  full_name varchar(255),
  age integer
);

/*Creating table named species*/
CREATE TABLE species (
  id serial PRIMARY KEY,
  name varchar(255)
);

/*Modify animals table*/
ALTER TABLE
  animals DROP CONSTRAINT IF EXISTS fk_species_id;

ALTER TABLE
  animals DROP CONSTRAINT IF EXISTS fk_owner_id;

ALTER TABLE
  animals DROP COLUMN IF EXISTS species;

ALTER TABLE
  animals
ADD
  COLUMN species_id integer REFERENCES species(id);

ALTER TABLE
  animals
ADD
  COLUMN owner_id integer REFERENCES owners(id);

ALTER TABLE
  animals
ALTER COLUMN
  id
SET
  DEFAULT nextval('animals_id_seq');

ALTER TABLE
  animals
ADD
  PRIMARY KEY (id);
