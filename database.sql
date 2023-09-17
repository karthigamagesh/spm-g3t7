create database sbrp;
use sbrp;

create table Role
( Role_Name varchar(20) not null,
Role_Desc LongText not null,
constraint role_pk primary key (Role_Name));

create table Skill
(Skill_Name varchar(50) not null,
Skill_Desc LongText not null,
constraint skill_pk primary key (Skill_Name));

create table Access_Control
(Access_ID int not null,
Access_Control_Name varchar(20) not null,
constraint access_control_pk primary key (Access_ID));

create table Staff
( Staff_ID int not null,
Staff_FName varchar(50) not null,
Staff_LName varchar(50) not null,
Dept varchar(50) not null,
Country varchar(50) not null,
Email varchar(50) not null,
Role int not null,
constraint staff_pk primary key (Staff_ID),
constraint staff_fk foreign key (Role) references Access_Control(Access_ID));

create table Role_Skill
( Role_Name varchar(20) not null,
Skill_Name varchar(50) not null,
constraint role_skill_pk primary key (Role_Name, Skill_Name),
constraint role_skill_fk1 foreign key (Role_Name) references Role(Role_Name),
constraint role_skill_fk2 foreign key (Skill_Name) references Skill(Skill_Name));

create table Staff_Skill
( Staff_ID int not null,
Skill_Name varchar(50) not null,
constraint staff_skill_pk primary key (Staff_ID, Skill_Name),
constraint staff_skill_fk1 foreign key (Staff_ID) references Staff(Staff_ID),
constraint staff_skill_fk2 foreign key (Skill_Name) references Skill(Skill_Name));

create table Applications
( Application_ID int not null,
Staff_ID int not null,
Role_Name varchar(20) not null,
Comments longtext,
constraint application_pk primary key (Application_ID),
constraint application_fk1 foreign key (Staff_ID) references Staff(Staff_ID),
constraint application_fk2 foreign key (Role_Name) references Role(Role_Name));

