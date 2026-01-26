CREATE TABLE [dbo].[Departments] (
    [dept_id]   INT          NOT NULL,
    [dept_name] VARCHAR (50) NOT NULL,
    [location]  VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([dept_id] ASC)
);

