--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex,
       s.salary
   from employees as e
   inner join salaries as s
   on s.emp_no = e.emp_no;
--2. List first name, last name, and hire date for employees who were hired in 1986.
select e.first_name, e.last_name, e.hire_date
   from employees as e
   where e.hire_date > '12/31/1985' and
         e.hire_date < '1/1/1987';
--3. List the manager of each department with the following information: department number, department name,
--   the manager's employee number, last name, first name.
select d.dept_no, d.department, 
       m.emp_no, 
	   e.last_name, e.first_name
   from departments as d
   inner join dept_manager as m
   on m.dept_no = d.dept_no
   inner join employees as e
   on e.emp_no = m.emp_no;
--4. List the department of each employee with the following information: employee number, last name,
--   first name, and department name.
select e.emp_no, e.last_name, e.first_name,
       g.department
   from employees as e
   inner join emp_dept as f
   on f.emp_no = e.emp_no
   inner join departments as g
   on g.dept_no = f.dept_no;
 --5. List first name, last name, and sex for employees whose first name is "Hercules" and last names
 --   begin with "B."
 select first_name, last_name, sex
   from employees
   where first_name = 'Hercules' and
         left(last_name, 1) = 'B';
--6. List all employees in the Sales department, including their employee number, last name, first name, 
--   and department name.
select a.emp_no, a.last_name, a.first_name,
       c.department
   from employees as a
   inner join emp_dept as b
   on b.emp_no = a.emp_no
   inner join departments as c
   on c.dept_no = b.dept_no
   where c.department = 'Sales';
--7. List all employees in the Sales and Development departments, including their employee number, last name,
--   first name, and department name.
select a.emp_no, a.last_name, a.first_name,
       c.department
   from employees as a
   inner join emp_dept as b
   on b.emp_no = a.emp_no
   inner join departments as c
   on c.dept_no = b.dept_no
   where c.department = 'Sales' or
         c.department = 'Development';
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each
--   last name.
select last_name, count(*) from employees 
   group by last_name 
   order by count desc;
 
       