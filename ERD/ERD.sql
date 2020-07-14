-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "DEPT_NO" varchar   NOT NULL,
    "DEP_NAME" varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DEPT_NO"
     )
);

CREATE TABLE "Titles" (
    "TITLE_ID" varchar   NOT NULL,
    "TITLE" varchar   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "TITLE_ID"
     )
);

CREATE TABLE "Employees" (
    "EMP_NO" int   NOT NULL,
    "EMP_TITLE_ID" varchar   NOT NULL,
    "BIRTH_DATE" date   NOT NULL,
    "FIRST_NAME" varchar   NOT NULL,
    "LAST_NAME" varchar   NOT NULL,
    "GENDER" varchar   NOT NULL,
    "HIRE_DATE" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "EMP_NO"
     )
);

CREATE TABLE "Dept_manager" (
    "DEPT_NO" varchar   NOT NULL,
    "EMP_NO" int   NOT NULL
);

CREATE TABLE "Salaries" (
    "EMP_NO" int   NOT NULL,
    "SALARY" int   NOT NULL
);

CREATE TABLE "Dept_emp" (
    "EMP_NO" int   NOT NULL,
    "DEPT_NO" varchar   NOT NULL
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_EMP_TITLE_ID" FOREIGN KEY("EMP_TITLE_ID")
REFERENCES "Titles" ("TITLE_ID");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_DEPT_NO" FOREIGN KEY("DEPT_NO")
REFERENCES "Departments" ("DEPT_NO");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_EMP_NO" FOREIGN KEY("EMP_NO")
REFERENCES "Employees" ("EMP_NO");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_EMP_NO" FOREIGN KEY("EMP_NO")
REFERENCES "Employees" ("EMP_NO");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_EMP_NO" FOREIGN KEY("EMP_NO")
REFERENCES "Employees" ("EMP_NO");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_DEPT_NO" FOREIGN KEY("DEPT_NO")
REFERENCES "Departments" ("DEPT_NO");

