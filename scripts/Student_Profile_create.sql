create database if not exists student_profile;
use student_profile;
-- drop database student_profile;

-- Table: login
CREATE TABLE if not exists login (
    email varchar(100) NOT NULL,
    password varchar(100) NOT NULL,
    is_admin bit NOT NULL,
    admin_type varchar(100),
    CONSTRAINT login_pk PRIMARY KEY (email)
);

-- Table: student
CREATE TABLE if not exists student (
    roll_number varchar(16) NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    phone varchar(15) NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (roll_number)
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
    fee_arrears float(10,2) NOT NULL,
    tuition_fee_payable float(10,2) NOT NULL,
    caution_deposit_payable float(10,2) NOT NULL,
    scholarship int NULL,
    CONSTRAINT Remaining_Fees_pk PRIMARY KEY (roll_number)
);


-- Reference: Remaining_Fees_student (table: Remaining_Fees)
ALTER TABLE Remaining_Fees ADD CONSTRAINT Remaining_Fees_student FOREIGN KEY Remaining_Fees_student (roll_number)
    REFERENCES student (roll_number);

-- Reference: student_Payment_history (table: Payment_history)
ALTER TABLE Payment_history ADD CONSTRAINT student_Payment_history FOREIGN KEY student_Payment_history (roll_number)
    REFERENCES student (roll_number);

-- Reference: student_login (table: student)
ALTER TABLE student ADD CONSTRAINT student_login FOREIGN KEY student_login (email)
    REFERENCES login (email);

use student_profile;

insert into login values('cb.en.u4cse17001@cb.students.amrita.edu','stud1',0,null);
insert into login values('cb.en.u4cse17002@cb.students.amrita.edu','stud2',0,null);
insert into login values('cb.en.u4cse17003@cb.students.amrita.edu','stud3',0,null);
insert into login values('Naren@cb.amrita.edu','admin1',1,'Finance');

insert into student values('CB.EN.U4CSE17001','Arun','S','cb.en.u4cse17001@cb.students.amrita.edu','1111133331');
insert into student values('CB.EN.U4CSE17002','Anusha','J','cb.en.u4cse17002@cb.students.amrita.edu','1111133332');
insert into student values('CB.EN.U4CSE17003','Bharat','R','cb.en.u4cse17003@cb.students.amrita.edu','1111133333');

insert into Payment_history values('TX001','SBI','CB.EN.U4CSE17001','2017-07-11','Tution',150000,1,'Naren','Online',NULL,true);
insert into Payment_history values('TX002','Axis','CB.EN.U4CSE17001','2017-07-20','Mess',100000,1,'Naren','Online',NULL,true);
insert into Payment_history values('TX011','SBI','CB.EN.U4CSE17002','2017-07-14','Tution',300000,1,'Naren','Online',NULL,true);
insert into Payment_history values('TX012','Dhanalakshmi','CB.EN.U4CSE17002','2017-07-18','Mess',100000,1,'Naren','Online',NULL,true);
insert into Payment_history values('TX021','SBI','CB.EN.U4CSE17003','2017-07-08','Tution',150000,1,'Nitya','Online',NULL,true);
insert into Payment_history values('TX022','SBI','CB.EN.U4CSE17003','2017-07-21','Mess',100000,1,'Nitya','Online',NULL,true);
insert into Payment_history values('TX023','SBI','CB.EN.U4CSE17003','2017-11-11','Tution',150000,2,'Nitya','Online',NULL,true);
insert into Payment_history values('TX101','Dhanalakshmi','CB.EN.U4CSE17001','2018-07-11','Tution',150000,NULL,NULL,'Cheque',NULL,false);
insert into Payment_history values('TX102','Dhanalakshmi','CB.EN.U4CSE17001','2018-08-11','Mess',100000,NULL,NULL,'DD',NULL,false);
select * from Payment_history;


-- Table: achievement
CREATE TABLE achievement (
    achievement_id int NOT NULL AUTO_INCREMENT,
    student_id varchar(16) NULL,
    achievement_type int NULL,
    title varchar(100) NOT NULL,
    proof_date date NOT NULL,
    proof_file blob NULL,
    verified bit DEFAULT 0,
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

select * from bonafide;