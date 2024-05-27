declare 
faculty_rec faculty%rowtype;
begin
select * into faculty_rec from FACULTY where FACULTY = 'ИДиП';
dbms_output.put_line(faculty_rec.FACULTY || ' ' ||faculty_rec.FACULTY_NAME);
end;

declare 
faculty_rec faculty%rowtype;
begin
select * into faculty_rec from faculty;
dbms_output.put_line(faculty_rec.faculty || ' ' || faculty_rec.faculty_name);
exception
when others 
then dbms_output.put_line(sqlcode);
dbms_output.put_line(sqlerrm);
end;

declare
faculty_rec faculty%rowtype;
begin
select * into faculty_rec from faculty;
dbms_output.put_line(faculty_rec.faculty || '  ' || faculty_rec.faculty_name);
exception
when too_many_rows
then dbms_output.put_line('Результат состоит из нескольких строк (ORA' || sqlcode ||')');
end;

declare 
faculty_rec faculty%rowtype;
begin
select * into faculty_rec from FACULTY where FACULTY = 'AAA';
dbms_output.put_line(faculty_rec.FACULTY || ' ' ||faculty_rec.FACULTY_NAME);
exception
when no_data_found
then
dbms_output.put_line('Данные не найдены (ORA' || sqlcode ||')');
end;

begin
delete from FACULTY where FACULTY = 'ППП';
exception
when others 
then dbms_output.put_line('Такая таблица отсутствует ' || sqlcode);
end;

begin
insert into FACULTY(FACULTY, FACULTY_NAME)
values('ХТиТ',   'Химическая технология и техника');
exception
when DUP_VAL_ON_INDEX
then dbms_output.put_line('Повтор ключа ' || sqlcode);
end;

declare
cursor curs is select teacher, teacher_name, PULPIT from TEACHER;
curs_teacher teacher.teacher%type;
curs_teacher_name teacher.teacher_name%type;
curs_pulpit teacher.pulpit%type;
begin
open curs;
loop
fetch curs into curs_teacher, curs_teacher_name, curs_pulpit;
exit when curs%notfound;
dbms_output.put_line(curs%rowcount ||' '|| curs_teacher || ' ' || curs_teacher_name || ' ' || curs_pulpit );
end loop;
close curs;
end;

declare 
cursor curs_subject is select * from subject;
rec_subject subject%rowtype;
begin
open curs_subject;
dbms_output.put_line('rowcount = ' || curs_subject%rowcount);
fetch curs_subject into rec_subject;
while curs_subject%found
loop
dbms_output.put_line(' ' || curs_subject%rowcount || ' ' 
|| rec_subject.subject || ' ' 
|| rec_subject.subject_name || ' ' 
|| rec_subject.pulpit);
fetch curs_subject into rec_subject;
end loop;
dbms_output.put_line('rowcount = ' || curs_subject%rowcount);
close curs_subject;
exception
when others
then dbms_output.put_line(sqlcode||' '||sqlerrm);   
end;

declare 
cursor curs (capacity auditorium.auditorium_capacity%type, capacity1 auditorium.auditorium_capacity%type)
is select auditorium, auditorium_capacity, auditorium_type
from auditorium
where auditorium_capacity >= capacity and auditorium_capacity <= capacity1;
--aum curs%rowtype;
begin
dbms_output.put_line('capacity < 20 :');
for aum in curs(0,20)
loop dbms_output.put_line(aum.auditorium||' '); 
end loop;
     
dbms_output.put_line('21 < capacity < 30 :');
for aum in curs(21,30)
loop dbms_output.put_line(aum.auditorium||' '); 
end loop;
     
dbms_output.put_line('31 < capacity < 60 :');
for aum in curs(31,60)
loop dbms_output.put_line(aum.auditorium||' '); 
end loop;
     
dbms_output.put_line('61 < capacity < 80 :');
for aum in curs(61,80)
loop dbms_output.put_line(aum.auditorium||' '); 
end loop;
     
dbms_output.put_line('81 < capacity:');
for aum in curs(81,1000)
loop dbms_output.put_line(aum.auditorium||' '); 
end loop;
exception
when others
then dbms_output.put_line(sqlcode||' '||sqlerrm);
end;

declare
type r_teacher is ref cursor;
curs_teacher r_teacher;
o_teacher teacher.teacher%type;
begin
open curs_teacher for select teacher from teacher;
loop
fetch curs_teacher into o_teacher;
exit when curs_teacher%notfound;
dbms_output.put_line(o_teacher);
end loop;
close curs_teacher;
end;

declare 
  cursor curs_auditorium(capacity auditorium.auditorium%type, capacity1 auditorium.auditorium%type)
    is select auditorium, auditorium_capacity
      from auditorium
      where auditorium_capacity >=capacity and AUDITORIUM_CAPACITY <= capacity1 for update;
  aum auditorium.auditorium%type;
  cty auditorium.auditorium_capacity%type;
begin
  open curs_auditorium(40,80);
  fetch curs_auditorium into aum, cty;
  while(curs_auditorium%found)
    loop
      cty := cty * 0.9;
      update auditorium
      set auditorium_capacity = cty
      where current of curs_auditorium;
      dbms_output.put_line(' '||aum||' '||cty);
      fetch curs_auditorium into aum, cty;
    end loop;
  close curs_auditorium;
  rollback;
  exception
  when others
    then dbms_output.put_line(sqlerrm);
end;




