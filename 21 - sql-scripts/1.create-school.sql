-- 1. CREATE DATABASE
DROP DATABASE IF EXISTS school;
CREATE DATABASE IF NOT EXISTS school;

-- 2. CREATE TABLES
USE school;
CREATE TABLE IF NOT EXISTS teacher (
	teacher_id INT PRIMARY KEY,
	first_name VARCHAR(40) NOT NULL,
	language_1 VARCHAR(3),
    language_2 VARCHAR(3),
    dob DATE,
    tax_id INT UNIQUE,
    phone_no VARCHAR(20)
);


-- 2. CREATE TABLES
USE school;
CREATE TABLE IF NOT EXISTS teacher (
	teacher_id INT PRIMARY KEY,
	first_name VARCHAR(40) NOT NULL,
	language_1 VARCHAR(3),
    language_2 VARCHAR(3),
    dob DATE,
    tax_id INT UNIQUE,
    phone_no VARCHAR(20)
);

-- client id, client name, adress, indiustry
CREATE TABLE IF NOT EXISTS client (
	client_id INT PRIMARY KEY,
    client_name VARCHAR(20) NOT NULL,
    address VARCHAR(80),
    industry VARCHAR(20)
);

-- participant: participant_id, 
-- first_name, last_name, phone_no, client
CREATE TABLE IF NOT EXISTS participant (
	participant_id INT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    phone_no VARCHAR(20),
    client INT
);

-- TABLE: course
-- COLUMNS: course_id, course_name, language, level ,length, 
-- start_date, in_school, teracher,client
DROP TABLE IF EXISTS course;
CREATE TABLE IF NOT EXISTS course (
	course_id INT PRIMARY KEY,
    course_name VARCHAR(40) NOT NULL,
    language VARCHAR(3) NOT NULL,
    level INT, 
    length_in_weeks INT, 
    start_date  DATE,
    in_school BOOLEAN,
    teacher INT, -- teacher_id FROM teacher (FK)
    client INT -- (FK)
);

-- 1. CREATE DATABASE
-- 2. CREATE TABLES
-- 3. CREATE Reluationships
-- 4. CRUD: create, read, update, delete
-- 4. INPUT EN LA TABLA

-- 5. SELECT


-- table: participant
-- column: client
-- goal: client to be FK from client table

ALTER TABLE participant
	ADD FOREIGN KEY (client) -- column as a FK
    REFERENCES client(client_id)
    ON DELETE SET NULL; -- original column (PK)


ALTER TABLE course
	ADD FOREIGN KEY (teacher) -- course.teacher
    REFERENCES teacher(teacher_id) -- teacher.teacher_id
    ON DELETE CASCADE;

ALTER TABLE course
	ADD FOREIGN KEY (client)  -- course.client
    REFERENCES client(client_id) -- client.client_id
    ON DELETE CASCADE;
    

CREATE TABLE takes_course (
	participant_id INT,
    course_id INT,
    PRIMARY KEY (participant_id, course_id), 
		FOREIGN KEY (participant_id) REFERENCES participant(participant_id),
		FOREIGN KEY  (course_id)  REFERENCES  course(course_id)
);


-- 4. INPUT EN LA TABLA
-- 1, Mica,  ENG, ESP, 01-01-1985, 45678, 345678

-- PUT
-- INPUT
INSERT INTO teacher 
VALUES (1, "Mica", "eng", "ESP", '1985-01-12', 45678, "345678");

INSERT INTO teacher(teacher_id, first_name, tax_id, phone_no)
VALUES (2, "Hugo", 45679, "3456780000");


INSERT INTO teacher -- I need all the columns
VALUES
(3, "Mariona", "eng", "ESP", '1985-01-12', 45, "345678"),
(4, "Carles", "eng", "ESP", '1985-01-12', 5678, "345678"),
(5, "Nevan", "eng", "ESP", '1985-01-12', 345678, "345678");

INSERT INTO teacher -- I need all the columns
VALUES
(4, "sdsdsd", "sd", "sd", '1985-01-12', 5678, "345678");

-- DROP
DELETE FROM teacher
	WHERE teacher_id = 5;
    
UPDATE teacher
    SET language_2 = "CAT"
	WHERE teacher_id = 4;


UPDATE teacher
    SET language_2 = "CAT"
	WHERE teacher_id = 4;



-- 1. Crear DB
-- 2. Crear tablas
-- 3. Tipos de datos dentro de las tablas
	-- variable, nulos, únicos, relaciones
-- 4. PK, FK, (PK compuestas)
-- 5. CREATE, READ, UPDATE, DELETE
	




