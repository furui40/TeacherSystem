
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(50) NOT NULL,
    UserType ENUM('Teacher', 'Student','Admin') NOT NULL
);


CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT UNIQUE NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Profession VARCHAR(20),
    Bio TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

CREATE TABLE Research (
    ResearchID INT PRIMARY KEY AUTO_INCREMENT,
    TeacherID INT NOT NULL,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    Date DATE,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT NOT NULL,
    TeacherID INT NOT NULL,
    Date DATE,
    Place VARCHAR(255) NOT NULL,
    AppointmentTime ENUM('morning', 'afternoon', 'evening') NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES students(StudentID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    TeacherID INT NOT NULL,
    Date DATE,
    TimeSlot VARCHAR(100),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

