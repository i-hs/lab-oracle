--제약 조건
select constraint_name, constraint_type, table_name
from user_constraints;

select table_name from user_tables order by table_name;

-- 제약조건

 create table ex03(
    col1 number unique,
    col2 varchar2(20) not null
  );
  
desc ex03;

insert into ex03 (col1, col2)
values (1,col2);

insert into ex03
values (2,0);

select constraint_name, constraint_type, table_name
from user_constraints;

select * from ex03;
desc ex03;
insert into ex03 (col1, col2) values(1,'bbb');
commit;

-- 
create table ex04(
    col1 number constraint ex04_unq unique,
    col2 varchar2(20) constraint ex04_nn not null
);
DESC EX04;

create table ex05(
    col1 number constraint ex05PK primary key,
    col2 varchar2(10)
);
desc ex05;

insert into ex05
values ( 1, 'aying');

select * from ex05; 
insert into ex05(col2) values('a'); commit; select * from ex04;

create table ex06 (
    col varchar2(20) constraint EX06_ck check(length(col)>=8)
);

insert into ex06 values ('abcdefge');
select * from ex06;

data insertinsert into ex06 values ('abcdefge');
insert into ex06 values ('abcdefge');

-- 테이블 이름 : ex07 
-- 컬럼 : ex_id - number, 기본값 0

create table ex07 (
    ex_id number default 0,
    ex_date date default sysdate
);

insert into ex07 values(1,to_date('2009-09-30','yyyy-mm-dd'));
insert into ex07(ex_id) values(3);
insert into ex07(ex_date) values (sysdate+1);

select * from ex07;


create table ex_dept(
    deptno number constraint ex_dptno_PK primary key,
    dname varchar2(100)
);

create table ex_emp(
    empno number                                            constraint pk_ex_emp primary key,
    ename varchar2(20),
    deptno number                                            constraint fk_ex_dept references ex_dept(deptno)
);

insert into ex_dept (deptno, dname) values (2,'ACCOUNT');
insert into ex_emp values (1001, '오쌤', 1);
insert into ex_dept values (5, 'finance');
insert into ex_emp values (1005, '바루스', 5);

select * from ex_dept;
