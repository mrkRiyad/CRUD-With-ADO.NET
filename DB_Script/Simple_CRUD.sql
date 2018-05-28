CREATE DATABASE Simple_CRUD
GO
USE Simple_CRUD
GO
CREATE TABLE Students (
    StudentID INT IDENTITY,
    Name VARCHAR(25) NOT NULL,
    Email VARCHAR(25) NOT NULL,
    Phone VARCHAR(11) NOT NULL,
    Subject VARCHAR(25) NOT NULL,
    SessionYear INT NOT NULL,
    PRIMARY KEY (StudentID)
)
GO
/* Dummy Data */
INSERT INTO Students VALUES
('Ragnar Lethbrock', 'ragnar@gmail.com', '01374563214', 'JavaScript', 2018 ),
('Ivor Floki', 'floki@gamil.com', '01285463214', 'Python', 2016),
('Usain Rollo', 'rollo@gmail.com', '01436578421', 'Elixer', 2017)
GO
SELECT * FROM Students