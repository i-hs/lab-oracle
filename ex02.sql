-- ���� -> SQL ��ũ��Ʈ(Alt F10) ����

-- ���̺��� ������ �˻�

--��� ���̺�(emp)���� ���(empno)�� ����̸�(ename)�� �˻�
/*
select empno, ename from emp;

desc emp;

     select empno as ���, ename as �̸�, sal as ����, sal*12 as ���� from emp;
     
select ename, sal*12, comm, (sal*12+comm) as TotalSalary 
from emp  ;*/

select distinct job  
from emp ;

select distinct job, deptno from emp;