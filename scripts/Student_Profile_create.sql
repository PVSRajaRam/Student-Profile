drop database if exists student_profile;
create database if not exists student_profile;
use student_profile;

-- Table: login
CREATE TABLE login (
    email varchar(100) NOT NULL,
    password varchar(100) NOT NULL,
    is_admin bit NOT NULL,
    admin_type varchar(100),
    CONSTRAINT login_pk PRIMARY KEY (email)
);

-- Table: department
CREATE TABLE department (
    dept_id int NOT NULL AUTO_INCREMENT,
    dept_code varchar(10) NOT NULL,
    dept_name varchar(50) NOT NULL,
    CONSTRAINT department_pk PRIMARY KEY (dept_id)
);
-- dummy data
INSERT INTO department (dept_code, dept_name)
VALUES
("CSE", "Computer Science Engineering"),
("MATH", "Mathematics"),
("MECH", "Mechanical Engineering"),
("CIVIL", "Civil Engineering"),
("CHEM", "Chemical Engineering"),
("ECE", "Electronics and Communication Engineering");

-- Table: student
CREATE TABLE student (
    roll_number varchar(16) NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    personal_email varchar(50) NOT NULL,
    phone varchar(15) NOT NULL,
    achievement_achievement_id int NOT NULL,
    gender char(1) NOT NULL,
    dob date NOT NULL,
    nationality varchar(20) NOT NULL,
    native_state varchar(20) NOT NULL,
    mother_tongue varchar(20) NOT NULL,
    country_of_residence varchar(20) NOT NULL,
    aadhar_no varchar(12) NOT NULL,
    address varchar(100) NOT NULL,
    picture_fpath varchar(100) NOT NULL,
    dept_fk int NULL,
    UNIQUE INDEX student_unique_cols (email,personal_email,phone,aadhar_no),
    CONSTRAINT student_pk PRIMARY KEY (roll_number)
);

-- Table: academic_history
CREATE TABLE academic_history (
    roll_number varchar(16) NOT NULL,
    qualification varchar(10) NOT NULL,
    board varchar(50) NOT NULL,
    institution varchar(100) NOT NULL,
    no_of_attempts int NOT NULL,
    score float(6,2) NOT NULL,
    proof_fpath varchar(100) NOT NULL,
    CONSTRAINT academic_history_pk PRIMARY KEY (roll_number,qualification)
);

-- Table: dayscholar
CREATE TABLE dayscholar (
    roll_number varchar(16) NOT NULL,
    route varchar(20) NOT NULL,
    boarding_point varchar(50) NULL,
    CONSTRAINT dayscholar_pk PRIMARY KEY (roll_number)
);

-- Table: disciplinary_actions
CREATE TABLE disciplinary_actions (
    id int NOT NULL AUTO_INCREMENT,
    roll_number varchar(16) NOT NULL,
    report_date date NOT NULL,
    report_time time NOT NULL,
    place varchar(20) NOT NULL,
    category varchar(20) NOT NULL,
    notice_till date NOT NULL,
    reporting_authority varchar(30) NOT NULL,
    details varchar(100) NOT NULL,
    action varchar(100) NOT NULL,
    CONSTRAINT disciplinary_actions_pk PRIMARY KEY (id)
);

-- Table: enrollment
CREATE TABLE enrollment (
    roll_number varchar(16) NOT NULL,
    enrollment_number varchar(20) NOT NULL,
    admitted_campus varchar(20) NOT NULL,
    program varchar(10) NOT NULL,
    branch varchar(20) NOT NULL,
    joining_year int NOT NULL,
    section char(1) NOT NULL,
    current_year int NOT NULL,
    current_sem int NOT NULL,
    classadvisor_name varchar(20) NOT NULL,
    classadvisor_phone varchar(10) NOT NULL,
    enrollment_date date NOT NULL,
    enrollment_status varchar(20) NOT NULL,
    qualifying_exam varchar(20) NOT NULL,
    qualifying_exam_state varchar(20) NOT NULL,
    admission_type varchar(20) NOT NULL,
    scholarship varchar(50) NULL,
    CONSTRAINT enrollment_pk PRIMARY KEY (roll_number)
);

