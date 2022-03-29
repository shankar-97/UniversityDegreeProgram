/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Model to work.DM1
 *
 * Date Created : Tuesday, February 22, 2022 09:48:39
 * Target DBMS : Microsoft SQL Server 2019
 */

USE master
go
CREATE DATABASE FinalAlteryxModel
go
USE FinalAlteryxModel
go
/* 
 * TABLE: Dim_Class 
 */

CREATE TABLE Dim_Class(
    Class_ID          smallint    NOT NULL,
    Class_Timing      char(4)     NULL,
    Class_Capacity    smallint    NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (Class_ID)
)

go


IF OBJECT_ID('Dim_Class') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Class >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Class >>>'
go

/* 
 * TABLE: Dim_course 
 */

CREATE TABLE Dim_course(
    Course_ID       float       NOT NULL,
    CourseName      char(23)    NULL,
    Credits         float       NULL,
    Term_Offered    char(6)     NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (Course_ID)
)

go


IF OBJECT_ID('Dim_course') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_course >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_course >>>'
go

/* 
 * TABLE: Dim_department 
 */

CREATE TABLE Dim_department(
    Department_ID     float      NOT NULL,
    DepartmentName    char(4)    NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (Department_ID)
)

go


IF OBJECT_ID('Dim_department') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_department >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_department >>>'
go

/* 
 * TABLE: Dim_professor 
 */

CREATE TABLE Dim_professor(
    prof_id    float          NOT NULL,
    Fname      char(11)       NULL,
    Lname      char(8)        NULL,
    email      varchar(29)    NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (prof_id)
)

go


IF OBJECT_ID('Dim_professor') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_professor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_professor >>>'
go

/* 
 * TABLE: Dim_schedule 
 */

CREATE TABLE Dim_schedule(
    Schedule_ID          float       NOT NULL,
    Course_ID            float       NOT NULL,
    Course_Start_Time    char(7)     NULL,
    Course_End_Time      char(8)     NULL,
    Class_Start_Time     char(8)     NULL,
    Class_End_Time       char(8)     NULL,
    Class_ID             smallint    NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (Schedule_ID)
)

go


IF OBJECT_ID('Dim_schedule') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_schedule >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_schedule >>>'
go

/* 
 * TABLE: Dim_student 
 */

CREATE TABLE Dim_student(
    NUID              smallint       NOT NULL,
    Lname             char(50)       NULL,
    Fname             char(50)       NULL,
    dateofbirth       date           NULL,
    Email             char(50)       NULL,
    ContactNo         float          NULL,
    Country           char(10)       NULL,
    State             char(40)       NULL,
    City              varchar(30)    NULL,
    [Postal Code]     bigint         NULL,
    Region            char(30)       NULL,
    [Apartment No]    bigint         NULL,
    Apartment_Name    char(30)       NULL,
    Status            char(7)        NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (NUID)
)

go


IF OBJECT_ID('Dim_student') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_student >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_student >>>'
go

/* 
 * TABLE: DimTranscripts 
 */

CREATE TABLE DimTranscripts(
    Transcripts_ID       float      NOT NULL,
    CourseName           char(4)    NULL,
    Credits              float      NULL,
    GPA                  float      NULL,
    Transcripts_Total    float      NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (Transcripts_ID)
)

go


IF OBJECT_ID('DimTranscripts') IS NOT NULL
    PRINT '<<< CREATED TABLE DimTranscripts >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimTranscripts >>>'
go

/* 
 * TABLE: Fact_table 
 */

CREATE TABLE Fact_table(
    Class_ID          smallint    NOT NULL,
    Course_ID         float       NOT NULL,
    Department_ID     float       NOT NULL,
    prof_id           float       NOT NULL,
    Schedule_ID       float       NOT NULL,
    NUID              smallint    NOT NULL,
    Transcripts_ID    float       NOT NULL
)

go


IF OBJECT_ID('Fact_table') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_table >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_table >>>'
go

/* 
 * TABLE: Dim_schedule 
 */

ALTER TABLE Dim_schedule ADD CONSTRAINT RefDim_course9 
    FOREIGN KEY (Course_ID)
    REFERENCES Dim_course(Course_ID)
go

ALTER TABLE Dim_schedule ADD CONSTRAINT RefDim_Class10 
    FOREIGN KEY (Class_ID)
    REFERENCES Dim_Class(Class_ID)
go


/* 
 * TABLE: Fact_table 
 */

ALTER TABLE Fact_table ADD CONSTRAINT RefDim_student2 
    FOREIGN KEY (NUID)
    REFERENCES Dim_student(NUID)
go

ALTER TABLE Fact_table ADD CONSTRAINT RefDim_schedule3 
    FOREIGN KEY (Schedule_ID)
    REFERENCES Dim_schedule(Schedule_ID)
go

ALTER TABLE Fact_table ADD CONSTRAINT RefDimTranscripts4 
    FOREIGN KEY (Transcripts_ID)
    REFERENCES DimTranscripts(Transcripts_ID)
go

ALTER TABLE Fact_table ADD CONSTRAINT RefDim_Class5 
    FOREIGN KEY (Class_ID)
    REFERENCES Dim_Class(Class_ID)
go

ALTER TABLE Fact_table ADD CONSTRAINT RefDim_course6 
    FOREIGN KEY (Course_ID)
    REFERENCES Dim_course(Course_ID)
go

ALTER TABLE Fact_table ADD CONSTRAINT RefDim_department7 
    FOREIGN KEY (Department_ID)
    REFERENCES Dim_department(Department_ID)
go

ALTER TABLE Fact_table ADD CONSTRAINT RefDim_professor8 
    FOREIGN KEY (prof_id)
    REFERENCES Dim_professor(prof_id)
go


