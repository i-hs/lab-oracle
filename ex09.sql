-- subquery
-- ����� 7369���� ����� �Ŵ��� ����� ã�ƶ�
  select empno, ename
  from emp
  where empno = (select mgr  from emp
                            where empno = 7369);

-- ��� ���̺��� ��� �޿����� �� ���� �޿��� �޴� �����鸸 ���
SELECT empno, ename, job, sal
from emp
where sal >= (select avg(sal)
                    from emp)
order by sal desc;

-- Allen����  Comm ���� �޴� ����
select * from emp
where /*comm is not null and */
        comm > ( select comm from emp where ename = 'ALLEN');

select ENAME, JOB, SAL from emp
where sal < ANY ( select sal from emp
                        where job = 'ANALYST');
SELECT MIN(SAL)
FROM emp
WHERE job = 'ANALYST';



select * from emp
where sal in (
        select min(sal) from emp
        group by deptno
);

-- �� �μ����� �޿� �ּڰ��� �޴� ���� ������ ���
select * from emp where (deptno,sal) in (
select deptno, min (sal) from emp group by deptno);

select * from emp
where (deptno, sal) in (
    select deptno, min(sal) from emp group by deptno
);


select * from emp where (deptno,sal) not in (
select deptno, min(sal) from emp group by deptno)
order by sal desc;

select min(sal) from emp group by deptno;

select * from emp
where sal = any (select min(sal) from emp group by deptno);

