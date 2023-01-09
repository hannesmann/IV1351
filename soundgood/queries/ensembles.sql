-- This query shows ensembles during the next week
-- ensemble_overview_next_week only needs to be updated once a week

DROP MATERIALIZED VIEW IF EXISTS ensemble_overview_next_week CASCADE;

CREATE VIEW ensembles_next_week AS 
	SELECT 
		ensemble.*,
		EXTRACT(DAY from time_slot.date_and_time) + 1 as week_day,
		TO_CHAR(time_slot.date_and_time, 'Dy') as week_day_str
	FROM ensemble

	LEFT JOIN lesson ON lesson.id = ensemble.lesson_id
	LEFT JOIN time_slot ON lesson.time_slot = time_slot.id

	-- Pretend the week is 43 since this is the only month we have data for
	WHERE (EXTRACT(WEEK FROM time_slot.date_and_time) - 43) = 1;
	-- Real implementation 
	-- WHERE (EXTRACT(WEEK FROM time_slot.date_and_time) - EXTRACT(WEEK FROM CURRENT_DATE)) = 1;

CREATE VIEW ensembles_students AS 
	SELECT ensembles_next_week.lesson_id, COUNT(booked_lessons.person_id) as attending
	FROM ensembles_next_week

	LEFT JOIN booked_lessons ON booked_lessons.lesson_id = ensembles_next_week.lesson_id
	GROUP BY ensembles_next_week.lesson_id;

CREATE MATERIALIZED VIEW ensemble_overview_next_week AS
	SELECT 
		ensembles_sum.lesson_id,
		ensembles_sum.genre,
		ensembles_sum.week_day_str as week_day,

		ensembles_sum.min_students,
		ensembles_sum.max_students,
		ensembles_sum.attending,

		CASE 
			WHEN (ensembles_sum.max_students = ensembles_sum.attending) THEN 'Full'
			WHEN (ensembles_sum.max_students - ensembles_sum.attending <= 2) THEN '1-2 seats left'
			ELSE 'Several seats left'
		END status

		FROM (
			SELECT 
				ensembles_next_week.lesson_id as lesson_id,
				ensembles_next_week.min_students as min_students,
				ensembles_next_week.max_students as max_students,
				ensembles_next_week.genre as genre,
				ensembles_students.attending as attending,
				ensembles_next_week.week_day as week_day,
				ensembles_next_week.week_day_str as week_day_str

			FROM ensembles_next_week
			LEFT JOIN ensembles_students ON ensembles_students.lesson_id = ensembles_next_week.lesson_id
		) as ensembles_sum

		ORDER BY ensembles_sum.genre, ensembles_sum.week_day;