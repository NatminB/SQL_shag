use newHospital;

create table Doctors
(
    Id int identity(1, 1) primary key,
    Name nvarchar(max) check (Name <> N''),
    Surname nvarchar(max) check (Surname <> N''),
    Phone char(10),
    Salary money check (Salary > 0.0),
    Premium money check (Premium >= 0.0) default 0.0
);

INSERT INTO Doctors (Name, Surname, Phone, Salary, Premium)
VALUES 
(N'Михаил', N'Иванов', '254569875', 2500, 300),
(N'Алиса', N'Петрова', '295698523', 3000, 400),
(N'Артем', N'Сидоров', '445698235', 2400, 500),
(N'Мария', N'Смирнова', '297589632', 2800, 300),
(N'Александр', N'Кузнецов', '257894562', 2100, 400),
(N'Ева', N'Соколова', '445647895', 3200, 500),
(N'Марк', N'Михайлов', '295689452', 3500, 300),
(N'Ксения', N'Иваненко', '445698745', 1800, 400),
(N'Матвей', N'Петренко', '258965234', 2000, 500),
(N'София', N'Новикова', '258569874', 3600, 300);

create table Wards
(
    Id int identity(1, 1) primary key,
    Name nvarchar(20) unique check(Name <> N''),
    DepartmentId int,
    Places int check (Places >= 1)
);

INSERT INTO Wards (Name, DepartmentId, Places)
VALUES 
(N'1', 1, 2),
(N'2', 2, 3),
(N'3', 3, 2),
(N'4', 4, 3),
(N'5', 5, 2),
(N'6', 6, 3),
(N'7', 7, 2),
(N'8', 8, 3),
(N'9', 9, 2),
(N'10', 10, 3);

create table Departments
(
    Id int identity(1, 1) primary key,
    Name nvarchar(100) unique check (Name <> N'')
);

INSERT INTO Departments (Name)
VALUES 
(N'Хирургическое отделение'),
(N'Терапевтическое отделение'),
(N'Гастроэнтерологическое отделение'),
(N'Диагностическое отделение'),
(N'Кардиологическое отделение'),
(N'Эндокринологическое отделение'),
(N'Приемное отделение'),
(N'Неврологическое отделение'),
(N'Нефрологическое отделение'),
(N'Пульмонологическое отделение');

create table DoctorsSpecializations
(
    Id int identity(1, 1) primary key,
    DoctorId int,
    SpecializationId int
);

INSERT INTO DoctorsSpecializations (DoctorId, SpecializationId)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

create table Specializations
(
    Id int identity(1, 1) primary key,
    Name nvarchar(100) unique check (Name <> N'')
);

INSERT INTO Specializations (Name)
VALUES 
(N'Хирург'),
(N'Терапевт'),
(N'Гастроэнтеролог'),
(N'Диагност'),
(N'Кардиолог'),
(N'Эндокринолог'),
(N'Хирург по экстренному приему'),
(N'Невролог'),
(N'Нефролог'),
(N'Пульмонолог');

create table Donations
(
    Id int identity(1, 1) primary key,
    Amount money check (Amount > 0.0),
    Date date check (Date <= getdate()) default getdate(),
    DepartmentId int,
    SponsorId int
);

INSERT INTO Donations (Amount, Date, DepartmentId, SponsorId)
VALUES 
(4000, '2023-01-01', 1, 1),
(5000, '2023-02-01', 2, 2),
(6000, '2023-03-01', 3, 3),
(7000, '2023-04-01', 4, 4),
(8000, '2023-05-01', 5, 5),
(9000, '2023-06-01', 6, 6),
(10000, '2023-07-01', 7, 7),
(20000, '2023-08-01', 8, 8),
(30000, '2023-09-01', 9, 9),
(40000, '2023-10-01', 10, 10);

create table Sponsors
(
    Id int identity(1, 1) primary key,
    Name nvarchar(100) unique check (Name <> N'')
);

INSERT INTO Sponsors (Name)
VALUES 
(N'Umbrella Corporation'),
(N'Р-Фарм'),
(N'Aspen Company'),
(N'ПОЛИСАН'),
(N'FERRING'),
(N'Takeda Pharmaceutical Company Limited'),
(N'Mindray'),
(N'Woo Young Medical Co'),
(N'ГЕНЕРИУМ'),
(N'КОСМОФАРМ');

create table Vacations
(
    Id int identity(1, 1) primary key,
    DoctorId int,
    StartDate date,
    EndDate date,
    check (StartDate < EndDate)
);

INSERT INTO Vacations (DoctorId, StartDate, EndDate)
VALUES 
(1, '2024-01-01', '2024-02-01'),
(2, '2024-02-01', '2024-03-01'),
(3, '2024-03-01', '2024-04-01'),
(4, '2023-04-01', '2023-05-01'),
(5, '2023-05-01', '2023-06-01'),
(6, '2023-06-01', '2023-07-01'),
(7, '2023-07-01', '2023-08-01'),
(8, '2023-08-01', '2023-09-01'),
(9, '2023-09-01', '2023-10-01'),
(10, '2023-10-01', '2023-11-01');




alter table DoctorsSpecializations
add foreign key (DoctorId) references Doctors(Id);

alter table DoctorsSpecializations
add foreign key (SpecializationId) references Specializations(Id);

alter table Wards
add foreign key (DepartmentId) references Departments(Id);

alter table Donations
add foreign key (DepartmentId) references Departments(Id);

alter table Donations
add foreign key (SponsorId) references Sponsors(Id);

alter table Vacations
add foreign key (DoctorId) references Doctors(Id);