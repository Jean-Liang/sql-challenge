--Create departments table
CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);
--Create titles table
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);
--Create emplpoyees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(10),
    birth_date DATE NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
--Create salaries table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
--Create dept_emp table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(10),
	PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
--Create dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(10),
    emp_no INT,
	PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


-- When import the employees data into employees table, noticed the "birth_date" and "hire_date" (mm/dd/yyyy) not in the correct format for importing.
-- Use python script to covert the "birth_date" and "hire_date" columns to be the yyyy/mm/dd format.
-- Import the output file "employees_converted.csv" into the employees table.
-- In data folder, refers to "Convert birth and hire date format for employees file.ipynb" and "employees_converted.csv"

-- After importing all six csv files, below select the files and check the header and rows of data before the data analysis starts.

SELECT * FROM departments;
SELECT COUNT(*) FROM departments; --9 rows matches with csv

SELECT * FROM titles;
SELECT COUNT(*) FROM titles; --7 rows matches with csv

SELECT * FROM employees;
SELECT COUNT(*) FROM employees; --300024 rows matches with csv

SELECT * FROM salaries;
SELECT COUNT(*) FROM salaries; --300024 rows matches with csv

SELECT * FROM dept_emp;
SELECT COUNT(*) FROM dept_emp; --331603 rows matches with csv

SELECT * FROM dept_manager;
SELECT COUNT(*) FROM dept_manager; --24 rows matches with csv



