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
\