-- Table: health
CREATE TABLE health (
    roll_number varchar(16) NOT NULL,
    blood_group varchar(5) NOT NULL,
    allergies varchar(50) NULL,
    remarks varchar(50) NULL,
    CONSTRAINT health_pk PRIMARY KEY (roll_number)
);

-- Table: hostelite
CREATE TABLE hostelite (
    roll_number varchar(16) NOT NULL,
    hostel_name varchar(50) NOT NULL,
    block varchar(10) NOT NULL,
    room int NOT NULL,
    in_campus bool NOT NULL,
    CONSTRAINT hostelite_pk PRIMARY KEY (roll_number)
);

-- Table: parent
CREATE TABLE parent (
    roll_number varchar(16) NOT NULL,
    relation varchar(20) NOT NULL,
    name varchar(50) NOT NULL,
    office_phone varchar(10) NULL,
    email varchar(50) NOT NULL,
    occupation varchar(20) NOT NULL,
    office_address varchar(100) NULL,
    annual_income int NOT NULL,
    primary_contact bool NOT NULL,
    CONSTRAINT parent_pk PRIMARY KEY (roll_number,relation)
);

-- Table: Payment_history
CREATE TABLE if not exists Payment_history (
    txn_number varchar(100) NOT NULL,
    bank varchar(100) NOT NULL,
    roll_number varchar(16) NOT NULL,
    txn_date date NOT NULL,
    txn_purpose varchar(100) NOT NULL,
    txn_amount float(10,2) NOT NULL,
    receipt_no int NULL,
    staff varchar(100) NULL,
    payment_mode varchar(100) NOT NULL,
    file_path varchar(200) NULL,
    approved boolean NOT NULL,
    CONSTRAINT Payment_history_pk PRIMARY KEY (txn_number,bank)
);


-- Table: Remaining_Fees
CREATE TABLE if not exists Remaining_Fees (
    roll_number varchar(16) NOT NULL,
    tuition_fee_payable float(10,2) NOT NULL,
    scholarship int NULL,
    CONSTRAINT Remaining_Fees_pk PRIMARY KEY (roll_number)
);
select * from Remaining_Fees;

-- Reference: academic_history_student (table: academic_history)
ALTER TABLE academic_history ADD CONSTRAINT academic_history_student FOREIGN KEY academic_history_student (roll_number)
    REFERENCES student (roll_number);

-- Reference: dayscholar_student (table: dayscholar)
ALTER TABLE dayscholar ADD CONSTRAINT dayscholar_student FOREIGN KEY dayscholar_student (roll_number)
    REFERENCES student (roll_number);

-- Reference: disciplinary_actions_student (table: disciplinary_actions)
ALTER TABLE disciplinary_actions ADD CONSTRAINT disciplinary_actions_student FOREIGN KEY disciplinary_actions_student (roll_number)
    REFERENCES student (roll_number);

-- Reference: enrollment_student (table: enrollment)
ALTER TABLE enrollment ADD CONSTRAINT enrollment_student FOREIGN KEY enrollment_student (roll_number)
    REFERENCES student (roll_number);

-- Reference: health_student (table: health)
ALTER TABLE health ADD CONSTRAINT health_student FOREIGN KEY health_student (roll_number)
    REFERENCES student (roll_number);

-- Reference: hostelite_student (table: hostelite)
ALTER TABLE hostelite ADD CONSTRAINT hostelite_student FOREIGN KEY hostelite_student (roll_number)
    REFERENCES student (roll_number);

-- Reference: parent_student (table: parent)
ALTER TABLE parent ADD CONSTRAINT parent_student FOREIGN KEY parent_student (roll_number)
    REFERENCES student (roll_number);

-- Reference: Remaining_Fees_student (table: Remaining_Fees)
ALTER TABLE Remaining_Fees ADD CONSTRAINT Remaining_Fees_student FOREIGN KEY Remaining_Fees_student (roll_number)
    REFERENCES student (roll_number);

