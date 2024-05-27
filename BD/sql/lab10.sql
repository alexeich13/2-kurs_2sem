begin
null;
end;

begin
  dbms_output.put_line('Hello world');
end;

select keyword from v$reserved_words where length = 1 and keyword != 'A';

select keyword from v$reserved_words where length > 1 and keyword != 'A' order by keyword;

DECLARE
num_1 number(20):= 200;
num_2 number(20, -2):= 123324.8908;
num_3 INTEGER(3,2):=4.89;
fl_1 binary_float:=1.767899;
fl_2 binary_double:=1221788493.989677857;
degr number(5,10):=10E-10;
d_1 date := sysdate;
word_1 nvarchar2(5);
bool_check boolean := true;

begin
dbms_output.put_line('num_1 ' || num_1);
dbms_output.put_line('num_2 ' || num_2);
dbms_output.put_line('num_3 ' || num_3);
dbms_output.put_line('fl_1 ' || fl_1);
dbms_output.put_line('fl_2 ' || fl_2);
dbms_output.put_line('degr ' || degr);
dbms_output.put_line('d_1 ' || d_1);
dbms_output.put_line('word_1 ' || word_1);
if bool_check then
dbms_output.put_line('true');
else
dbms_output.put_line('false');
end if;
end;

declare
const_1 constant varchar(10):='Car';
const_2 constant number(5):=10;
const_3 constant int(8):=7;
begin
dbms_output.put_line('const_1 ' || const_1);
dbms_output.put_line('const_2 ' || const_2);
dbms_output.put_line('const_3 ' || const_3);
dbms_output.put_line('const_3 || const_3' || const_3 || const_3);
end;

declare 
type_1 FACULTY%ROWTYPE;
type_2 FACULTY.FACULTY_NAME%TYPE;

begin
type_2 := 'Инженерно-экономический факультет';
select * into type_1 from FACULTY where faculty = 'ТОВ';
dbms_output.put_line('faculty: ' || type_1.faculty || type_2);
end;

declare 
ex_1 number := 15;
ex_2 number := 20;
begin
if ex_1 > ex_2 then
dbms_output.put_line('ex1>ex2');
else
dbms_output.put_line('ex1>ex2');
end if;

if ex_1 < ex_2 then
dbms_output.put_line('ex1<ex2');
end if;

if ex_1 > ex_2 then
dbms_output.put_line('ex1>ex2');
elsif ex_1 < ex_2 then
dbms_output.put_line('ex1<ex2');
else
dbms_output.put_line('ex1=ex2');
end if;
end;


declare 
ord number(5) := 5;
begin
case ord
when 1 then
dbms_output.put_line('one');
when 2 then
dbms_output.put_line('two');
when 3 then
dbms_output.put_line('three');
when 4 then
dbms_output.put_line('four');
when 5 then
dbms_output.put_line('five');
end case;
end;

declare 
x integer := 0;
begin 
loop
x := x + 1;
dbms_output.put_line(x);
exit when x > 4;
end loop;
end;

declare 
a integer := 6;
begin
while(a > 0)
loop
a := a - 1;
dbms_output.put_line(a);
end loop;
end;

declare 
k integer;
begin
for k in 1..5
loop
dbms_output.put_line(k);
end loop;
end;

