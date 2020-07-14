-- I had some issues importing files via the import option,
-- so i was able to bypass these errors using the copy command.
-- thats the reason why i have 2 tables schematas.

create table departments (
	dept_no VARCHAR(10) primary key NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

copy departments from '/Users/diegogonzalez/Desktop/Data Science/Week 9/Homework/sql-challenge/EmployeeSQL/data/departments.csv'
with (format CSV, HEADER);

select * from departments;

create table titles (
	title_id VARCHAR(10)PRIMARY KEY NOT NULL,
	title VARCHAR(50) NOT NULL
);

copy titles from '/Users/diegogonzalez/Desktop/Data Science/Week 9/Homework/sql-challenge/EmployeeSQL/data/titles.csv'
with (format CSV, HEADER);

select * from titles;

create table employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(20) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(1)NOT NULL,
	hire_date DATE NOT NULL,
	foreign key (emp_title_id) references titles (title_id)
);

copy employees from '/Users/diegogonzalez/Desktop/Data Science/Week 9/Homework/sql-challenge/EmployeeSQL/data/employees.csv'
with (format CSV, HEADER);

select * from employees;

create table dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

copy dept_manager from '/Users/diegogonzalez/Desktop/Data Science/Week 9/Homework/sql-challenge/EmployeeSQL/data/dept_manager.csv'
with (format CSV, HEADER);

select * from dept_manager;

create table salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
    foreign key (emp_no) references employees (emp_no)
);

copy salaries from '/Users/diegogonzalez/Desktop/Data Science/Week 9/Homework/sql-challenge/EmployeeSQL/data/salaries.csv'
with (format CSV, HEADER);

select * from salaries;

create table dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

copy dept_emp from '/Users/diegogonzalez/Desktop/Data Science/Week 9/Homework/sql-challenge/EmployeeSQL/data/dept_emp.csv'
with (format CSV, HEADER);

select * from dept_emp;