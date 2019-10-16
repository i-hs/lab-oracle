-- 모든 사원들 급여의 총 합계

select sum(sal), round(avg(sal),2), max(sal), min(sal), round(variance(sal),4), round(stddev(sal),3)
from emp;

select ename
from emp
where sal=MAX(sal);

select count (mgr) from emp;
select count (deptno), count(distinct deptno) from emp;

select empno, count(empno) from emp; -- 행의 개수가 다르기 때문에 에러가 발생.
select max(hiredate), min(hiredate) from emp; -- 옛날이 더 적은 것, 미래가 더 큰 것.
SELECT * FROM emp order by deptno;

select * from emp order by deptno asc, empno desc; -- 먼저 나오는 컬럼 기준으로 정렬 후, 두 번째 기준으로 다시 정렬


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


-- 질문하기 , 입사연도에 따른 평균 급여
select avg(sal), to_char(hiredate,'yy') as hireyear
from emp
group by to_char(hiredate,'yy')
order by hireyear asc;

--부서별, 직책별 평균 급여
select deptno, job, avg(sal)
from emp
where job != 'PRESIDENT'
group by deptno, job
order by avg(sal) desc;

--1) 부서번호, 부서별 평균 급여, 부서별 최고/최소 급여, 사원수 출력, 부서번호 오름차순으로 출력, 소숫점은 반올림해서 한자리까지
select deptno, round(avg(sal),'1'), max(sal), min(sal), count(deptno)
from emp
group by deptno
order by deptno asc;

--2) 같은 직책을 갖는 사원수가 3명 이상인 직책에 대해서, 직책별 사원수를 출력
select job, count(job)
from emp
group by job        --  그룹을 먼저 짓고 나서, 카운트가 3인지를 평가하므로 having절에 조건이 나와야 한다.
having count(job)>=3;

--3) 입사 연도별 급여 평균, 급여 최소/ 최댓값을 출력. 입사연도를 'yyyy' 형식으로
select to_char(hiredate,'yyyy') as "입사연도" , round(avg(sal),'2'), max(sal), min(sal)
from emp
group by to_char(hiredate,'yyyy')
order by 입사연도 asc;

--4) 입사 연도별, 부서별로 몇 명이 입사했는지를 출력
select to_char(hiredate,'yyyy') as "입사 연도", deptno, count(deptno) as "입사인원"
from emp
group by to_char(hiredate,'yyyy'), deptno
order by to_char(hiredate,'yyyy')  asc;

--5) 수당(comm)을 받는 직원 수와 받지 않는 직원 수를 출력
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

