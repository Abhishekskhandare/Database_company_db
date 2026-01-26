CREATE TABLE [dbo].[Projects] (
    [project_id]   INT             NOT NULL,
    [project_name] VARCHAR (100)   NULL,
    [budget]       DECIMAL (15, 2) NULL,
    [start_date]   DATE            NULL,
    [end_date]     DATE            NULL,
    PRIMARY KEY CLUSTERED ([project_id] ASC)
);

