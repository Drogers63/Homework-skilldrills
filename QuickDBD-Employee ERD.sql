﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/6m0SoS
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [departments] (
    [dept_no] VARCHAR(4)  NOT NULL ,
    [dept_name] VARCHAR(40)  NOT NULL ,
    CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    ),
    CONSTRAINT [UK_departments_dept_name] UNIQUE (
        [dept_name]
    )
)

CREATE TABLE [employees] (
    [emp_no] INT  NOT NULL ,
    [birth_date] DATE  NOT NULL ,
    [first_name] VARCHAR  NOT NULL ,
    [last_name] VARCHAR  NOT NULL ,
    [gender] VARCHAR  NOT NULL ,
    [hire_date] DATE  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [dept_manager] (
    [dept_no] VARCHAR(4)  NOT NULL ,
    [emp_no] INT  NOT NULL ,
    [from_date] DATE  NOT NULL ,
    [to_date] DATE  NOT NULL ,
    CONSTRAINT [PK_dept_manager] PRIMARY KEY CLUSTERED (
        [dept_no] ASC,[emp_no] ASC
    )
)

CREATE TABLE [dept_emp] (
    [emp_no] INT  NOT NULL ,
    [dept_no] VARCHAR(4)  NOT NULL ,
    [from_date] DATE  NOT NULL ,
    [to_date] DATE  NOT NULL ,
    CONSTRAINT [PK_dept_emp] PRIMARY KEY CLUSTERED (
        [emp_no] ASC,[dept_no] ASC
    )
)

CREATE TABLE [titles] (
    [emp_no] INT  NOT NULL ,
    [title] VARCHAR(50)  NOT NULL ,
    [from_date] DATE  NOT NULL ,
    [to_date] DATE  NOT NULL ,
    CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED (
        [emp_no] ASC,[title] ASC,[from_date] ASC
    )
)

CREATE TABLE [salaries] (
    [emp_no] INT  NOT NULL ,
    [salary] INT  NOT NULL ,
    [from_date] DATE  NOT NULL ,
    [to_date] DATE  NOT NULL ,
    CONSTRAINT [PK_salaries] PRIMARY KEY CLUSTERED (
        [emp_no] ASC,[from_date] ASC
    )
)

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_emp_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_emp_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_dept_no]

ALTER TABLE [titles] WITH CHECK ADD CONSTRAINT [FK_titles_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [titles] CHECK CONSTRAINT [FK_titles_emp_no]

ALTER TABLE [salaries] WITH CHECK ADD CONSTRAINT [FK_salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [salaries] CHECK CONSTRAINT [FK_salaries_emp_no]

COMMIT TRANSACTION QUICKDBD