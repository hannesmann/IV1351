CREATE TYPE SKILLLEVEL AS ENUM ('beginner', 'intermediate', 'advanced');
CREATE TYPE LESSONTYPE AS ENUM ('individual', 'group', 'ensemble');

CREATE TABLE instrument (
 id SERIAL NOT NULL,
 type VARCHAR(100) NOT NULL,
 brand VARCHAR(100) NOT NULL,
 rent_fee NUMERIC,
 rent_start TIMESTAMP,
 rent_end TIMESTAMP
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (id);


CREATE TABLE person (
 id SERIAL NOT NULL,
 personal_number CHAR(12) NOT NULL,
 name VARCHAR(1000) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE pricing (
 lesson_type LESSONTYPE NOT NULL,
 skill_level SKILLLEVEL NOT NULL,
 price NUMERIC NOT NULL
);

ALTER TABLE pricing ADD CONSTRAINT PK_pricing PRIMARY KEY (lesson_type,skill_level);


CREATE TABLE student (
 person_id SERIAL NOT NULL,
 current_skill_level SKILLLEVEL NOT NULL,
 outstanding_balance NUMERIC NOT NULL,
 instrument_a_id SERIAL,
 instrument_b_id SERIAL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (person_id);


CREATE TABLE time_slot (
 id SERIAL NOT NULL,
 date_and_time TIMESTAMP NOT NULL
);

ALTER TABLE time_slot ADD CONSTRAINT PK_time_slot PRIMARY KEY (id);


CREATE TABLE contact_details (
 person_id SERIAL NOT NULL,
 email VARCHAR(1000),
 address VARCHAR(1000) NOT NULL
);

ALTER TABLE contact_details ADD CONSTRAINT PK_contact_details PRIMARY KEY (person_id);


CREATE TABLE contact_person (
 student_id SERIAL NOT NULL,
 contact_person_id SERIAL NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (student_id,contact_person_id);


CREATE TABLE instructor (
 person_id SERIAL NOT NULL,
 coming_payment NUMERIC NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (person_id);


CREATE TABLE known_instruments (
 person_id SERIAL NOT NULL,
 instrument VARCHAR(100) NOT NULL
);

ALTER TABLE known_instruments ADD CONSTRAINT PK_known_instruments PRIMARY KEY (person_id,instrument);


CREATE TABLE lesson (
 id SERIAL NOT NULL,
 cost NUMERIC NOT NULL,
 place VARCHAR(100) NOT NULL,
 time_slot SERIAL NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);


CREATE TABLE phone (
 person_id SERIAL NOT NULL,
 number VARCHAR(100) NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (person_id,number);


CREATE TABLE relationship (
 student_id SERIAL NOT NULL,
 sibling_id SERIAL NOT NULL
);

ALTER TABLE relationship ADD CONSTRAINT PK_relationship PRIMARY KEY (student_id,sibling_id);


CREATE TABLE booked_lessons (
 person_id SERIAL NOT NULL,
 lesson_id SERIAL NOT NULL
);

ALTER TABLE booked_lessons ADD CONSTRAINT PK_booked_lessons PRIMARY KEY (person_id,lesson_id);


CREATE TABLE ensemble (
 lesson_id SERIAL NOT NULL,
 min_students INT NOT NULL,
 max_students INT NOT NULL,
 genre VARCHAR(100) NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (lesson_id);


CREATE TABLE group_lesson (
 lesson_id SERIAL NOT NULL,
 min_students INT NOT NULL,
 skill_level SKILLLEVEL NOT NULL,
 instrument VARCHAR(100) NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_id);


CREATE TABLE individual_lesson (
 lesson_id SERIAL NOT NULL,
 skill_level SKILLLEVEL NOT NULL,
 instrument VARCHAR(100) NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (lesson_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE student ADD CONSTRAINT FK_student_1 FOREIGN KEY (instrument_a_id) REFERENCES instrument (id);
ALTER TABLE student ADD CONSTRAINT FK_student_2 FOREIGN KEY (instrument_b_id) REFERENCES instrument (id);


ALTER TABLE contact_details ADD CONSTRAINT FK_contact_details_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (student_id) REFERENCES student (person_id);
ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_1 FOREIGN KEY (contact_person_id) REFERENCES person (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE known_instruments ADD CONSTRAINT FK_known_instruments_0 FOREIGN KEY (person_id) REFERENCES instructor (person_id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (time_slot) REFERENCES time_slot (id);


ALTER TABLE phone ADD CONSTRAINT FK_phone_0 FOREIGN KEY (person_id) REFERENCES contact_details (person_id);


ALTER TABLE relationship ADD CONSTRAINT FK_relationship_0 FOREIGN KEY (sibling_id) REFERENCES person (id);
ALTER TABLE relationship ADD CONSTRAINT FK_relationship_1 FOREIGN KEY (student_id) REFERENCES student (person_id);


ALTER TABLE booked_lessons ADD CONSTRAINT FK_booked_lessons_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE booked_lessons ADD CONSTRAINT FK_booked_lessons_1 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


