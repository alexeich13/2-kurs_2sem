alter session set "_ORACLE_SCRIPT"=true;
alter session set "_ORACLE_SCRIPT"=false;

CREATE TABLESPACE TS_ADI
    DATAFILE 'C:\app\orcl_wald\tablespaces\TS_ADI.dbf'
    SIZE 30M
    AUTOEXTEND ON NEXT 5M
    MAXSIZE 50M
    EXTENT MANAGEMENT LOCAL;

CREATE ROLE RL_ADI;
GRANT CREATE SESSION,
    CREATE TABLE,
    CREATE VIEW,
    CREATE SEQUENCE,
    CREATE SYNONYM,
    CREATE CLUSTER,
    CREATE PROCEDURE TO RL_ADI;
CREATE PROFILE PF_ADI LIMIT
    PASSWORD_LIFE_TIME 180
    SESSIONS_PER_USER 3
    FAILED_LOGIN_ATTEMPTS 7
    PASSWORD_LOCK_TIME 1
    PASSWORD_REUSE_TIME 10
    PASSWORD_GRACE_TIME DEFAULT
    CONNECT_TIME 180
    IDLE_TIME 30;
CREATE USER ADI IDENTIFIED BY 75980
    DEFAULT TABLESPACE TS_ADI QUOTA UNLIMITED ON TS_ADI
    PROFILE PF_ADI
    ACCOUNT UNLOCK;
GRANT RL_ADI TO ADI;

SELECT * fROM dba_roles;
SELECT * FROM dba_sys_privs;
SELECT * FROM dba_profiles;
SELECT username, account_status, lock_date FROM dba_users;

DROP USER ADI CASCADE;
DROP PROFILE PF_ADICASCADE;
DROP ROLE RL_ADI;

create global temporary table Example(
lesson char(10 byte) not null,
lesson_name varchar2(30 byte),
constraint key_lesson primary key (lesson)
)

insert into Example values
('1', 'OOP');
insert into Example values
('2', 'KMS');
commit;

drop table Example;


create sequence S1
increment by 10
start with 1000
nomaxvalue
nominvalue
nocycle
nocache
noorder;

select S1.currval from dual; 
select S1.nextval from dual;

drop sequence S1;

create sequence S2
increment by 10
start with 10
maxvalue 100
nocycle;

select S2.currval from dual; 
select S2.nextval from dual;

drop sequence S2;

create sequence S3
increment by -10
start with 10
minvalue -100
maxvalue 100
nocycle
order;

select S3.currval from dual; 
select S3.nextval from dual;

drop sequence S3;

create sequence S4
increment by 1
start with 10
minvalue 10
maxvalue 15
cycle
cache 5
noorder;

select S4.currval from dual; 
select S4.nextval from dual;

drop sequence S4;

select * from SYS.user_sequences;

create table T1(
N1 number(20),
N2 number(20),
N3 number(20),
N4 number(20)
) cache storage(buffer_pool keep);
begin
  for i in 1..7 loop
  insert into T1(N1, N2, N3, N4) values (S1.nextval, S2.nextval, S3.nextval, S4.nextval);
  end loop;
end;

select * from T1;

create cluster ABC 
(
X number(10),
V varchar2(12)
) hashkeys 200;

create table A(
XA number (10),
VA varchar2(12),
a varchar2(10)
) cluster ABC (XA, VA);

drop table A;

create table B(
XB number (10),
VB varchar2(12),
b varchar2(10)
) cluster ABC (XB, VB);

create table C(
XC number (10),
VC varchar2(12),
c varchar2(10)
) cluster ABC (XC, VC);

select * from user_clusters;
select * from user_tables;

create synonym syn for ADI.C; 
select * from syn;
select * from user_synonyms; 

drop synonym syn;

create public synonym syn3 for ADI.B; 
select * from syn3;

drop synonym syn2;
grant create public synonym to RL_ADI;

create table A1(x number(10), y varchar(12),constraint x_pk primary key (x));
create table B1(x number(10),y varchar(12), constraint x_fk foreign key (x) references A1(x));

insert into A1 (x, y) values (1,'a');
insert into A1 (x, y) values (2,'b');
insert into A1 (x, y) values (3,'c');
insert into B1 (x, y) values (1,'a');
insert into B1 (x, y) values (2,'b');
insert into B1 (x, y) values (3,'c');

select * from A1;
select * from B1;

create view V1 as select A1.y as A, B1.y as B, A1.x from A1 inner join B1 on A1.x=B1.x;
select * from V1;

create materialized view MV_ADI
build immediate 
refresh complete on demand next sysdate + numtodsinterval (2, 'minute')
as select * from A1;

select * from MV_ADI;

insert into A1 (x, y) values (4,'d');

grant create materialized view to RL_ADI;

grant create public database link to ADI;

CREATE DATABASE LINK PAVEL 
CONNECT TO C##A
IDENTIFIED BY PASSWORD 
USING 'PAVEL';

select name from v$database;

create table conn_link(
   id_str int primary key,
   data_str varchar2(20) 
);

insert into conn_link values(1, 'Something');

select * from conn_link@PAVEL;





