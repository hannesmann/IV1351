-- This query shows ensembles during the next week

CREATE VIEW ensembles_week AS 
	SELECT ensemble.* 
	FROM ensemble

	LEFT JOIN lesson ON lesson.id = ensemble.lesson_id
	LEFT JOIN time_slot ON lesson.time_slot = time_slot.id

	-- Pretend the week is 43 since this is the only month we have data for
	WHERE (EXTRACT(WEEK FROM time_slot.date_and_time) - 43) = 1;
	-- Real implementation 
	-- WHERE (EXTRACT(WEEK FROM time_slot.date_and_time) - EXTRACT(WEEK FROM CURRENT_DATE)) = 1;

CREATE VIEW ensembles_students AS 
	SELECT ensembles_week.lesson_id, COUNT(booked_lessons.person_id) as attending
	FROM ensembles_week

	LEFT JOIN booked_lessons ON booked_lessons.lesson_id = ensembles_week.lesson_id
	GROUP BY ensembles_week.lesson_id;

SELECT 
	*,
	(ensembles_sum.max_students = ensembles_sum.attending) AS full,
	(ensembles_sum.max_students - ensembles_sum.attending <= 2) AS soon_full

	FROM (
		SELECT *
		FROM ensembles_week
		LEFT JOIN ensembles_students ON ensembles_students.lesson_id = ensembles_week.lesson_id
	) as ensembles_sum;