-- Reference: student_Payment_history (table: Payment_history)
ALTER TABLE Payment_history ADD CONSTRAINT student_Payment_history FOREIGN KEY student_Payment_history (roll_number)
    REFERENCES student (roll_number);

-- Reference: student_login (table: student)
ALTER TABLE student ADD CONSTRAINT student_login FOREIGN KEY student_login (email)
    REFERENCES login (email);

insert into login values('cb.en.u4cse17001@cb.students.amrita.edu','stud1',0,null);
insert into login values('cb.en.u4cse17002@cb.students.amrita.edu','stud2',0,null);
insert into login values('cb.en.u4cse17003@cb.students.amrita.edu','stud3',0,null);
insert into login values('Naren@cb.amrita.edu','admin1',1,'Finance');

insert into student values('CB.EN.U4CSE17001','Arun','S', 'cb.en.u4cse17001@cb.students.amrita.edu','aruns@gmail.com','9841984321','1111133331','M', '2001-10-25', 'Indian', 'Tamil Nadu', 'Tamil', 'India', '123443212345', '5-310 KS Road, KS Puram, CBE 112','abd', 1);
insert into student values('CB.EN.U4CSE17002','Anusha','J','cb.en.u4cse17002@cb.students.amrita.edu','anushaj@gmail.com','9841984321','1111133332','F', '2001-10-25', 'Indian', 'Tamil Nadu', 'Tamil', 'India', '123443212345', '3 NK Road, NK Puram, CH 11','abd', 1);
insert into student values('CB.EN.U4CSE17003','Bharat','R','cb.en.u4cse17003@cb.students.amrita.edu','bharatr@gmail.com','9841984321','1111133333','M', '2001-10-25', 'Indian', 'Tamil Nadu', 'Tamil', 'India', '123443212345', '10 RS Road, RS Puram, CBE 1','abc', 2);

insert into enrollment values('CB.EN.U4CSE17001','1334512345', 'Coimbatore', 'B.Tech.','Computer Science', 2017,'A',4,7,'Mr. Kumar S','9999834567', '2017-06-01', 'Enrolled','AEEE','Tamil Nadu','Merit','AmritaVidhya 50%');
insert into enrollment values('CB.EN.U4CSE17002','1334512346', 'Coimbatore', 'B.Tech.','Computer Science', 2017,'A',4,7,'Mr. Kumar S','9999834567', '2017-06-01', 'Enrolled','12 Boards','Tamil Nadu','Management',null);

insert into dayscholar values('CB.EN.U4CSE17001', 'TVS Nagar', 'Avila Convent');

insert into hostelite values('CB.EN.U4CSE17002', 'Yagnalvika Bhavan', 'A1', 248, True);

insert into health values('CB.EN.U4CSE17001', 'O+', 'Peanut allergy', null);
insert into health values('CB.EN.U4CSE17002', 'A1+', null, 'Pending Covid-19 Vaccination');

insert into parent values('CB.EN.U4CSE17001', 'Father', 'B Dhanasekaran', '9935728467', 'dhanasekaran@yahoo.co.in','Bank Chief Manager', '92, H.J.S. Chambers, 1st Floor, Richmond Road, Bangalore 560025, Karnataka, India', '12',True);
insert into parent values('CB.EN.U4CSE17001', 'Mother', 'N Nagarathinam', '9635723467', 'nagarathinam@yahoo.co.in','Home Maker', null, 0, False);
insert into parent values('CB.EN.U4CSE17002', 'Guardian', 'C Selvam', '9335728445', 'selvam@yahoo.co.in','Microsoft IT Manager', '12, Block one, Blueberry Road, Hyderbad 460025, Telangana, India', '15',True);

insert into academic_history values('CB.EN.U4CSE17001','AISSCE','CBSE', 'Devi Academy Senior Secondary School Chennai, Tamil Nadu, India, Pin Code: 600087', 1, 445, 'abc');
insert into academic_history values('CB.EN.U4CSE17001','SSCE','CBSE', 'Devi Academy Senior Secondary School Chennai, Tamil Nadu, India, Pin Code: 600087', 1, 490, 'abc');
insert into academic_history values('CB.EN.U4CSE17002','AISSCE','CBSE', 'Devi Academy Senior Secondary School Chennai, Tamil Nadu, India, Pin Code: 600087', 1, 480, 'abc');
insert into academic_history values('CB.EN.U4CSE17002','SSLC','TNB', 'Devi Academy Senior Secondary School Chennai, Tamil Nadu, India, Pin Code: 600087', 1, 460, 'abc');

