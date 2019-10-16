--1
CREATE TABLE emp2
AS SELECT * FROM emp;

create table dept2
as select * from dept;

create table salgrade2
as select * from salgrade;

--2
insert into dept2(deptno, dname, loc)
values (50,'ORACLE','Seoul');
insert into dept2(deptno, dname, loc)
values (60,'SQL','Jeju');
insert into dept2(deptno, dname, loc)
values (70,'DDL','Busan');
insert into dept2(deptno, dname, loc)
values (80,'DML','Incheon');

--3
insert into emp2(empno, ename, job, mgr, hiredate, sal, comm)
values(8000,'RYAN','MANAGER',7698,'1991/04/06',2580,NULL);


insert into emp2(empno, ename, job, mgr, hiredate, sal, comm,deptno)
values(8002,'JOJOSHIM','MANAGER',7697,'1995/08/01',7050,800,70);

--4
UPDATE emp2
set deptno = 80
where sal>(select avg(sal) from emp2 where deptno = 20);

--5
update emp2
set sal = 1.1*sal, deptno = 70
where hiredate>(select max(hiredate) 
                from emp2 where deptno=10);

--6
select e.empno, e.sal, s.grade
from emp2 e join salgrade2 s
on e.sal between s.losal and s.hisal 
where s.grade =4;

delete from emp2
where sal between (select losal from salgrade2  where grade=5) 
            and   (select hisal from salgrade2 where grade=5);

delete from emp2
where empno in 
    (select e.empno
    from emp2 e join salgrade2 s
    on e.sal between s.losal and s.hisal
    where s.grade =5);
commit;

UPDATE dept2
set loc = '¼­¿ïSeoul'
 where deptno = 50;
 select * from dept2;
 
commit;

insert into dept2
values (90, 'tiwill', 'gangnam');
select * from dept2;
commit;

update dept2 set loc = '´º¿å' where deptno = 10;
