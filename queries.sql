-- Find all animals whose name ends in "mon".
SELECT
  *
FROM
  animals
WHERE
  NAME LIKE '%mon%';

--List the name of all animals born between 2016 and 2019.
SELECT
  name
FROM
  animals
WHERE
  date_of_birth BETWEEN '2016-01-01'
  AND '2019-12-31';

--List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT
  name
FROM
  animals
WHERE
  neutered = 't'
  AND escape_attempts < 3;

--List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT
  date_of_birth
FROM
  animals
WHERE
  name = 'Agumon'
  OR name = 'Pikachu';

--List name and escape attempts of animals that weigh more than 10.5kg
SELECT
  name,
  escape_attempts
FROM
  animals
WHERE
  weight_kg > 10.5;

--Find all animals that are neutered.
SELECT
  *
FROM
  animals
WHERE
  neutered = 't';

--Find all animals not named Gabumon.
SELECT
  *
FROM
  animals
WHERE
  name != 'Gabumon';

--Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT
  *
FROM
  animals
WHERE
  weight_kg BETWEEN 10.4
  AND 17.3;

--UPDATE AND ROLLBACK
BEGIN;

UPDATE
  animals
SET
  species = 'unspecified';

SELECT
  *
FROM
  animals;

ROLLBACK;

SELECT
  *
FROM
  animals;

--COMMIT
BEGIN;

UPDATE
  animals
SET
  species = 'digimon'
WHERE
  name LIKE '%mon';

UPDATE
  animals
SET
  species = 'pokemon'
WHERE
  species IS NULL;

SELECT
  *
FROM
  animals;

COMMIT;

SELECT
  *
FROM
  animals;

--DELETE AND ROLLBACK
BEGIN;

DELETE FROM
  animals;

SELECT
  *
FROM
  animals;

ROLLBACK;

SELECT
  *
FROM
  animals;

--ROLLBACK TO SAVEPOINT
BEGIN;

DELETE FROM
  animals
WHERE
  date_of_birth > '2022-01-01';

SAVEPOINT my_savepoint;

UPDATE
  animals
SET
  weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT my_savepoint;

UPDATE
  animals
SET
  weight_kg = weight_kg * -1
WHERE
  weight_kg < 0;

COMMIT;

--How many animals are there?
SELECT
  COUNT(*)
FROM
  animals;

--How many animals have never tried to escape?
SELECT
  COUNT(*)
FROM
  animals
WHERE
  escape_attempts = 0;

--What is the average weight of animals?
SELECT
  AVG(weight_kg)
FROM
  animals;

--Who escapes the most, neutered or not neutered animals?
SELECT
  neutered,
  COUNT(*)
FROM
  animals
GROUP BY
  neutered;

--What is the minimum and maximum weight of each type of animal?
SELECT
  species,
  MIN(weight_kg),
  MAX(weight_kg)
FROM
  animals
GROUP BY
  species;

--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT
  species,
  AVG(escape_attempts)
FROM
  animals
WHERE
  date_of_birth BETWEEN '1990-01-01'
  AND '2000-12-31'
GROUP BY
  species;

--What animals belong to Melody Pond?
SELECT
  animals.name
FROM
  animals
  JOIN owners ON animals.owner_id = owners.id
WHERE
  owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT
  animals.name
FROM
  animals
  JOIN species ON animals.species_id = species.id
WHERE
  species.name = 'Pokemon';

-- List all owners and their animals, including those that don't own any animal.
SELECT
  owners.full_name,
  animals.name
FROM
  owners
  LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT
  species.name,
  COUNT(animals.id) AS animal_count
FROM
  species
  LEFT JOIN animals ON species.id = animals.species_id
GROUP BY
  species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT
  animals.name
FROM
  animals
  JOIN species ON animals.species_id = species.id
  JOIN owners ON animals.owner_id = owners.id
WHERE
  species.name = 'Digimon'
  AND owners.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT
  animals.name
FROM
  animals
  JOIN owners ON animals.owner_id = owners.id
WHERE
  owners.full_name = 'Dean Winchester'
  AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT
  owners.full_name,
  COUNT(animals.id) AS animal_count
FROM
  owners
  LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY
  owners.full_name
ORDER BY
  animal_count DESC
LIMIT
  1;

-- Who was the last animal seen by William Tatcher?
SELECT
  animals.name
FROM
  animals
  JOIN visits ON animals.id = visits.animal_id
  JOIN vets ON visits.vet_id = vets.id
WHERE
  vets.name = 'William Tatcher'
ORDER BY
  visits.visit_date DESC
LIMIT
  1;

-- How many different animals did Stephanie Mendez see?
SELECT
  COUNT(DISTINCT visits.animal_id) AS animal_count
FROM
  visits
  JOIN vets ON visits.vet_id = vets.id
WHERE
  vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT
  vets.name,
  COALESCE(species.name, 'No specialty') AS specialty
FROM
  vets
  LEFT JOIN specializations ON vets.id = specializations.vet_id
  LEFT JOIN species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT
  animals.name
FROM
  animals
  JOIN visits ON animals.id = visits.animal_id
  JOIN vets ON visits.vet_id = vets.id
WHERE
  vets.name = 'Stephanie Mendez'
  AND visits.visit_date >= '2020-04-01'
  AND visits.visit_date <= '2020-08-30';

-- What animal has the most visits to vets?
SELECT
  animals.name,
  COUNT(*) AS visit_count
FROM
  animals
  JOIN visits ON animals.id = visits.animal_id
GROUP BY
  animals.name
ORDER BY
  visit_count DESC
LIMIT
  1;

-- Who was Maisy Smith's first visit?
SELECT
  animals.name
FROM
  animals
  JOIN visits ON animals.id = visits.animal_id
  JOIN vets ON visits.vet_id = vets.id
WHERE
  vets.name = 'Maisy Smith'
ORDER BY
  visits.visit_date ASC
LIMIT
  1;

-- Details for most recent visit animal information, vet information, and date of visit.
SELECT
  animals.name AS animal_name,
  vets.name AS vet_name,
  visits.visit_date
FROM
  visits
  JOIN animals ON visits.animal_id = animals.id
  JOIN vets ON visits.vet_id = vets.id
ORDER BY
  visits.visit_date DESC
LIMIT
  1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT
  COUNT(*) AS mismatch_count
FROM
  visits
  JOIN animals ON visits.animal_id = animals.id
  JOIN vets ON visits.vet_id = vets.id
  LEFT JOIN specializations ON vets.id = specializations.vet_id
  AND animals.species_id = specializations.species_id
WHERE
  specializations.vet_id IS NULL;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT
  species.name
FROM
  visits
  JOIN animals ON animals.id = visits.animal_id
  JOIN vets ON vets.id = visits.vet_id
  JOIN species ON species.id = species_id
WHERE
  vets.name = 'Maisy Smith'
GROUP BY
  species.name
ORDER BY
  COUNT(species.name) DESC
LIMIT
  1;