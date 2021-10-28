create database if not exists student_profile;
use student_profile;
-- drop database student_profile;

-- Table: login
CREATE TABLE if not exists login (
    email varchar(100) NOT NULL,
    password varchar(100) NOT NULL,
    is_admin bit NOT NULL,
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
    receipt_no int NOT NULL,
    CONSTRAINT Payment_history_pk PRIMARY KEY (txn_number,bank)
);

-- Table: Payments_To_Be_Approved
CREATE TABLE if not exists Payments_To_Be_Approved (
    txn_number varchar(100) NOT NULL,
    bank varchar(100) NOT NULL,
    roll_number varchar(16) NOT NULL,
    txn_date date NOT NULL,
    txn_purpose varchar(100) NOT NULL,
    txn_amount float(10,2) NOT NULL,
    file blob NOT NULL,
    student_id int NOT NULL,
    CONSTRAINT Payments_To_Be_Approved_pk PRIMARY KEY (bank,txn_number)
);

-- Table: Remaining_Fees
CREATE TABLE if not exists Remaining_Fees (
    roll_number varchar(16) NOT NULL,
    fee_arrears float(10,2) NOT NULL,
    tuition_fee_payable float(10,2) NOT NULL,
    caution_deposit_payable float(10,2) NOT NULL,
    CONSTRAINT Remaining_Fees_pk PRIMARY KEY (roll_number)
);

-- foreign keys
-- Reference: Payments_To_Be_Approved_student (table: Payments_To_Be_Approved)
ALTER TABLE Payments_To_Be_Approved ADD CONSTRAINT Payments_To_Be_Approved_student FOREIGN KEY Payments_To_Be_Approved_student (roll_number)
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
    
use student_profile;

insert into login values('cb.en.u4cse17001@cb.students.amrita.edu','stud1',0);
insert into login values('cb.en.u4cse17002@cb.students.amrita.edu','stud2',0);
insert into login values('cb.en.u4cse17003@cb.students.amrita.edu','stud3',0);
insert into login values('admin@cb.amrita.edu','admin1',1);

insert into student values('CB.EN.U4CSE17001','Arun','S','cb.en.u4cse17001@cb.students.amrita.edu','1111133331');
insert into student values('CB.EN.U4CSE17002','Anusha','J','cb.en.u4cse17002@cb.students.amrita.edu','1111133332');
insert into student values('CB.EN.U4CSE17003','Bharat','R','cb.en.u4cse17003@cb.students.amrita.edu','1111133333');

insert into Payment_history values('TX001','SBI','CB.EN.U4CSE17001','2017-07-11','Tution',150000,1);
insert into Payment_history values('TX002','Axis','CB.EN.U4CSE17001','2017-07-20','Mess',100000,1);
insert into Payment_history values('TX011','SBI','CB.EN.U4CSE17002','2017-07-14','Tution',300000,1);
insert into Payment_history values('TX012','Dhanalakshmi','CB.EN.U4CSE17002','2017-07-18','Mess',100000,1);
insert into Payment_history values('TX021','SBI','CB.EN.U4CSE17003','2017-07-08','Tution',150000,1);
insert into Payment_history values('TX022','SBI','CB.EN.U4CSE17003','2017-07-21','Mess',100000,1);
insert into Payment_history values('TX023','SBI','CB.EN.U4CSE17003','2017-11-11','Tution',150000,2);

