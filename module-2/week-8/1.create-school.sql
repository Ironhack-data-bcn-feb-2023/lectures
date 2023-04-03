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
-- 3. CREATE Relationships
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