insert into disciplinary_actions(roll_number, report_date,report_time,place,category,notice_till,reporting_authority,details,action) values('CB.EN.U4CSE17001','2019-10-06', '18:30:00', 'AB1', 'Warning', '2021-10-11', 'Dr. Arun Kumar', 'Caught playing Holi.', 'Write apology letter.');
insert into disciplinary_actions(roll_number, report_date,report_time,place,category,notice_till,reporting_authority,details,action) values('CB.EN.U4CSE17001','2019-08-01', '18:30:00', 'Hostel', 'Severe', '2019-08-20', 'Dr. Shailendra J', 'Caught planning a birthday party with fireworks.', 'Detention on weekends from 5-6PM.');

insert into Payment_history values('TX001','SBI','CB.EN.U4CSE17001','2017-07-11','Tution',150000,1,'Naren','Online',NULL,true);
insert into Payment_history values('TX002','Axis','CB.EN.U4CSE17001','2017-07-20','Mess',100000,1,'Naren','Online',NULL,true);
insert into Payment_history values('TX011','SBI','CB.EN.U4CSE17002','2017-07-14','Tution',300000,1,'Naren','Online',NULL,true);
insert into Payment_history values('TX012','Dhanalakshmi','CB.EN.U4CSE17002','2017-07-18','Mess',100000,1,'Naren','Online',NULL,true);
insert into Payment_history values('TX021','SBI','CB.EN.U4CSE17003','2017-07-08','Tution',150000,1,'Nitya','Online',NULL,true);
insert into Payment_history values('TX022','SBI','CB.EN.U4CSE17003','2017-07-21','Mess',100000,1,'Nitya','Online',NULL,true);
insert into Payment_history values('TX023','SBI','CB.EN.U4CSE17003','2017-11-11','Tution',150000,2,'Nitya','Online',NULL,true);
insert into Payment_history values('TX101','Dhanalakshmi','CB.EN.U4CSE17001','2018-07-11','Tution',150000,NULL,NULL,'Cheque',NULL,false);
insert into Payment_history values('TX102','Dhanalakshmi','CB.EN.U4CSE17001','2018-08-11','Mess',100000,NULL,NULL,'DD',NULL,false);

insert into Remaining_Fees values('CB.EN.U4CSE17001',300000,0);
insert into Remaining_Fees values('CB.EN.U4CSE17002',150000,50);

