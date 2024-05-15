-- CREATE TABLE IF NOT EXISTS for titles
CREATE TABLE IF NOT EXISTS titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(30) NOT NULL
);

-- CREATE TABLE IF NOT EXISTS for departments
CREATE TABLE IF NOT EXISTS departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);

-- CREATE TABLE IF NOT EXISTS for employees
CREATE TABLE IF NOT EXISTS employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT fk_emp_title FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    CONSTRAINT chk_sex CHECK (sex IN ('M', 'F'))	
);

-- CREATE TABLE IF NOT EXISTS for dept_emp
CREATE TABLE IF NOT EXISTS dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
    PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- CREATE TABLE IF NOT EXISTS for dept_manager
CREATE TABLE IF NOT EXISTS dept_manager (
    dept_no VARCHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT fk_mgr_dept_no FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    CONSTRAINT fk_mgr_emp_no FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- CREATE TABLE IF NOT EXISTS for salaries
CREATE TABLE IF NOT EXISTS salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    CONSTRAINT fk_salary_emp_no FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

