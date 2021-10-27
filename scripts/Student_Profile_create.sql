create database if not exists student_profile;
use student_profile;
-- tables
-- Table: Payment_history
CREATE TABLE Payment_history (
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
CREATE TABLE Payments_To_Be_Approved (
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
CREATE TABLE Remaining_Fees (
    roll_number varchar(16) NOT NULL,
    fee_arrears float(10,2) NOT NULL,
    tuition_fee_payable float(10,2) NOT NULL,
    caution_deposit_payable float(10,2) NOT NULL,
    CONSTRAINT Remaining_Fees_pk PRIMARY KEY (roll_number)
);

-- Table: achievement
CREATE TABLE achievement (
    achievement_id int NOT NULL,
    student_id int NOT NULL,
    achievement_type int NOT NULL,
    title varchar(100) NOT NULL,
    proof_date date NULL,
    proof_file blob NULL,
    CONSTRAINT achievement_pk PRIMARY KEY (achievement_id)
);

-- Table: achievement_types
CREATE TABLE achievement_types (
    achievement_type_id int NOT NULL,
    achievement_type_description varchar(20) NOT NULL,
    CONSTRAINT achievement_types_pk PRIMARY KEY (achievement_type_id)
);

-- Table: category
CREATE TABLE category (
    id int NOT NULL,
    name varchar(20) NOT NULL,
    CONSTRAINT category_pk PRIMARY KEY (id)
);

-- Table: course
CREATE TABLE course (
    course_id char(8) NOT NULL,
    course_name varchar(50) NOT NULL,
    semester varchar(100) NOT NULL,
    credits int NOT NULL,
    description varchar(300) NULL,
    CONSTRAINT course_pk PRIMARY KEY (course_id)
);

-- Table: language
CREATE TABLE language (
    id int NOT NULL,
    name varchar(100) NOT NULL,
    CONSTRAINT language_pk PRIMARY KEY (id)
);

-- Table: level
CREATE TABLE level (
    id int NOT NULL,
    sign char(2) NOT NULL,
    name varchar(100) NOT NULL,
    CONSTRAINT level_pk PRIMARY KEY (id)
);

-- Table: login
CREATE TABLE login (
    email varchar(15) NOT NULL,
    password varchar(100) NOT NULL,
    is_admin bit NOT NULL,
    CONSTRAINT login_pk PRIMARY KEY (email)
);

-- Table: student
CREATE TABLE student (
    roll_number varchar(16) NOT NULL,
    date_birth date NOT NULL,
    state varchar(150) NOT NULL,
    city varchar(100) NOT NULL,
    pin_code char(10) NOT NULL,
    street varchar(100) NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    phone varchar(15) NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (roll_number)
);

-- foreign keys
-- Reference: Payments_To_Be_Approved_student (table: Payments_To_Be_Approved)
ALTER TABLE Payments_To_Be_Approved ADD CONSTRAINT Payments_To_Be_Approved_student FOREIGN KEY Payments_To_Be_Approved_student (roll_number)
    REFERENCES student (roll_number);

-- Reference: Remaining_Fees_student (table: Remaining_Fees)
ALTER TABLE Remaining_Fees ADD CONSTRAINT Remaining_Fees_student FOREIGN KEY Remaining_Fees_student (roll_number)
    REFERENCES student (roll_number);

-- Reference: achievement_types_constrain (table: achievement)
ALTER TABLE achievement ADD CONSTRAINT achievement_types_constrain FOREIGN KEY achievement_types_constrain (achievement_type)
    REFERENCES achievement_types (achievement_type_id)
    ON DELETE SET DEFAULT
    ON UPDATE SET DEFAULT;

-- Reference: course_category (table: course)
ALTER TABLE course ADD CONSTRAINT course_category FOREIGN KEY course_category (credits)
    REFERENCES category (id);

-- Reference: course_language (table: course)
ALTER TABLE course ADD CONSTRAINT course_language FOREIGN KEY course_language (<EMPTY>)
    REFERENCES language (id);

-- Reference: course_level (table: course)
ALTER TABLE course ADD CONSTRAINT course_level FOREIGN KEY course_level (<EMPTY>)
    REFERENCES level (id);

-- Reference: student_Payment_history (table: Payment_history)
ALTER TABLE Payment_history ADD CONSTRAINT student_Payment_history FOREIGN KEY student_Payment_history (roll_number)
    REFERENCES student (roll_number);

-- Reference: student_login (table: student)
ALTER TABLE student ADD CONSTRAINT student_login FOREIGN KEY student_login (email)
    REFERENCES login (email);

-- End of file.

