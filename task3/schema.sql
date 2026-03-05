-- =====================================================
-- College Club Membership Database - Complete SQL Script
-- MySQL 8.0+ Compatible | Ready for Docker MySQL Container
-- Student: Subodh Pandey (ID: 250608)
-- Module: ST4015CMD - Database Normalisation Assignment
-- =====================================================

-- Drop existing tables to make script re-runnable
DROP TABLE IF EXISTS Membership_3NF;
DROP TABLE IF EXISTS Club_3NF;
DROP TABLE IF EXISTS Membership_2NF;
DROP TABLE IF EXISTS Club_2NF;
DROP TABLE IF EXISTS Student_2NF;
DROP TABLE IF EXISTS ClubMembership_1NF;
DROP TABLE IF EXISTS ClubMembership;

-- =====================================================
-- 1. Original Unnormalised Table
-- =====================================================
CREATE TABLE ClubMembership (
    StudentID     INT,
    StudentName   VARCHAR(100),
    Email         VARCHAR(100),
    ClubName      VARCHAR(100),
    ClubRoom      VARCHAR(50),
    ClubMentor    VARCHAR(100),
    JoinDate      DATE,
    PRIMARY KEY (StudentID, ClubName)   -- Temporary for creation
) ENGINE=InnoDB;

-- Insert sample data (dates converted to YYYY-MM-DD)
INSERT INTO ClubMembership (StudentID, StudentName, Email, ClubName, ClubRoom, ClubMentor, JoinDate) VALUES
(1, 'Asha',   'asha@email.com',   'Music Club',  'R101', 'Mr. Raman', '2024-01-10'),
(2, 'Bikash', 'bikash@email.com', 'Sports Club', 'R202', 'Ms. Sita',  '2024-01-12'),
(1, 'Asha',   'asha@email.com',   'Sports Club', 'R202', 'Ms. Sita',  '2024-01-15'),
(3, 'Nisha',  'nisha@email.com',  'Music Club',  'R101', 'Mr. Raman', '2024-01-20'),
(4, 'Rohan',  'rohan@email.com',  'Drama Club',  'R303', 'Mr. Kiran', '2024-01-18'),
(5, 'Suman',  'suman@email.com',  'Music Club',  'R101', 'Mr. Raman', '2024-01-22'),
(2, 'Bikash', 'bikash@email.com', 'Drama Club',  'R303', 'Mr. Kiran', '2024-01-25'),
(6, 'Pooja',  'pooja@email.com',  'Sports Club', 'R202', 'Ms. Sita',  '2024-01-27'),
(3, 'Nisha',  'nisha@email.com',  'Coding Club', 'Lab1', 'Mr. Anil',  '2024-01-28'),
(7, 'Aman',   'aman@email.com',   'Coding Club', 'Lab1', 'Mr. Anil',  '2024-01-30');

-- =====================================================
-- 2. 1NF Table - Composite Primary Key (StudentID, ClubName)
-- =====================================================
CREATE TABLE ClubMembership_1NF (
    StudentID     INT,
    StudentName   VARCHAR(100),
    Email         VARCHAR(100),
    ClubName      VARCHAR(100),
    ClubRoom      VARCHAR(50),
    ClubMentor    VARCHAR(100),
    JoinDate      DATE,
    PRIMARY KEY (StudentID, ClubName)
) ENGINE=InnoDB;

-- Insert same data into 1NF
INSERT INTO ClubMembership_1NF
SELECT * FROM ClubMembership;

-- =====================================================
-- 3. 2NF Tables
-- =====================================================

