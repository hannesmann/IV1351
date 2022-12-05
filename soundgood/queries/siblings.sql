-- This query counts the number of siblings for all students and groups them
-- Operates on "duplicate" rows (so student X is related to Y and student Y is related to X)

-- Cache siblings counts for every student
CREATE MATERIALIZED VIEW sibling_counts_for_students AS 
	SELECT student.person_id, COUNT(relationship.student_id)
	FROM student
	LEFT JOIN relationship ON student.person_id = relationship.student_id
	GROUP BY student.person_id;

-- Arbitrary number (change X)
SELECT COUNT(person_id) AS students_with_x_siblings FROM sibling_counts_for_students WHERE count = X;

-- Table with 0/1/2+ cases
SELECT COUNT(person_id) AS students_with_no_siblings FROM sibling_counts_for_students WHERE count = 0;
SELECT COUNT(person_id) AS students_with_one_sibling FROM sibling_counts_for_students WHERE count = 1;
SELECT COUNT(person_id) AS students_with_two_or_more_siblings FROM sibling_counts_for_students WHERE count > 1;