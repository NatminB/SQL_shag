

1. Вывести полные имена врачей и их специализации. 
select D.Surname + ' ' + D.Name as Doctor, S.Name as Specialization
from Doctors as D, Specializations as S, DoctorsSpecializations as DS
where D.Id = DS.DoctorId and S.Id = DS.SpecializationId;

2. Вывести фамилии и зарплаты (сумма ставки и надбавки) врачей, которые не находятся в отпуске.
select D.Surname, D.Salary + D.Premium as Salary, V.StartDate
from Doctors as D, Vacations as V
where D.Id = V.DoctorId and (getDate() < V.StartDate or getDate() > V.EndDate);

3. Вывести названия палат, которые находятся в отделении “Intensive Treatment”.
select W.Name
from Wards as W, Departments as D
where W.DepartmentId = D.Id and D.Name like N'Терапевтическое отделение';

4. Вывести названия отделений без повторений, которые спонсируются компанией “Umbrella Corporation”.
select distinct Dep.Name
from Departments as Dep, Donations as Don, Sponsors as S
where Dep.Id = Don.DepartmentId and Don.SponsorId = S.Id and S.Name like N'Umbrella Corporation';

5. Вывести все пожертвования за последний месяц в виде: отделение, спонсор, сумма пожертвования, дата пожертвования.
select Dep.Name as Department, S.Name as Sponsor, Don.Amount, Don.Date
from Departments as Dep, Sponsors as S, Donations as Don
where Dep.Id = Don.DepartmentId and Don.SponsorId = S.Id and month(Don.Date) = month(getdate()) and year(Don.Date) = year(getdate());

/*ЗАПРОС К СЛОЖНОЙ БД*/6. Вывести фамилии врачей с указанием отделений, в которых они проводят обследования. Необходимо учитывать обследования, проводимые только в будние дни.
select Doc.Surname, Dep.Name
from Doctors as Doc, Departments as Dep, DoctorsExaminations as DE, Wards as W, DayOfWeek as DOW
where Doc.Id = DE.DoctorId and DE.WardId = W.Id and W.DepartmentId = Dep.Id and DE.DayId = DOW.Id and DOW.Name like '[1-5]';

/*ЗАПРОС К СЛОЖНОЙ БД*/7. Вывести названия палат и корпуса отделений, в которых проводит обследования врач “Helen Williams”.
select W.Name as Ward, B.Name as Building
from Wards as W, Buildings as B, DoctorsExaminations as DE, Doctors as D
where W.BuildingId = B.Id and W.Id = DE.WardId and DE.DoctorId = D.Id and D.Name + ' ' + D.Surname like N'Михаил Иванов';

/*ЗАПРОС К СЛОЖНОЙ БД*/8. Вывести названия отделений, которые получали пожертвование в размере больше 100000, с указанием их врачей.
select Dep.Name as Department, Doc.Name + ' ' + Doc.Surname as Doctor 
from Departments as Dep, Donations as Don, Wards as W, DoctorsExaminations as DE, Doctors as Doc
where Dep.Id = Don.DepartmentId and W.DepartmentId = Dep.Id and W.Id = DE.WardId and DE.DoctorId = Doc.Id and Don.Amount > 10000;

/*ЗАПРОС К СЛОЖНОЙ БД*/9. Вывести названия отделений, в которых есть врачи не получающие надбавки.
select Dep.Name as Department
from Departments as Dep, Wards as W, DoctorsExaminations as DE, Doctors as Doc
where Dep.Id = W.DepartmentId and w.Id = DE.WardId and DE.DoctorId = Doc.Id and Doc.Premium = 0;

/*ЗАПРОС К СЛОЖНОЙ БД*/10. Вывести названия специализаций, которые используются для лечения заболеваний со степенью тяжести выше 2.
select Spec.Name as Specialization
from Specializations as Spec, DoctorsSpecializations as DS, Doctors as Doc, DoctorsExaminations as DE, Severity as Sev 
where Spec.Id = DS.SpecializationId and DS.DoctorId = Doc.Id and Doc.Id = DE.DoctorId and DE.SeverityId = Sev.Id and Sev.Name > 2;

/*ЗАПРОС К СЛОЖНОЙ БД*/11. Вывести названия отделений и заболеваний, обследования по которым они проводили за последние полгода.
select Dep.Name as Department, Dis.Name as Diseas
from Departments as Dep, Wards as W, DoctorsExaminations as DE, Diseases as Dis
where Dep.Id = W.DepartmentId and W.Id = DE.WardId and DE.DiseaseId = Dis.Id and month(DE.Date) in (11, 12, 1, 2, 3, 4);

/*ЗАПРОС К СЛОЖНОЙ БД*/12. Вывести названия отделений и палат, в которых проводились обследования по заразительным заболеваниям.
select Dep.Name as Department, W.Name as Ward
from Departments as Dep, Wards as W, DoctorsExaminations as DE, Severity as Sev
where Dep.Id = W.DepartmentId and W.Id = DE.WardId and DE.SeverityId = Sev.Id and Sev.Name = 3;

