CREATE TABLE attendance_details (
   course_name varchar(24) NOT NULL,
   attended_classes int NOT NULL,
   total_classes int NULL,
   percentage float(10,2) NOT NULL,
   CONSTRAINT attendance_details_pk PRIMARY KEY (course_name)
);

CREATE TABLE coursewise_attendance (
   date date NOT NULL,
   number_of_classes int NOT NULL,
   attendance_status varchar(%) NOT NULL,
   CONSTRAINT coursewise_attendance_pk PRIMARY KEY (date)
);