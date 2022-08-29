-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Employees] (
    [emp_no] int  NOT NULL ,
    [birth_date] dateTime  NOT NULL ,
    [first_name] varchar(50)  NOT NULL ,
    [last_name] varchar(50)  NOT NULL ,
    [gender] varchar(10)  NOT NULL ,
    [hire_date] dateTime  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Titles] (
    [title_id] serial  NOT NULL ,
    [emp_no] int  NOT NULL ,
    [title] varchar(50)  NOT NULL ,
    [from_date] dateTime  NOT NULL ,
    [to_date] dateTime  NOT NULL ,
    CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

CREATE TABLE [Departments] (
    [dept_no] varchar(50)  NOT NULL ,
    [dept_name] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [Dept_emp] (
    [id] serial  NOT NULL ,
    [emp_no] int  NOT NULL ,
    [dept_no] varchar(50)  NOT NULL ,
    [from_date] dateTime  NOT NULL ,
    [to_date] dateTime  NOT NULL ,
    CONSTRAINT [PK_Dept_emp] PRIMARY KEY CLUSTERED (
        [id] ASC
    )
)

CREATE TABLE [Dept_manager] (
    [id] serial  NOT NULL ,
    [emp_no] int  NOT NULL ,
    [dept_no] varchar(50)  NOT NULL ,
    [from_date] dateTime  NOT NULL ,
    [to_date] dateTime  NOT NULL ,
    CONSTRAINT [PK_Dept_manager] PRIMARY KEY CLUSTERED (
        [id] ASC
    )
)

CREATE TABLE [Salaries] (
    [salary_id] serial  NOT NULL ,
    [emp_no] int  NOT NULL ,
    [salary] varchar(50)  NOT NULL ,
    [from_date] dateTime  NOT NULL ,
    [to_date] dateTime  NOT NULL ,
    CONSTRAINT [PK_Salaries] PRIMARY KEY CLUSTERED (
        [salary_id] ASC
    )
)

ALTER TABLE [Titles] WITH CHECK ADD CONSTRAINT [FK_Titles_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Titles] CHECK CONSTRAINT [FK_Titles_emp_no]

ALTER TABLE [Dept_emp] WITH CHECK ADD CONSTRAINT [FK_Dept_emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Dept_emp] CHECK CONSTRAINT [FK_Dept_emp_emp_no]

ALTER TABLE [Dept_emp] WITH CHECK ADD CONSTRAINT [FK_Dept_emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Dept_emp] CHECK CONSTRAINT [FK_Dept_emp_dept_no]

ALTER TABLE [Dept_manager] WITH CHECK ADD CONSTRAINT [FK_Dept_manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Dept_manager] CHECK CONSTRAINT [FK_Dept_manager_emp_no]

ALTER TABLE [Dept_manager] WITH CHECK ADD CONSTRAINT [FK_Dept_manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Dept_manager] CHECK CONSTRAINT [FK_Dept_manager_dept_no]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no]

COMMIT TRANSACTION QUICKDBD