USE employees;
-- SELECT EVERYTHING
SELECT * FROM departments;

SELECT first_name, last_name, gender
	FROM employees;
    
SELECT first_name AS name, last_name, gender
	FROM employees;
    
SELECT first_name, last_name, gender
	FROM employees
		WHERE first_name = "Parto";
        
SELECT first_name, last_name, gender
	FROM employees
		WHERE first_name = "Parto" 
        AND gender = "M";
        
-- name: Bezalel & F
-- OR: M
-- Todos los hombres 
		--  mujeres cuyo nombre es Bezalel

SELECT first_name, last_name, gender
	FROM employees
		WHERE (first_name = "Bezalel" AND 
			gender = "F")
		OR gender = "M";

SELECT * 
	FROM employees
    WHERE first_name = "Hugo"
		OR first_name = "Mark"
        OR first_name = "Ramzi";
        
SELECT * 
	FROM employees
    WHERE first_name IN ("Hugo", "Mark", "Ramzi");

SELECT * 
	FROM employees
    WHERE first_name NOT IN ("Hugo");


SELECT * 
	FROM employees
    WHERE first_name IN ("hugo", "Mark", "Ramzi");
    
SELECT *
	FROM employees
    WHERE first_name LIKE ("an%");
    
SELECT first_name
	FROM employees
    WHERE first_name LIKE ("%an%");
    
-- Select Angus & Angel only
SELECT first_name
	FROM employees
    WHERE first_name LIKE ("ang__");
    
SELECT * FROM employees;

-- Every man born in 1965
	-- 1. What I want to select ✅
    -- 2. From what table ✅
    -- 3. How?: filtering
    
SELECT first_name, last_name, gender, birth_date
	FROM employees
    WHERE gender = "M"
    AND birth_date LIKE ("1965%");

-- No need to include filtering columns in the select statement
SELECT first_name, last_name, birth_date
	FROM employees
    WHERE gender = "M"
    AND birth_date LIKE ("1965%");
    
-- Every woman born in 1965 between Jan and June
	-- 1. What I want to select  
    -- 2. From what table 
    -- 3. How?: filtering
    
SELECT first_name, birth_date
	FROM employees
    WHERE gender = "M"
		AND	birth_date >= "1965-01-01"
        AND birth_date < "1965-07-01";
        
SELECT first_name, birth_date
	FROM employees
    WHERE gender = "M"
		AND	birth_date BETWEEN "1965-01-01"
        AND "1965-07-01";
        
SELECT emp_no, salary
	FROM salaries
    WHERE salary BETWEEN 70000 AND 80000;
    
SELECT emp_no, salary
	FROM salaries
    WHERE salary BETWEEN 70000 AND 80000
    ORDER BY salary ASC;
    
-- Between Angus AND Chenye
SELECT first_name
	FROM employees
    WHERE first_name BETWEEN "angus" AND "Chenye"
    ORDER BY first_name DESC;

SELECT * 
	FROM employees
    WHERE birth_date IS NOT NULL;

SELECT * FROM salaries;

-- df[].apply(lambda x: x * 0.83)
SELECT salary, (salary * 0.83)
	FROM salaries;

SELECT salary as $, (salary * 0.83) AS TAX
	FROM salaries;

-- Avg salary in this company
SELECT AVG(salary)
	FROM salaries;

SELECT ROUND(AVG(salary))
	FROM salaries;
    
SELECT ROUND(AVG(salary), 2)
	FROM salaries;
    
-- Total of salaries in the company
SELECT SUM(salary)
	FROM salaries;
    
-- How many empoloyees?
SELECT COUNT(emp_no)
	FROM employees;
    
-- How many employees born after 1965
SELECT COUNT(emp_no)
	FROM employees
	WHERE birth_date >= "1965-01-01";

-- How many departments?
SELECT COUNT(DISTINCT(dept_name))
	FROM departments;
    
-- Different names
SELECT COUNT(DISTINCT(first_name))
	FROM employees;

-- How many Parto? How many Anne? etc
-- value counts
-- GROUPBY 

SELECT first_name, COUNT(first_name) AS count
	FROM employees
    GROUP BY first_name
    ORDER BY count desc;

-- Most frequent name
SELECT first_name, COUNT(first_name) AS count
	FROM employees
    GROUP BY first_name
    ORDER BY count desc
    LIMIT 1;
    
-- where & having: conditions

SELECT * FROM employees WHERE birth_date
> "1960-01-01";

SELECT * FROM employees HAVING birth_date
> "1960-01-01";

-- Employees 
-- hire_date 1986
-- name: not too frequent
-- Where: before groupin g
-- Having: after grouping
SELECT first_name, COUNT(first_name) AS count
	FROM employees
		WHERE hire_date LIKE ("1986%")
		GROUP BY first_name
		HAVING count <= 20
	ORDER BY count DESC;

SELECT CONCAT(first_name, " ", last_name) 
AS
name
FROM employees;

-- SYNTAX ERROR: non-aggregate column
SELECT first_name, COUNT(first_name) AS count
	FROM employees
		GROUP BY first_name
	ORDER BY count DESC;
-- GROUP BY clause and contains nonaggregated column 'employees.employees.last_name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by	0.0011 sec


 