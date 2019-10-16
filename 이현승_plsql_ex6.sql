/* ex 6. 
(1) 각 사원의 근속년수를 알아보고자 합니다. 아래와 같이 출력되도록 SQL을 작성하세요.
EMONO   ENAME   HIREDATE                YEAR
7369	SMITH	1980-12-17 00:00:00	38
7499	ALLEN	1981-02-20 00:00:00	38
......
*/

select empno, ename, hiredate, trunc(MONTHS_BETWEEN(SYSDATE,hiredate)/12,0) as years
from emp;

/*

(2) 부서별 가장 빠른 입사 날짜를 출력하는 SQL을 작성
DEPTNO  MIN_HIREDATE
10	1981-06-09 00:00:00
20	1980-12-17 00:00:00
30	1981-02-20 00:00:00
*/

select deptno, min(hiredate) as min_hiredate
from emp 
group by deptno
order by min_hiredate asc;

/*
(3) 10번 부서에서 입사 날짜가 가장 빠른 직원의 부서 번호, 사번, 이름, 근속년수를 출력하는 SQL을 작성
(결과 예시)
10, 7782, CLARK, 38
*/
select deptno, empno, ename, trunc(MONTHS_BETWEEN(SYSDATE,hiredate)/12,0) as years
from emp
where hiredate=(select min(hiredate) from emp);
/*
(4) 각 부서에서 입사 날짜가 가장 빠른 직원의 부서 번호, 사번, 이름, 근속년수를 출력하는 PL/SQL을 작성
(결과 예시)
10, 7782, CLARK, 38
20, 7369, SMITH, 38
30, 7499, ALLEN, 38
(x)
*/
declare
    cursor prt_hireyear(
        select deptno, empno, ename,hiredate, trunc((sysdate-hiredate)/12) as years
        from emp
        where (deptno,hiredate) in (select deptno, min(hiredate) from emp group by deptno )
    );

begin
    for i in prt_hireyear loop
        dbms_output.put_line(i.deptno || ' '|| i.empno || ' ' || i.ename ||' '|| i.years);
    end loop;

end;
/