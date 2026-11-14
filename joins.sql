-- INNER JOIN Example

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE Marks (
    student_id INT,
    subject VARCHAR(50),
    marks INT
);

INSERT INTO Students VALUES
(1, 'Aman'),
(2, 'Riya'),
(3, 'Kanak');

INSERT INTO Marks VALUES
(1, 'SQL', 85),
(2, 'Python', 90);

SELECT Students.student_name, Marks.subject, Marks.marks
FROM Students
INNER JOIN Marks
ON Students.student_id = Marks.student_id;
