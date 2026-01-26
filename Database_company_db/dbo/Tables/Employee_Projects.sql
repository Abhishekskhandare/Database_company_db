CREATE TABLE [dbo].[Employee_Projects] (
    [emp_id]       INT NOT NULL,
    [project_id]   INT NOT NULL,
    [hours_worked] INT NULL,
    PRIMARY KEY CLUSTERED ([emp_id] ASC, [project_id] ASC),
    FOREIGN KEY ([emp_id]) REFERENCES [dbo].[Employees] ([emp_id]),
    FOREIGN KEY ([project_id]) REFERENCES [dbo].[Projects] ([project_id])
);

