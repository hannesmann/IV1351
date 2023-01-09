-- This query counts lessons for every instructor

DROP VIEW IF EXISTS lessons_this_month_for_instructors CASCADE;

CREATE VIEW lessons_this_month_for_instructors AS 
	SELECT 
		instructor.person_id AS instructor_id, COUNT(lesson.id) AS lessons_this_month
		FROM booked_lessons

		LEFT JOIN lesson ON lesson.id = booked_lessons.lesson_id 
		LEFT JOIN instructor ON instructor.person_id = booked_lessons.person_id
		LEFT JOIN time_slot ON time_slot.id = lesson.time_slot

		WHERE 
			-- There are many rows in booked_lessons where a student has booked a lesson, ignore these 
			instructor.person_id IS NOT NULL AND
			-- Pretend the month is November since this is the only month we have data for
		    EXTRACT(MONTH FROM time_slot.date_and_time) = 11
			-- Real implementation 
			-- EXTRACT(MONTH FROM time_slot.date_and_time) = EXTRACT(MONTH FROM CURRENT_DATE)

		GROUP BY instructor.person_id
		ORDER BY instructor.person_id;

-- The values here don't really make sense but for the example data more than one lesson every month counts as "overworked"
SELECT instructor_id AS instructors_ok FROM lessons_this_month_for_instructors WHERE lessons_this_month < 2;
SELECT instructor_id AS instructors_overworked FROM lessons_this_month_for_instructors WHERE lessons_this_month >= 2;