use newHospital;
/*
1. Вывести количество палат, вместимость которых больше 10.
select count(W.Id) as Count
from Wards as W
where W.Places > 2;

2. Вывести названия корпусов и количество палат в каждом из них. 
select B.Name as Building, count(W.Id) as CountWards
from Wards as W, Buildings as B
where W.BuildingId = B.Id
group by B.Name;

!РЕШЕНИЕ ЛЕГКАЯ БД! 3. Вывести названия отделений и количество палат в каждом из них.
select D.Name as Department, count(W.Id) as CountWards
from Departments as D, Wards as W
where D.Id = W.DepartmentId
group by D.Name;

4. Вывести названия отделений и суммарную надбавку врачей в каждом из них. 
select Dep.Name as Department, sum(Doc.Premium) as SumPremium
from Departments as Dep, Wards as W, DoctorsExaminations as DE, Doctors as Doc
where Dep.Id = W.DepartmentId and W.Id = DE.WardId and DE.DoctorId = Doc.Id
group by Dep.Name;

5. Вывести названия отделений, в которых проводят обследования 5 и более врачей.
select Dep.Name as Department
from Departments as Dep, Wards as W, DoctorsExaminations as DE, Doctors as Doc
where Dep.Id = W.DepartmentId and W.Id = DE.WardId and DE.DoctorId = Doc.Id
group by Dep.Name
having count(Doc.Id) >= 1;

!РЕШЕНИЕ ЛЕГКАЯ БД! 6. Вывести количество врачей и их суммарную зарплату (сумма ставки и надбавки).
select count(D.Id) as Doctors, sum(D.Salary + D.Premium) as SumSalary
from Doctors as D;

!РЕШЕНИЕ ЛЕГКАЯ БД! 7. Вывести среднюю зарплату (сумма ставки и надбавки) врачей.
select avg(D.Salary + D.Premium) as CountSalary
from Doctors as D;

8. Вывести названия палат с минимальной вместительностью.
select W.Name as Ward
from Wards as W
group by W.Name
having min(W.Places) = 2;

9. Вывести в каких из корпусов 1, 3, суммарное количество мест в палатах превышает 2. 
При этом учитывать только палаты с количеством мест больше 1.
select B.Name as Building, count(W.Places) as CountPlaces
from Buildings as B, Wards as W
where B.Id = W.BuildingId and B.Name in (1, 3) and W.Places > 1
group by B.Name
having count(W.Places) > 2;

*/








