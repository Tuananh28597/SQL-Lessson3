create database StudentManagement;
use StudentManagement;
create table Class(
                      ClassID int not null auto_increment primary key ,
                      ClassName VARCHAR(60) not null ,
                      StartDate datetime not null ,
                      Status bit
);
create table Student (
                         StudentID int not null auto_increment primary key ,
                         StudentName varchar(30) not null ,
                         Address varchar(50),
                         Phone varchar(20),
                         Status bit,
                         ClassID int not null ,
                         foreign key (ClassID) references Class(ClassID)
);

create table subject (
                         SubId int not null auto_increment primary key ,
                         SubName varchar(30) not null ,
                         Credit tinyint not null default 1 check ( credit >=1 ),
                         Status bit default 1
);

create  table mark(
                      MarkId int not null auto_increment primary key ,
                      SubId int not null ,
                      StudentId int not null ,
                      Mark float default 0 check(Mark between 0 and 100),
                      ExamTimes tinyint default 1,
                      UNIQUE (SubId,StudentId),
                      foreign key (SubId) references subject(SubId),
                      foreign key (StudentId) references Student(StudentID)
);

insert into Class
values (1,'A1','2008-12-20',1);
insert into Class
values (2,'A2','2008-12-22',1);
insert into Class
values (3,'B3',current_date,1);

insert into Student(StudentName,Address,Phone, Status,ClassID)
values ('Hung', 'Ha Noi', '0912113113',1,1);
insert into Student(StudentName,Address, Status,ClassID)
values ('Hoa', 'Hai Phong',1,1);
insert into Student(StudentName,Address,Phone, Status,ClassID)
values ('Manh', 'HCM', '0123123123',0,2);

insert into subject
values (1,'CF',5,1),
       (2,'C',6,1),
       (3,'HDJ',5,1),
       (4,'RDBMS',10,1);

insert into Mark(SubId, StudentId, Mark,ExamTimes)
values (1,1,8,1),
       (1,2,10,2),
       (2,1,12,1);

select*
from Student
where Student.StudentName like 'H%';

select *
from Class
where StartDate like '%12%';

select *
from subject
where Credit between 3 and 5;

update Student
set ClassID=2
where StudentName='Hung';

delete from Student
where StudentID=6;

select S.StudentName, Sub.SubName, M.Mark
from subject Sub join Mark M on Sub.SubId = M.SubId join Student S on M.StudentId = S.StudentID
order by Mark;

