USE master
GO
IF EXISTS(select * from sys.databases where name='Simple_CRUD')
DROP DATABASE Simple_CRUD
GO
CREATE DATABASE Simple_CRUD
GO
USE Simple_CRUD
GO
CREATE TABLE Students (
    StudentID INT IDENTITY,
    Name VARCHAR(25) NOT NULL, --require --custom
    Email VARCHAR(25) NULL, --compare --regex
    ReEmail VARCHAR(25) NULL, --compare
    Age INT NULL, --range
    PRIMARY KEY (StudentID)
)
GO
/* Dummy Data */
INSERT INTO Students VALUES
('RAGNAR', 'ragnar@gmail.com', 'ragnar@gmail.com', 25 ),
('FLOKI', 'floki@gamil.com', 'floki@gamil.com', 30),
('BJON', 'bjon@gmail.com', 'bjon@gmail.com', 28)
GO
SELECT * FROM Students