-- Table: achievement
CREATE TABLE achievement (
    achievement_id int NOT NULL AUTO_INCREMENT,
    student_id varchar(16) NULL,
    achievement_type int NULL,
    title varchar(100) NOT NULL,
    proof_date date NOT NULL,
    proof_file blob NULL,
    verified int DEFAULT 0,
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

INSERT INTO achievement (student_id, achievement_type, title, proof_date, verified)
VALUES
("CB.EN.U4CSE17001", 1, "Published Paper", "2021-12-01", 0),
("CB.EN.U4CSE17002", 2, "CodeChef", "2021-11-27", 1),
("CB.EN.U4CSE17003", 3, "Cricket", "2001-08-01", 1),
("CB.EN.U4CSE17001", 1, "Arduino Project", "2065-11-21", 1),
("CB.EN.U4CSE17001", 3, "Chess", "2004-04-01", -1);


CREATE TABLE `bonafide` (

   `applied_date` varchar(25) DEFAULT NULL,
   `purpose` varchar(200) DEFAULT NULL,
   `Status` varchar(250) DEFAULT NULL,
   `approved_staff` varchar(20) DEFAULT NULL,
   `approved_time` varchar(45) DEFAULT NULL,
   `prepared_staff` varchar(45) DEFAULT NULL,
    `prepared_time` varchar(45) DEFAULT NULL,
   `action` varchar(45) DEFAULT NULL
);

-- drop table bonafide;
-- Table: courses
CREATE TABLE courses (
    courses_id int NOT NULL AUTO_INCREMENT,
    course_code varchar(10) NOT NULL,
    semester int NOT NULL,
    dept_fk int NULL,
    course_name varchar(100) NOT NULL,
    credits int NOT NULL,
    CONSTRAINT courses_pk PRIMARY KEY (courses_id)
);

ALTER TABLE courses ADD CONSTRAINT dept_fk_constrain FOREIGN KEY dept_fk_constrain (dept_fk)
    REFERENCES department (dept_id)
    ON DELETE SET NULL
    ON UPDATE SET NULL;


INSERT INTO courses (semester, course_code, course_name, dept_fk, credits)
VALUES
(1, "15ENG111", "Communicative English", 1, 2),
(1, "15MAT111", "Calculus and Matrix Algebra", 1, 2),
(1, "15CSE100", "Computational Thinking and Problem Solving", 1, 1),
(1, "15CHY100", "Chemistry", 1, 1),
(1, "15CHY181", "Chemistry Lab", 1, 1),
(1, "15MEC180", "Workshop A", 2, 1),
(1, "15MEC100", "Engineering Drawing - CAD", 2, 1),
(1, "15CUL101", "Cultural Education I", 2, 1),

(2, "15CSE201", "Data Structures and Algorithms", 1, 3),
(2, "15CSE202", "Object Oriented Programming", 1, 2),
(2, "15ECE202", "Digital Circuits and Systems", 1, 3),
(2, "15MAT201", "Discrete Mathematics", 1, 3),
(2, "15HUM240", "Psychology for Engineers", 2, 2),
(3, "15CSE281", "Data Structures Lab.", 1, 2),
(3, "15CSE282", "Object Oriented Programming Lab", 1, 2),
(3, "15ECE281", "Digital Circuits and Systems Lab", 1, 2);

CREATE TABLE courses_enroll (
    enroll_id int NOT NULL AUTO_INCREMENT,
    student_fk varchar(16) NULL,
    courses_fk int NULL,
    verified int DEFAULT 0,
    applied int DEFAULT 0,
    CONSTRAINT enroll_pk PRIMARY KEY (enroll_id),
    FOREIGN KEY (student_fk) REFERENCES student (roll_number),
    FOREIGN KEY (courses_fk) REFERENCES courses (courses_id)
);

INSERT INTO courses_enroll (student_fk, courses_fk, verified, applied)
VALUES
("CB.EN.U4CSE17001", 1, 0, 0),
("CB.EN.U4CSE17001", 6, -1, 0),
("CB.EN.U4CSE17001", 2, 1, 0),
("CB.EN.U4CSE17001", 3, 1, 1);


delimiter //

CREATE TRIGGER feeupdate AFTER UPDATE ON Payment_history
  FOR EACH ROW
  BEGIN
	DECLARE totalfee float;
    declare nyear int;
    declare remtution float;
    IF ((NEW.approved = true) and (NEW.txn_purpose ='Tution'))

    THEN
		set nyear = year(new.txn_date);
		SET totalfee = (SELECT sum(txn_amount) FROM (select * from Payment_history where roll_number=NEW.roll_number and txn_purpose=NEW.txn_purpose and year(txn_date)=nyear) as Specifictable);
		set remtution = (select tuition_fee_payable from Remaining_Fees where roll_number=NEW.roll_number);
        IF (totalfee <= remtution)
        then
			UPDATE Remaining_Fees SET tuition_fee_payable = tuition_fee_payable - totalfee  WHERE roll_number = NEW.roll_number;
		END IF;
    END IF;
 END;
//

-- select * from Remaining_Fees;
-- drop trigger feeupdate;
-- drop table Remaining_Fees;
-- update Remaining_Fees set tuition_fee_payable=300000 where roll_number='CB.EN.U4CSE17001';
-- update Payment_history set approved=false where roll_number='CB.EN.U4CSE17001' AND TXN_PURPOSE='Tution' and year(txn_date)=2018;

