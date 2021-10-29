create database if not exists `student_profile`;
USE `student_profile`;

DROP TABLE achievement;
DROP TABLE achievement_types;

-- Table: achievement
CREATE TABLE achievement (
    achievement_id int NOT NULL AUTO_INCREMENT,
    student_id varchar(16) NULL,
    achievement_type int NULL,
    title varchar(100) NOT NULL,
    proof_date date NOT NULL,
    proof_file blob NULL,
    CONSTRAINT achievement_pk PRIMARY KEY (achievement_id)
);

-- Table: achievement_types
CREATE TABLE achievement_types (
    achievement_type_id int not NULL AUTO_INCREMENT,
    achievement_type_description varchar(20) NOT NULL,
    CONSTRAINT achievement_types_pk PRIMARY KEY (achievement_type_id)
);

-- Reference: achievement_types_constrain (table: achievement)
ALTER TABLE achievement ADD CONSTRAINT achievement_types_constrain FOREIGN KEY achievement_types_constrain (achievement_type)
    REFERENCES achievement_types (achievement_type_id)
    ON DELETE SET NULL
    ON UPDATE SET NULL;

ALTER TABLE achievement ADD CONSTRAINT achievement_student_constrain FOREIGN KEY achievement_student_constrain (student_id)
    REFERENCES student (roll_number)
    ON DELETE SET NULL
    ON UPDATE SET NULL;


-- dummy data
INSERT INTO achievement_types (achievement_type_description)
VALUES
("Academics"),
("Co-Curricular"),
("Sports");

SELECT * FROM achievement_types;

INSERT INTO achievement (student_id, achievement_type, title, proof_date)
VALUES
("CB.EN.U4CSE17001", 1, "Published Paper", "2021-12-01"),
("CB.EN.U4CSE17002", 2, "CodeChef", "2021-11-27"),
("CB.EN.U4CSE17003", 3, "Cricket", "2001-08-01"),
("CB.EN.U4CSE17001", 1, "Arduino Project", "2065-11-21"),
("CB.EN.U4CSE17001", 3, "Chess", "2004-04-01");

SELECT * FROM achievement;
