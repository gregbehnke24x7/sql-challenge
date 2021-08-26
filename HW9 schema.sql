-- start script
-- clean slate protocol initiated
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS emp_dept;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;

-- Titles table
CREATE TABLE titles (
    title_id varchar(5) PRIMARY KEY,
    title varchar(30)   NOT NULL
);
COPY titles (title_id,title) FROM 'C:\Users\Salty\sql-challenge\data\titles.csv'  CSV HEADER;
-- Employees table
CREATE TABLE employees (
    emp_no varchar(6)  PRIMARY KEY,
    emp_title varchar(5),
    birth_date varchar(10),
    first_name varchar(30),
    last_name varchar(30),
    sex varchar(1),
    hire_date date,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);
COPY employees (emp_no,emp_title,birth_date,first_name,last_name,sex,hire_date) FROM 'C:\Users\Salty\sql-challenge\data\employees.csv' CSV HEADER;
-- Salaries table
CREATE TABLE salaries (
    emp_no varchar(10) PRIMARY KEY,
    salary int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
COPY salaries (emp_no,salary) FROM 'C:\Users\Salty\sql-challenge\data\salaries.csv' CSV HEADER;
-- Departments table
CREATE TABLE departments (
    dept_no varchar(4) PRIMARY KEY,
    department varchar(30)
);
COPY departments (dept_no,department) FROM 'C:\Users\Salty\sql-challenge\data\departments.csv' CSV HEADER;
-- Employees-Departments table
CREATE TABLE emp_dept (
    emp_no varchar(6),
    dept_no varchar(4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
COPY emp_dept (emp_no,dept_no) FROM 'C:\Users\Salty\sql-challenge\data\dept_emp.csv' CSV HEADER;
-- Department-Managers table
CREATE TABLE dept_manager (
    dept_no varchar(4),
    emp_no varchar(6) NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)	
);
COPY dept_manager (dept_no,emp_no) FROM 'C:\Users\Salty\sql-challenge\data\dept_manager.csv' CSV HEADER;


