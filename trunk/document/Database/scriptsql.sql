-- Create table Job.
-- Create by	: Hung-DV
-- Date create	: 10/5/2017
CREATE TABLE [dbo].[Job] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [Name]       VARCHAR (100)  NULL,
    [CreateDate] DATETIME       NULL,
    [CreateBy]   NVARCHAR (128) NULL,
    [UpdateDate] DATETIME       NULL,
    [UpdateBy]   NVARCHAR (128) NULL,
    [Status]     BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([CreateBy]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([UpdateBy]) REFERENCES [dbo].[AspNetUsers] ([Id])
);
-- Create table Job end.

-- Create table College.
-- Create by	: Hung-DV
-- Date create	: 10/5/2017
CREATE TABLE [dbo].[College] (
    [Id]         VARCHAR (20)   NOT NULL,
    [Name]       VARCHAR (100)  NULL,
    [ZipCode]    VARCHAR (100)  NULL,
    [CreateDate] DATETIME       NULL,
    [CreateBy]   NVARCHAR (128) NULL,
    [UpdateDate] DATETIME       NULL,
    [UpdateBy]   NVARCHAR (128) NULL,
    [Status]     BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([CreateBy]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([UpdateBy]) REFERENCES [dbo].[AspNetUsers] ([Id])
);
-- Create table College end.

-- Create table Illness.
-- Create by	: Hung-DV
-- Date create	: 10/5/2017
CREATE TABLE [dbo].[Illness] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [Name]       VARCHAR (MAX)  NULL,
    [CreateDate] DATETIME       NULL,
    [CreateBy]   NVARCHAR (128) NULL,
    [UpdateDate] DATETIME       NULL,
    [UpdateBy]   NVARCHAR (128) NULL,
    [Status]     BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([CreateBy]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([UpdateBy]) REFERENCES [dbo].[AspNetUsers] ([Id])
);
-- Create table Illness end.


-- Create table Dentist.
-- Create by	: Hung-DV
-- Date create	: 10/5/2017
CREATE TABLE [dbo].[Dentist] (
    [Id]         NVARCHAR (128) NOT NULL,
    [JobId]      INT            NULL,
    [CollegeId]  VARCHAR (20)   NULL,
    [CreateDate] DATETIME       NULL,
    [CreateBy]   NVARCHAR (128) NULL,
    [UpdateDate] DATETIME       NULL,
    [UpdateBy]   NVARCHAR (128) NULL,
    [Status]     BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([Id]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([JobId]) REFERENCES [dbo].[Job] ([Id]),
    FOREIGN KEY ([CollegeId]) REFERENCES [dbo].[College] ([Id]),
    FOREIGN KEY ([CreateBy]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([UpdateBy]) REFERENCES [dbo].[AspNetUsers] ([Id])
);
-- Create table Dentist end.

-- Create table Clinic.
-- Create by	: Hung-DV
-- Date create	: 10/5/2017
CREATE TABLE [dbo].[Clinic] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (100)  NULL,
    [ClinicManager] NVARCHAR (128) NULL,
    [Email]         NVARCHAR (MAX) NULL,
    [PhoneNumber]   VARCHAR (MAX)  NULL,
    [Address]       VARCHAR (MAX)  NULL,
    [ZipCode]       VARCHAR (MAX)  NULL,
    [Avatar]        VARCHAR (MAX)  NULL,
    [CreateDate]    DATETIME       NULL,
    [CreateBy]      NVARCHAR (128) NULL,
    [UpdateDate]    DATETIME       NULL,
    [UpdateBy]      NVARCHAR (128) NULL,
    [Status]        BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([ClinicManager]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([CreateBy]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([UpdateBy]) REFERENCES [dbo].[AspNetUsers] ([Id])
);
-- Create table Clinic end.

-- Create table Patient.
-- Create by	: Hung-DV
-- Date create	: 10/5/2017
CREATE TABLE [dbo].[Patient] (
    [Id]         NVARCHAR (128) NOT NULL,
    [IllnessId]  INT            NULL,
    [CreateDate] DATETIME       NULL,
    [CreateBy]   NVARCHAR (128) NULL,
    [UpdateDate] DATETIME       NULL,
    [UpdateBy]   NVARCHAR (128) NULL,
    [Status]     BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([Id]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([IllnessId]) REFERENCES [dbo].[Illness] ([Id]),
    FOREIGN KEY ([CreateBy]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([UpdateBy]) REFERENCES [dbo].[AspNetUsers] ([Id])
);
-- Create table Patient end.

-- Create table DentistClinic.
-- Create by	: Hung-DV
-- Date create	: 10/5/2017
CREATE TABLE [dbo].[DentistClinic] (
    [DentistId] NVARCHAR (128) NULL,
    [ClinicId]  INT            NULL,
    FOREIGN KEY ([DentistId]) REFERENCES [dbo].[Dentist] ([Id]),
    FOREIGN KEY ([ClinicId]) REFERENCES [dbo].[Clinic] ([Id])
);
-- Create table DentistClinic end.

-- Create table MedicalExaminationProcess.
-- Create by	: Hung-DV
-- Date create	: 10/5/2017
CREATE TABLE [dbo].[MedicalExaminationProcess] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [IllnessId]      INT            NULL,
    [Step]           INT            NULL,
    [StepDecription] VARCHAR (MAX)  NULL,
    [CreateDate]     DATETIME       NULL,
    [CreateBy]       NVARCHAR (128) NULL,
    [UpdateDate]     DATETIME       NULL,
    [UpdateBy]       NVARCHAR (128) NULL,
    [Status]         BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([IllnessId]) REFERENCES [dbo].[Illness] ([Id]),
    FOREIGN KEY ([CreateBy]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([UpdateBy]) REFERENCES [dbo].[AspNetUsers] ([Id])
);
-- Create table MedicalExaminationProcess end.

-- Create table MedicalExaminationProcessPlan.
-- Create by	: Hung-DV
-- Date create	: 10/5/2017
CREATE TABLE [dbo].[MedicalExaminationProcessPlan] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [MepId]      INT            NULL,
    [PatientId]  NVARCHAR (128) NULL,
    [ClinicId]   INT            NULL,
    [DentistId]  NVARCHAR (128) NULL,
    [DateTime]   DATETIME       NULL,
    [CreateDate] DATETIME       NULL,
    [CreateBy]   NVARCHAR (128) NULL,
    [UpdateDate] DATETIME       NULL,
    [UpdateBy]   NVARCHAR (128) NULL,
    [Status]     BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([MepId]) REFERENCES [dbo].[MedicalExaminationProcess] ([Id]),
    FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([Id]),
    FOREIGN KEY ([ClinicId]) REFERENCES [dbo].[Clinic] ([Id]),
    FOREIGN KEY ([DentistId]) REFERENCES [dbo].[Dentist] ([Id]),
    FOREIGN KEY ([CreateBy]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([UpdateBy]) REFERENCES [dbo].[AspNetUsers] ([Id])
);
-- Create table MedicalExaminationProcessPlan end.

-- Create table Post.
-- Create by	: Hung-DV
-- Date create	: 10/5/2017
CREATE TABLE [dbo].[Post] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [Title]      VARCHAR (MAX)  NULL,
    [Content]    VARCHAR (MAX)  NULL,
    [CreateDate] DATETIME       NULL,
    [CreateBy]   NVARCHAR (128) NULL,
    [UpdateDate] DATETIME       NULL,
    [UpdateBy]   NVARCHAR (128) NULL,
    [Status]     BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([CreateBy]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([UpdateBy]) REFERENCES [dbo].[AspNetUsers] ([Id])
);
-- Create table Post end.