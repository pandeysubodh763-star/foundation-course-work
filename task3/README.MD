-- =====================================================
-- SQL Normalisation Scripts for College Club Membership
-- As per ST4015CMD Assignment - Section 4
-- Subodh Pandey, Student ID: 250608
-- March 2026
-- =====================================================

-- Clean up previous runs
DROP TABLE IF EXISTS Membership_3NF;
DROP TABLE IF EXISTS Club_3NF;
DROP TABLE IF EXISTS Membership_2NF;
DROP TABLE IF EXISTS Club_2NF;
DROP TABLE IF EXISTS Student_2NF;
DROP TABLE IF EXISTS ClubMembership_1NF;
DROP TABLE IF EXISTS ClubMembership;

-- =====================================================
-- 1. Original Unnormalised Table (Figure 8)
-- =====================================================
CREATE TABLE ClubMembership (
    StudentID     INT,
    StudentName   VARCHAR(100),
    Email         VARCHAR(100),
    ClubName      VARCHAR(100),
    ClubRoom      VARCHAR(50),
    ClubMentor    VARCHAR(100),
    JoinDate      DATE
) ENGINE=InnoDB;

INSERT INTO ClubMembership VALUES
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
-- 2. 1NF Table (Figure 9)
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

INSERT INTO ClubMembership_1NF SELECT * FROM ClubMembership;

-- =====================================================
-- 3. 2NF Tables (Figure 10)
-- =====================================================
CREATE TABLE Student_2NF (
    StudentID   INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email       VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

INSERT INTO Student_2NF VALUES
(1,'Asha','asha@email.com'),(2,'Bikash','bikash@email.com'),
(3,'Nisha','nisha@email.com'),(4,'Rohan','rohan@email.com'),
(5,'Suman','suman@email.com'),(6,'Pooja','pooja@email.com'),
(7,'Aman','aman@email.com');

CREATE TABLE Club_2NF (
    ClubName    VARCHAR(100) PRIMARY KEY,
    ClubRoom    VARCHAR(50) NOT NULL,
    ClubMentor  VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

INSERT INTO Club_2NF VALUES
('Music Club','R101','Mr. Raman'),
('Sports Club','R202','Ms. Sita'),
('Drama Club','R303','Mr. Kiran'),
('Coding Club','Lab1','Mr. Anil');

CREATE TABLE Membership_2NF (
    StudentID INT,
    ClubName  VARCHAR(100),
    JoinDate  DATE NOT NULL,
    PRIMARY KEY (StudentID, ClubName),
    FOREIGN KEY (StudentID) REFERENCES Student_2NF(StudentID),
    FOREIGN KEY (ClubName)  REFERENCES Club_2NF(ClubName)
) ENGINE=InnoDB;

INSERT INTO Membership_2NF VALUES
(1,'Music Club','2024-01-10'),(2,'Sports Club','2024-01-12'),
(1,'Sports Club','2024-01-15'),(3,'Music Club','2024-01-20'),
(4,'Drama Club','2024-01-18'),(5,'Music Club','2024-01-22'),
(2,'Drama Club','2024-01-25'),(6,'Sports Club','2024-01-27'),
(3,'Coding Club','2024-01-28'),(7,'Coding Club','2024-01-30');

-- =====================================================
-- 4. 3NF Tables (with ClubID surrogate key)
-- =====================================================
CREATE TABLE Club_3NF (
    ClubID      VARCHAR(10) PRIMARY KEY,
    ClubName    VARCHAR(100) NOT NULL UNIQUE,
    ClubRoom    VARCHAR(50) NOT NULL,
    ClubMentor  VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

INSERT INTO Club_3NF VALUES
('C01','Music Club','R101','Mr. Raman'),
('C02','Sports Club','R202','Ms. Sita'),
('C03','Drama Club','R303','Mr. Kiran'),
('C04','Coding Club','Lab1','Mr. Anil');

CREATE TABLE Membership_3NF (
    StudentID INT,
    ClubID    VARCHAR(10),
    JoinDate  DATE NOT NULL,
    PRIMARY KEY (StudentID, ClubID),
    FOREIGN KEY (StudentID) REFERENCES Student_2NF(StudentID),
    FOREIGN KEY (ClubID)    REFERENCES Club_3NF(ClubID)
) ENGINE=InnoDB;

INSERT INTO Membership_3NF VALUES
(1,'C01','2024-01-10'),(2,'C02','2024-01-12'),(1,'C02','2024-01-15'),
(3,'C01','2024-01-20'),(4,'C03','2024-01-18'),(5,'C01','2024-01-22'),
(2,'C03','2024-01-25'),(6,'C02','2024-01-27'),(3,'C04','2024-01-28'),
(7,'C04','2024-01-30');

-- =====================================================
-- 5. Additional Inserts (exactly as in your PDF page 19)
-- =====================================================
INSERT INTO Student_2NF VALUES (8, 'Priya', 'priya@email.com');

INSERT INTO Club_3NF VALUES ('C05', 'Art Club', 'R404', 'Ms. Lata');

-- =====================================================
-- 6. SELECT Queries (exactly as shown in PDF page 19-21)
-- =====================================================

-- SELECT all students
SELECT * FROM Student_2NF ORDER BY StudentID;

-- SELECT all clubs
SELECT * FROM Club_3NF ORDER BY ClubID;

-- JOIN query (StudentName, ClubName, JoinDate)
SELECT 
    s.StudentName,
    c.ClubName,
    m.JoinDate
FROM Membership_3NF m
INNER JOIN Student_2NF s ON m.StudentID = s.StudentID
INNER JOIN Club_3NF c    ON m.ClubID    = c.ClubID
ORDER BY m.JoinDate;

-- =====================================================
-- END OF SCRIPT
-- =====================================================