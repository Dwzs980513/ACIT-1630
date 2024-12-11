-- Drop the database if it exists
DROP DATABASE IF EXISTS Person_Pet;

-- Create the new database
CREATE DATABASE Person_Pet;

-- Use the database
USE Person_Pet;

-- Drop existing procedure if it exists
DROP PROCEDURE IF EXISTS AddPet;


-- Drop tables if they exist
DROP TABLE IF EXISTS Pet_Type;
DROP TABLE IF EXISTS Pet;
DROP TABLE IF EXISTS Person;

-- Create Person table
CREATE TABLE Person (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- Create Pet_Type table
CREATE TABLE Pet_Type (
    pet_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50) NOT NULL
);

-- Create Pet table with foreign keys to Person and Pet_Type
CREATE TABLE Pet (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    pet_type_id INT NOT NULL,
    person_id INT,
    CONSTRAINT FK_Pet_Pet_Type FOREIGN KEY (pet_type_id) REFERENCES Pet_Type (pet_type_id),
    CONSTRAINT FK_Pet_Person FOREIGN KEY (person_id) REFERENCES Person (person_id)
);

-- Insert initial data into Person
INSERT INTO Person (first_name, last_name) VALUES 
    ('Katie', 'Sylvia'),
    ('Penny', 'Superbark'),
    ('Fix-it', 'Felix'),
    ('Gru', 'Despicable');

-- Insert initial data into Pet_Type
INSERT INTO Pet_Type (type) VALUES 
    ('dog'),
    ('cat'),
    ('hamster');

-- Insert initial data into Pet
INSERT INTO Pet (name, pet_type_id, person_id) VALUES 
    ('Max', 1, 1),
    ('Duke', 1, 1),
    ('Bolt', 1, 2),
    ('Mittens', 2, 2),
    ('Rhino', 3, 2),
    ('Kyle', 1, 4),
    ('Scruffy', 1, NULL);

-- Stored Procedure: AddPet
DELIMITER $$

CREATE PROCEDURE AddPet(
    IN person_first_name VARCHAR(50),
    IN person_last_name VARCHAR(50),
    IN pet_name VARCHAR(50),
    IN pet_type VARCHAR(50)
)
BEGIN
    DECLARE person_id INT DEFAULT NULL;
    DECLARE pet_id INT DEFAULT NULL;
    DECLARE pet_type_id INT DEFAULT NULL;

    -- Find or insert Person
    SELECT p.person_id INTO person_id
    FROM Person p
    WHERE p.first_name = person_first_name
      AND p.last_name = person_last_name
    LIMIT 1;

    IF person_id IS NULL THEN
        INSERT INTO Person (first_name, last_name) VALUES (person_first_name, person_last_name);
        SET person_id = LAST_INSERT_ID();
    END IF;

    -- Check if Pet exists
    SELECT pt.pet_id INTO pet_id
    FROM Pet pt
    WHERE pt.name = pet_name
      AND pt.person_id = person_id
    LIMIT 1;

    -- If pet already exists, raise an error
    IF pet_id IS NOT NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pet already exists';
    END IF;

    -- Find or insert Pet_Type
    SELECT pt.pet_type_id INTO pet_type_id
    FROM Pet_Type pt
    WHERE pt.type = pet_type
    LIMIT 1;

    IF pet_type_id IS NULL THEN
        INSERT INTO Pet_Type (type) VALUES (pet_type);
        SET pet_type_id = LAST_INSERT_ID();
    END IF;

    -- Insert new Pet record
    INSERT INTO Pet (name, pet_type_id, person_id) VALUES (pet_name, pet_type_id, person_id);
    SET pet_id = LAST_INSERT_ID();

    -- Output the IDs
    SELECT person_id AS PersonID;
    SELECT pet_type_id AS PetTypeID;
    SELECT pet_id AS PetID;
END$$

DELIMITER ;
