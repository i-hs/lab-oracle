-- 도구 -> SQL 워크시트(Alt F10) 생성

-- 테이블에서 데이터 검색

--사원 테이블(emp)에서 사번(empno)과 사원이름(ename)을 검색
/*
select empno, ename from emp;

desc emp;

     select empno as 사번, ename as 이름, sal as 월급, sal*12 as 연봉 from emp;
     
select ename, sal*12, comm, (sal*12+comm) as TotalSalary 
from emp  ;*/

select distinct job  
from emp ;

select distinct job, deptno from emp;