-- 3.1 Student_2NF
CREATE TABLE Student_2NF (
    StudentID   INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email       VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

INSERT INTO Student_2NF (StudentID, StudentName, Email) VALUES
(1, 'Asha',   'asha@email.com'),
(2, 'Bikash', 'bikash@email.com'),
(3, 'Nisha',  'nisha@email.com'),
(4, 'Rohan',  'rohan@email.com'),
(5, 'Suman',  'suman@email.com'),
(6, 'Pooja',  'pooja@email.com'),
(7, 'Aman',   'aman@email.com');

-- 3.2 Club_2NF (ClubName as PK)
CREATE TABLE Club_2NF (
    ClubName    VARCHAR(100) PRIMARY KEY,
    ClubRoom    VARCHAR(50)  NOT NULL,
    ClubMentor  VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

INSERT INTO Club_2NF (ClubName, ClubRoom, ClubMentor) VALUES
('Music Club',  'R101', 'Mr. Raman'),
('Sports Club', 'R202', 'Ms. Sita'),
('Drama Club',  'R303', 'Mr. Kiran'),
('Coding Club', 'Lab1', 'Mr. Anil');

-- 3.3 Membership_2NF
CREATE TABLE Membership_2NF (
    StudentID  INT,
    ClubName   VARCHAR(100),
    JoinDate   DATE NOT NULL,
    PRIMARY KEY (StudentID, ClubName),
    FOREIGN KEY (StudentID) REFERENCES Student_2NF(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (ClubName)  REFERENCES Club_2NF(ClubName)     ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO Membership_2NF (StudentID, ClubName, JoinDate) VALUES
(1, 'Music Club',  '2024-01-10'),
(2, 'Sports Club', '2024-01-12'),
(1, 'Sports Club', '2024-01-15'),
(3, 'Music Club',  '2024-01-20'),
(4, 'Drama Club',  '2024-01-18'),
(5, 'Music Club',  '2024-01-22'),
(2, 'Drama Club',  '2024-01-25'),
(6, 'Sports Club', '2024-01-27'),
(3, 'Coding Club', '2024-01-28'),
(7, 'Coding Club', '2024-01-30');

-- =====================================================
-- 4. 3NF Tables (Club with surrogate ClubID)
-- =====================================================

-- 4.1 Club_3NF - ClubID is primary key (varchar as per assignment example)
CREATE TABLE Club_3NF (
    ClubID      VARCHAR(10)  PRIMARY KEY,
    ClubName    VARCHAR(100) NOT NULL UNIQUE,
    ClubRoom    VARCHAR(50)  NOT NULL,
    ClubMentor  VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Insert clubs with assigned ClubIDs
INSERT INTO Club_3NF (ClubID, ClubName, ClubRoom, ClubMentor) VALUES
('C01', 'Music Club',  'R101', 'Mr. Raman'),
('C02', 'Sports Club', 'R202', 'Ms. Sita'),
('C03', 'Drama Club',  'R303', 'Mr. Kiran'),
('C04', 'Coding Club', 'Lab1', 'Mr. Anil');

-- 4.2 Membership_3NF - uses ClubID instead of ClubName
CREATE TABLE Membership_3NF (
    StudentID  INT,
    ClubID     VARCHAR(10),
    JoinDate   DATE NOT NULL,
    PRIMARY KEY (StudentID, ClubID),
    FOREIGN KEY (StudentID) REFERENCES Student_2NF(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (ClubID)    REFERENCES Club_3NF(ClubID)       ON DELETE CASCADE
) ENGINE=InnoDB;

-- Insert membership data using ClubIDs
INSERT INTO Membership_3NF (StudentID, ClubID, JoinDate) VALUES
(1, 'C01', '2024-01-10'),   -- Asha - Music
(2, 'C02', '2024-01-12'),   -- Bikash - Sports
(1, 'C02', '2024-01-15'),   -- Asha - Sports
(3, 'C01', '2024-01-20'),   -- Nisha - Music
(4, 'C03', '2024-01-18'),   -- Rohan - Drama
(5, 'C01', '2024-01-22'),   -- Suman - Music
(2, 'C03', '2024-01-25'),   -- Bikash - Drama
(6, 'C02', '2024-01-27'),   -- Pooja - Sports
(3, 'C04', '2024-01-28'),   -- Nisha - Coding
(7, 'C04', '2024-01-30');   -- Aman - Coding

-- =====================================================
-- 5. Additional Inserts as per Assignment
-- =====================================================

-- Insert new student into Student_2NF (remains same in 3NF)
INSERT INTO Student_2NF (StudentID, StudentName, Email)
VALUES (8, 'Priya', 'priya@email.com');

-- Insert new club into Club_3NF
INSERT INTO Club_3NF (ClubID, ClubName, ClubRoom, ClubMentor)
VALUES ('C05', 'Art Club', 'R404', 'Ms. Lata');

-- =====================================================
-- 6. SELECT Queries
-- =====================================================

-- SELECT all students from Student_2NF
SELECT * FROM Student_2NF ORDER BY StudentID;

-- SELECT all clubs from Club_3NF
SELECT * FROM Club_3NF ORDER BY ClubID;

-- JOIN query: StudentName, ClubName, JoinDate
SELECT 
    s.StudentName,
    c.ClubName,
    m.JoinDate
FROM Membership_3NF m
INNER JOIN Student_2NF s  ON m.StudentID = s.StudentID
INNER JOIN Club_3NF c     ON m.ClubID    = c.ClubID
ORDER BY m.JoinDate;

-- =====================================================
-- End of Script
-- =====================================================