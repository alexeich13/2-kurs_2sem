
grant all privileges to ADI;

create table table_14(
id number primary key,
data varchar2(40)
);

insert into table_14 (id, data)
values(1, 'one');
insert into table_14 (id, data)
values(2, 'two');
insert into table_14 (id, data)
values(3, 'three');
insert into table_14 (id, data)
values(4, 'four');
insert into table_14 (id, data)
values(5, 'five');
insert into table_14 (id, data)
values(6, 'six');
insert into table_14 (id, data)
values(7, 'seven');
insert into table_14 (id, data)
values(8, 'eight');
insert into table_14 (id, data)
values(9, 'nine');
insert into table_14 (id, data)
values(10, 'ten');

create or replace trigger insert_table_14
before insert on table_14
begin
dbms_output.put_line('insert_table_14');
end;

create or replace trigger update_table_14
before update on table_14
begin
dbms_output.put_line('update_table_14');
end;

create or replace trigger delete_table_14
before delete on table_14
begin
dbms_output.put_line('delete_table_14');
end;

create or replace trigger insert_table_14_each_row
before insert on table_14
for each row
begin
dbms_output.put_line('insert_table_14_each_row');
end;

create or replace trigger update_table_14_each_row
before update on table_14
for each row
begin
dbms_output.put_line('update_table_14_each_row');
end;

create or replace trigger delete_table_14_each_row
before delete on table_14
for each row
begin
dbms_output.put_line('delete_table_14_each_row');
end;

create or replace trigger table_14_predicate
before insert or update or delete on table_14
begin
if inserting then
dbms_output.put_line('table_14_predicate_insert');
elsif updating then
dbms_output.put_line('table_14_predicate_update');
elsif deleting then
dbms_output.put_line('table_14_predicate_delete');
end if;
end;

insert into table_14(id, data)
values(11, 'eleven');
delete from table_14 where id = 11;

create or replace trigger table_14_predicate_after
after insert or update or delete on table_14
begin
if inserting then
dbms_output.put_line('table_14_predicate_insert_after');
elsif updating then
dbms_output.put_line('table_14_predicate_update_after');
elsif deleting then
dbms_output.put_line('table_14_predicate_delete_after');
end if;
end;

create or replace trigger insert_table_14_each_row_after
after insert on table_14
for each row
begin
dbms_output.put_line('insert_table_14_each_row_after');
end;

create or replace trigger update_table_14_each_row_after
after update on table_14
for each row
begin
dbms_output.put_line('update_table_14_each_row_after');
end;

create or replace trigger delete_table_14_each_row_after
after delete on table_14
for each row
begin
dbms_output.put_line('delete_table_14_each_row_after');
end;

insert into table_14(id, data)
values(11, 'eleven');
delete from table_14 where id = 11;

create table AUDIT_(
OperationDate timestamp,
OperationType varchar2(40),
TriggerName varchar2(30),
Data varchar2(200)
)

create or replace trigger insert_table_14_row
before insert on table_14
for each row
begin
insert into AUDIT_(OperationDate, OperationType, TriggerName, Data)
values (SYSTIMESTAMP, 'insert', 'insert_table_14_row', :OLD.id || ', ' || :OLD.data || ' -> ' || :NEW.id || ', ' || :NEW.data);
end;

create or replace trigger update_table_14_row
before update on table_14
for each row
begin
insert into AUDIT_(OperationDate, OperationType, TriggerName, Data)
values (SYSTIMESTAMP, 'update', 'update_table_14_row', :OLD.id || ', ' || :OLD.data || ' -> ' || :NEW.id || ', ' || :NEW.data);
end;

create or replace trigger delete_table_14_row
before delete on table_14
for each row
begin
insert into AUDIT_(OperationDate, OperationType, TriggerName, Data)
values (SYSTIMESTAMP, 'delete', 'delete_table_14_row', :OLD.id || ', ' || :OLD.data || ' -> ' || :NEW.id || ', ' || :NEW.data);
end;

insert into table_14(id, data)
values(11, 'eleven');
delete from table_14 where id = 11;

select * from AUDIT_;

insert into table_14(id, data)
values (2, 'Nick');

create or replace trigger prevent_drop_table
before drop on database
declare
v_obj_type varchar2(30);
begin
select object_type into v_obj_type
FROM user_objects
WHERE object_name = 'table_14';

drop trigger prevent_drop_table;

if v_obj_type = 'TABLE' then
RAISE_APPLICATION_ERROR(-20001, 'Table table_14 cannot be dropped');
end if;
end;

drop table table_14;

drop table AUDIT_;

select * from user_triggers;

create view table_14_view as select * from table_14;

select * from table_14_view;

create or replace trigger instead_of_update
instead of update on table_14_view
for each row
begin
if updating then
dbms_output.put_line('update:'||rtrim(:old:data) ||'->'||:new.data);
end if;
end instead_of_update;

update table_14_view set data = 'KKK' where id = 5;

drop trigger instead_of_update;

CREATE OR REPLACE TRIGGER trigger1
BEFORE INSERT ON table_14
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Trigger 1 executed');
END;
/

-- Создание второго триггера
CREATE OR REPLACE TRIGGER trigger2
BEFORE INSERT ON table_14
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Trigger 2 executed');
END;
/

-- Создание третьего триггера
CREATE OR REPLACE TRIGGER trigger3
BEFORE INSERT ON table_14
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Trigger 3 executed');
END;

insert into table_14(id, data)
values(20, 'twenty');

ALTER TRIGGER trigger2 SET PRIORITY 1;
ALTER TRIGGER trigger1 SET PRIORITY 2;


CREATE TABLE example_table (
  id NUMBER,
  name VARCHAR2(100),
  value NUMBER
);

CREATE TRIGGER trigger11
BEFORE INSERT ON example_table
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Trigger 11 executed');
END;

CREATE TRIGGER trigger33
BEFORE INSERT ON example_table
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Trigger 33 executed');
END;


insert into example_table (id, name, value)
values(5, 'one', 11);

drop trigger trigger11;
drop trigger trigger22;
drop trigger trigger33;

CREATE TRIGGER trigger22
BEFORE INSERT ON example_table
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Trigger 22 executed');
END;
