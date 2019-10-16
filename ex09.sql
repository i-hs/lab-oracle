-- subquery
-- 사번이 7369번인 사원의 매니저 사번을 찾아라
  select empno, ename
  from emp
  where empno = (select mgr  from emp
                            where empno = 7369);

-- 사원 테이블에서 평균 급여보다 더 많은 급여를 받는 직원들만 출력
SELECT empno, ename, job, sal
from emp
where sal >= (select avg(sal)
                    from emp)
order by sal desc;

-- Allen보다  Comm 많이 받는 직원
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

-- 각 부서에서 급여 최솟값을 받는 직원 정보를 출력
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

