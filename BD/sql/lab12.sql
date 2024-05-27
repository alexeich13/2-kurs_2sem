select * from teacher;
alter table teacher add (birthday date, salary int);

update teacher set birthday = to_date('20.04.1984', 'DD.MM.YYYY'),
salary = 1000
where pulpit like 'П%';

update teacher set birthday = to_date('13.08.1990', 'DD.MM.YYYY'),
salary = 500
where pulpit like 'ИС%';

update teacher set birthday = to_date('20.10.1989', 'DD.MM.YYYY'),
salary = 10
where pulpit like 'О%';
                    
update teacher set birthday = to_date('11.01.1993', 'DD.MM.YYYY'),
salary = 8
where pulpit like 'Т%';

update teacher set birthday = to_date('01.09.2000', 'DD.MM.YYYY'),
salary = 17
where salary is null and birthday is null;
commit;

select teacher
from teacher 
where to_char(birthday, 'D') = '1';

create or replace view next_month as
select 
to_char(birthday, 'DD/MM/YYYY') as birth
from teacher
where 
to_char(birthday, 'MM') = to_char(add_months(SYSDATE, 1), 'MM');

select * from next_month; 

create or replace view birthday_month as
select 
to_char(birthday, 'Month') as month_name,
count(*) as num_teachers
from teacher
group by
to_char(birthday, 'Month');

select * from birthday_month; 

declare 
cursor anniversary_teacher is
select teacher_name, birthday 
from teacher
where birthday >= SYSDATE and birthday < ADD_MONTHS(trunc(SYSDATE, 'YEAR'), 12) 
and ADD_MONTHS(birthday, 60) >= ADD_MONTHS(SYSDATE, 12) 
and ADD_MONTHS(birthday, 60) < ADD_MONTHS(trunc(SYSDATE, 'YEAR'), 24);

t_name teacher.teacher_name%type;
t_birthday teacher.birthday%type;
ann_age number;
begin
for c in anniversary_teacher
loop
ann_age := extract(YEAR from ADD_MONTHS(c.birthday, 60)) - extract(YEAR from c.birthday);
dbms_output.put_line(c.teacher_name || ' Возраст ' || TO_CHAR(ann_age) || ' Юбилей ' || TO_CHAR(ADD_MONTHS(c.birthday, 60), 'YYYY-MM-DD'));
end loop;
exception
when others
then
dbms_output.put_line('Нет таких преподавателей');
end;


declare
cursor c_pulp is select pulpit, faculty from pulpit;
cursor c_fac is select faculty from faculty;
avgsal number(6);
begin
dbms_output.put_line('pulpits:');
for r_pulp in c_pulp
loop
select floor(avg(salary)) into avgsal from teacher where pulpit = r_pulp.pulpit;
dbms_output.put_line(rpad(r_pulp.pulpit, 20) || ' ' || avgsal);
end loop;

dbms_output.put_line('faculties:');
for r_fac in c_fac
loop
select floor(avg(salary)) into avgsal from teacher where pulpit in (select pulpit from pulpit where faculty = r_fac.faculty);
dbms_output.put_line(rpad(r_fac.faculty, 20) || ' ' || avgsal);
end loop;
    
select floor(avg(salary)) into avgsal from teacher;
dbms_output.put_line(rpad('all', 20) || avgsal);
end;

declare 
delimoe number := 5;
delitel number := 0;
del_result number;
begin
del_result := delimoe / delitel;
dbms_output.put_line('Результат - ' || del_result);
exception
when zero_divide then 
dbms_output.put_line('Делитель равен нулю');
end;

declare 
ins_teacher_name varchar2(100);
ins_teacher number := 123;
begin
select teacher_name into ins_teacher_name from teacher where teacher= ins_teacher;
dbms_output.put_line('Преподаватель' || ins_teacher_name);
exception
when no_data_found then
dbms_output.put_line('Преподаватель не найден!');
when others then
dbms_output.put_line('Ошибка ' || sqlerrm);
end;


declare
ex_custom exception;
begin
dbms_output.put_line('Начало');
  
declare
ex_nested exception;
pragma EXCEPTION_INIT(ex_nested, -20001);
begin
dbms_output.put_line('Вложенный блок');
raise ex_nested;
dbms_output.put_line('Не должно выполниться');
exception
when ex_nested then
dbms_output.put_line('Исключение вложенного блока');
end;
dbms_output.put_line('Конец');
exception
when ex_custom then
dbms_output.put_line('Кастомное исключение');
when OTHERS then
dbms_output.put_line('Неизвестное исключение: ' || SQLERRM);
end;

declare 
max_cap number;
begin
select max(auditorium_capacity) into max_cap from auditorium;
dbms_output.put_line('Максимальная вместимость: ' || max_cap);
exception 
when no_data_found then
dbms_output.put_line('Запись не найдена');
end;



