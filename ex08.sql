-- ��� ����� �޿��� �� �հ�

select sum(sal), round(avg(sal),2), max(sal), min(sal), round(variance(sal),4), round(stddev(sal),3)
from emp;

select ename
from emp
where sal=MAX(sal);

select count (mgr) from emp;
select count (deptno), count(distinct deptno) from emp;

select empno, count(empno) from emp; -- ���� ������ �ٸ��� ������ ������ �߻�.
select max(hiredate), min(hiredate) from emp; -- ������ �� ���� ��, �̷��� �� ū ��.
SELECT * FROM emp order by deptno;

select * from emp order by deptno asc, empno desc; -- ���� ������ �÷� �������� ���� ��, �� ��° �������� �ٽ� ����


select  deptno, sum(sal)"sum", min(sal)"min" from emp
group by deptno;

select job, round(avg(sal),3), max(sal), min(sal)
from emp
group by job
order by avg(sal) desc; 

select job, mgr, avg(sal)
from emp
where mgr is not null
group by mgr, job
order by avg(sal) desc;

select deptno, avg(sal)
from emp
group by deptno
having avg(sal)>=2000;


-- �����ϱ� , �Ի翬���� ���� ��� �޿�
select avg(sal), to_char(hiredate,'yy') as hireyear
from emp
group by to_char(hiredate,'yy')
order by hireyear asc;

--�μ���, ��å�� ��� �޿�
select deptno, job, avg(sal)
from emp
where job != 'PRESIDENT'
group by deptno, job
order by avg(sal) desc;

--1) �μ���ȣ, �μ��� ��� �޿�, �μ��� �ְ�/�ּ� �޿�, ����� ���, �μ���ȣ ������������ ���, �Ҽ����� �ݿø��ؼ� ���ڸ�����
select deptno, round(avg(sal),'1'), max(sal), min(sal), count(deptno)
from emp
group by deptno
order by deptno asc;

--2) ���� ��å�� ���� ������� 3�� �̻��� ��å�� ���ؼ�, ��å�� ������� ���
select job, count(job)
from emp
group by job        --  �׷��� ���� ���� ����, ī��Ʈ�� 3������ ���ϹǷ� having���� ������ ���;� �Ѵ�.
having count(job)>=3;

--3) �Ի� ������ �޿� ���, �޿� �ּ�/ �ִ��� ���. �Ի翬���� 'yyyy' ��������
select to_char(hiredate,'yyyy') as "�Ի翬��" , round(avg(sal),'2'), max(sal), min(sal)
from emp
group by to_char(hiredate,'yyyy')
order by �Ի翬�� asc;

--4) �Ի� ������, �μ����� �� ���� �Ի��ߴ����� ���
select to_char(hiredate,'yyyy') as "�Ի� ����", deptno, count(deptno) as "�Ի��ο�"
from emp
group by to_char(hiredate,'yyyy'), deptno
order by to_char(hiredate,'yyyy')  asc;

--5) ����(comm)�� �޴� ���� ���� ���� �ʴ� ���� ���� ���
select nvl2(comm,'get comm','not comm'), count(*)
from emp
group by nvl2(comm,'get comm','not comm')
;

select  count(ename), comm
from emp
where comm is  null
group by comm

    union
    
select  count(ename), comm
from emp
where comm is not null
group by comm
;

