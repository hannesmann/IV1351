-- This query takes in a year and month and returns the number of lessons booked for that month

-- Count total
SELECT 
	COUNT(lesson.id) 
	FROM lesson 
	LEFT JOIN time_slot ON time_slot.id = lesson.time_slot
	WHERE EXTRACT(YEAR FROM time_slot.date_and_time) = 2022 AND EXTRACT(MONTH FROM time_slot.date_and_time) = 11;

-- Count individually
SELECT 
	COUNT(individual_lesson.lesson_id) AS individual_lessons,
	COUNT(group_lesson.lesson_id) AS group_lessons,
	COUNT(ensemble.lesson_id) AS ensembles
	FROM lesson 
	LEFT JOIN time_slot ON time_slot.id = lesson.time_slot
	LEFT JOIN individual_lesson ON individual_lesson.lesson_id = lesson.id
	LEFT JOIN group_lesson ON group_lesson.lesson_id = lesson.id
	LEFT JOIN ensemble ON ensemble.lesson_id = lesson.id
	WHERE EXTRACT(YEAR FROM time_slot.date_and_time) = 2022 AND EXTRACT(MONTH FROM time_slot.date_and_time) = 11;