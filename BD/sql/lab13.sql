create or replace procedure GET_TEACHERS (PCODE TEACHER.PULPIT%TYPE)
is
cursor teach is select * from TEACHER where TEACHER.PULPIT = PCODE;
alteach teach%rowtype;
begin
open teach;
loop
fetch teach into alteach;
exit when teach%NOTFOUND;
dbms_output.put_line(alteach.TEACHER_NAME||' '|| alteach.PULPIT);
end loop;
close teach;
end;

begin
GET_TEACHERS('ИСиТ');
end;

create or replace function GET_NUM_TEACHERS (PCODE TEACHER.PULPIT%TYPE) RETURN NUMBER
is
teach_count number;
begin 
select count(*) into teach_count from TEACHER where PULPIT = PCODE;
return teach_count;
end;

begin
dbms_output.put_line('Количество ИСиТ'||' '|| GET_NUM_TEACHERS('ИСиТ'));
end;

create or replace procedure GET_TEACHERS_BY_FACULTY (FCODE FACULTY.FACULTY%TYPE)
is
cursor cteachers is select TEACHER.TEACHER_NAME, TEACHER.PULPIT from TEACHER
inner join PULPIT on PULPIT.PULPIT = TEACHER.PULPIT 
where PULPIT.FACULTY = FCODE;  
teacher cteachers%rowtype;
begin
open cteachers;
loop
fetch cteachers into teacher;
exit when cteachers%notfound;
dbms_output.put_line(teacher.teacher_name||' '||teacher.pulpit);
end loop;
close cteachers;
end;

begin
GET_TEACHERS_BY_FACULTY('ИДиП');
end;  

create or replace procedure GET_SUBJECTS (PCODE SUBJECT.PULPIT%TYPE)
is
cursor subjects is select * from SUBJECT where PULPIT = PCODE;
subject subjects%rowtype;
begin 
open subjects;
loop
fetch subjects into subject;
exit when subjects%notfound;
dbms_output.put_line(subject.subject_name||' '||subject.pulpit);
end loop;
close subjects;
end;

begin
get_subjects('ИСиТ');
end;

create or replace function GET_NUM_TEACHERS_BY_FAC (FCODE FACULTY.FACULTY%TYPE) RETURN NUMBER
is
count_teacher number;
begin
select count(*) into count_teacher from TEACHER
inner join PULPIT on TEACHER.PULPIT = PULPIT.PULPIT 
where PULPIT.FACULTY = FCODE;
return count_teacher;
end;

begin
dbms_output.put_line('Количество: '||GET_NUM_TEACHERS_BY_FAC('ИДиП'));
end; 

create or replace function GET_NUM_SUBJECT(PCODE SUBJECT.PULPIT%TYPE) RETURN NUMBER
is
count_subj number;
begin
select count(*) into count_subj from SUBJECT
where SUBJECT.PULPIT = PCODE;
return count_subj;
end;

begin
dbms_output.put_line('Количество: '||GET_NUM_SUBJECT('ИСиТ'));
end; 


create or replace package TEACHERS as
PROCEDURE GET_TEACHERS_BY_FACULTY(FCODE FACULTY.FACULTY%TYPE);
PROCEDURE GET_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE);
FUNCTION GET_NUM_TEACHERS(FCODE FACULTY.FACULTY%TYPE) RETURN NUMBER;
FUNCTION GET_NUM_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE) RETURN NUMBER;
end TEACHERS;

create or replace package body TEACHERS as

function GET_NUM_TEACHERS(FCODE FACULTY.FACULTY%TYPE) return number is tcount_number number;
begin 
select count(*)into tcount_number from teacher join pulpit on teacher.pulpit = pulpit.pulpit where pulpit.faculty = FCODE;
return tcount_number;
end GET_NUM_TEACHERS;
  
function GET_NUM_SUBJECTS (PCODE SUBJECT.PULPIT%TYPE) return number is s_number number;
begin 
select count(*) into s_number from subject where subject.pulpit = PCODE;
return s_number;
end GET_NUM_SUBJECTS;
          
procedure GET_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE) is 
cursor subject_cursor is select subject, pulpit from subject where pulpit = PCODE;
c_subject subject.subject%type;
c_pulpit subject.pulpit%type;
begin 
open subject_cursor;
fetch subject_cursor into c_subject, c_pulpit;
loop
dbms_output.put_line(' ' || c_subject || ' ---> ' || c_pulpit);
fetch subject_cursor into c_subject, c_pulpit;
exit when subject_cursor%notfound;
end loop;
close subject_cursor;
end GET_SUBJECTS;

procedure GET_TEACHERS_BY_FACULTY (FCODE FACULTY.FACULTY%TYPE) 
is cursor teacher_cursor 
is select teacher.teacher_name, pulpit.faculty from teacher inner join pulpit on teacher.pulpit = pulpit.pulpit where pulpit.faculty = FCODE;
teach_curs teacher.teacher_name%type;
facult_cursor pulpit.faculty%type;
begin 
open teacher_cursor;
fetch teacher_cursor into teach_curs, facult_cursor;   
loop 
dbms_output.put_line(' ' || teach_curs || ' ---> ' || facult_cursor);
fetch teacher_cursor into teach_curs, facult_cursor;
exit when teacher_cursor%notfound;
end loop;
close teacher_cursor;    
end GET_TEACHERS_BY_FACULTY;

END TEACHERS;


begin
TEACHERS.GET_TEACHERS_BY_FACULTY('ИДиП');
end;

