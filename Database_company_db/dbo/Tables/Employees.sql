CREATE TABLE [dbo].[Employees] (
    [emp_id]     INT             NOT NULL,
    [first_name] VARCHAR (50)    NULL,
    [last_name]  VARCHAR (50)    NULL,
    [email]      VARCHAR (100)   NULL,
    [hire_date]  DATE            NULL,
    [salary]     DECIMAL (10, 2) NULL,
    [manager_id] INT             NULL,
    [dept_id]    INT             NULL,
    PRIMARY KEY CLUSTERED ([emp_id] ASC),
    FOREIGN KEY ([dept_id]) REFERENCES [dbo].[Departments] ([dept_id]),
    FOREIGN KEY ([manager_id]) REFERENCES [dbo].[Employees] ([emp_id])
);

