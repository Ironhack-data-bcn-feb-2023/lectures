USE publications;
SELECT * FROM authors;

-- 1. SELECT: titles, au_lname
-- 2. FROM titles

-- inner is the default
SELECT titles.title, au_lname
	FROM titles
    LEFT JOIN titleauthor
		ON titles.title_id = titleauthor.title_id
	LEFT JOIN authors
		ON titleauthor.au_id = authors.au_id;
    
SELECT * FROM  authors;
SELECT * FROM titles;

USE employees;
SELECT * FROM salaries;
SELECT * FROM employees;

SELECT first_name, salary
FROM employees
	LEFT JOIN salaries
		ON salaries.emp_no = employees.emp_no
	ORDER BY salary DESC;