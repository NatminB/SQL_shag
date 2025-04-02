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

create table DoctorsExaminations
(
	Id int identity(1, 1) primary key,
	StartTime time check (StartTime between '08:00' and '18:00'),
	EndTime time,
	DoctorId int,
	ExaminationId int,
	WardId int,
	DayId int,
	DiseaseId int,
	SeverityId int,
	check (StartTime < EndTime)
);

INSERT INTO DoctorsExaminations (StartTime, EndTime, DoctorId, ExaminationId, WardId, DayId, DiseaseId, SeverityId)
VALUES 
('09:00:00', '10:00:00', 1, 1, 1, 1, 1, 1),
('10:00:00', '11:00:00', 2, 2, 2, 2, 2, 2),
('11:00:00', '12:00:00', 3, 3, 3, 3, 3, 3),
('12:00:00', '13:00:00', 4, 4, 4, 4, 4, 1),
('13:00:00', '14:00:00', 5, 5, 5, 5, 5, 2),
('14:00:00', '15:00:00', 6, 6, 6, 6, 6, 3),
('15:00:00', '16:00:00', 7, 7, 7, 7, 7, 1),
('16:00:00', '17:00:00', 8, 8, 8, 1, 8, 2),
('17:00:00', '18:00:00', 9, 9, 9, 2, 9, 3),
('18:00:00', '19:00:00', 10, 10, 10, 3, 10, 1);

create table Examinations
(
	Id int identity(1, 1) primary key,
	Name nvarchar(100) unique check (Name <> N'')
);

INSERT INTO Examinations (Name)
VALUES 
(N'Электрокардиограмма'),
(N'Ультразвуковая диагностика'),
(N'Биохимический анализ крови'),
(N'Рентгенологическое исследование'),
(N'Компьютерная томография'),
(N'Эндоскопическая диагностика'),
(N'Клинико-диагностические исследования'),
(N'Флюорография'),
(N'Молекулярно-генетические исследования'),
(N'Функциональная диагностика');

create table Wards
(
	Id int identity(1, 1) primary key,
	Name nvarchar(20) unique check(Name <> N''),
	DepartmentId int,
	BuildingId int,
	FloorId int,
	Places int check (Places >= 1)
);

INSERT INTO Wards (Name, DepartmentId, BuildingId, FloorId, Places)
VALUES 
(N'1', 1, 1, 1, 2),
(N'2', 2, 2, 2, 3),
(N'3', 3, 3, 1, 2),
(N'4', 4, 1, 2, 3),
(N'5', 5, 2, 1, 2),
(N'6', 6, 3, 2, 3),
(N'7', 7, 1, 1, 2),
(N'8', 8, 2, 2, 3),
(N'9', 9, 3, 1, 2),
(N'10', 10, 1, 2, 3);

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

create table Diseases
(
	Id int identity(1, 1) primary key,
	Name nvarchar(100) unique check (Name <> N'')
);

INSERT INTO Diseases (Name) 
VALUES 
(N'Аппендицит'),
(N'Гайморит'),
(N'Гастрит'),
(N'Анемия'),
(N'Атеросклероз'),
(N'Гипотиреоз'),
(N'Гепатит'),
(N'Невралгия'),
(N'Пиелонефрит'),
(N'Пневмония');

create table DayOfWeek
(
	Id int identity(1, 1) primary key,
	Name int check (Name between 1 and 7)	
);

INSERT INTO DayOfWeek (Name)
VALUES 
(1),
(2),
(3),
(4),
(5),
(6),
(7);

create table Severity
(
	Id int identity(1, 1) primary key,
	Name int check (Name between 1 and 3)	
);

INSERT INTO Severity (Name)
VALUES 
(1),
(2),
(3);

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

create table Buildings
(
	Id int identity(1, 1) primary key,
	Name int unique check(Name <> N''),
	check (Name between 1 and 3)
);

INSERT INTO Buildings (Name)
VALUES 
(1),
(2),
(3);

create table Floors
(
	Id int identity(1, 1) primary key,
	Name int unique check(Name <> N''),
	check (Name between 1 and 2)
);

INSERT INTO Floors (Name)
VALUES 
(1),
(2);

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

alter table DoctorsExaminations
add foreign key (DoctorId) references Doctors(Id);

alter table DoctorsExaminations
add foreign key (ExaminationId) references Examinations(Id);

alter table DoctorsExaminations
add foreign key (WardId) references Wards(Id);

alter table DoctorsExaminations
add foreign key (DayId) references DayOfWeek(Id);

alter table DoctorsExaminations
add foreign key (DiseaseId) references Diseases(Id);

alter table DoctorsExaminations
add foreign key (SeverityId) references Severity(Id);

alter table DoctorsSpecializations
add foreign key (DoctorId) references Doctors(Id);

alter table DoctorsSpecializations
add foreign key (SpecializationId) references Specializations(Id);

alter table Wards
add foreign key (DepartmentId) references Departments(Id);

alter table Wards
add foreign key (BuildingId) references Buildings(Id);

alter table Wards
add foreign key (FloorId) references Floors(Id);

alter table Donations
add foreign key (DepartmentId) references Departments(Id);

alter table Donations
add foreign key (SponsorId) references Sponsors(Id);

alter table Vacations
add foreign key (DoctorId) references Doctors(Id);