-- ���̺� ����
-- ���̺��� �÷� �̸� ����
alter table ex2
    rename to ex02;
    
-- ���̺��� �÷� ������ Ÿ�� ����
alter table ex02 modify ex_text varchar2(100);

desc ex02;

-- ���̺� ���ο� �÷� �߰�
alter table ex02 add ex_date date;

-- ���̺��� �÷� ���� 
alter table ex02 drop column ex_date;

--�������� �߰�
alter table ex02
add constraint pk_ex02 primary key (eid);

-- not null ������������ ����
alter table ex02
add constraint nn_ex02 check (ex_text is not null);

--�������� ����
alter table ex02
drop constraint nn_ex02;

-- ���̺� vs ����� ����
alter user scott 
identified by tiger account unlock;

alter table ex_emp3
rename to exmp;
--1
create table hw_emp3
as select * from emp 
where 1=10;

--2
alter table hw_emp
add etc varchar2(20);

--3 
alter table hw_emp
modify etc varchar2(100);

--4
alter table hw_emp
rename column etc to remark;

--5
insert into hw_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)-->���Ե��� ���� Į���� �ڵ�����  null
select * from emp; 

--6 
alter table hw_emp
add constraint uni_epn unique(empno);

--7
drop table hw_emp3;

create sequence seq1;
select seq1.nextval from dual;


insert into ex02(eid, ex_text)
values(seq1.nextval,'acbd');

