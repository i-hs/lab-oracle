--join
--Oracle == Cross Join ( Cartesian Product )
select *
from emp e dept d;

-- 표준 방식 (ANSI) Cross Join
select *
from emp cross join dept;

--Oracle 방식의 Join
select * 
from emp, dept
where emp.deptno = dept.deptno
order by empno;

-- ANSI 방식의 Join
select *
from emp join dept
on emp.deptno = dept.deptno
order by empno;

select e.empno, e.ename, e.deptno, d.dname
from emp e , dept d
where e.deptno = d.deptno
order by e.empno;

select e.empno, e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno
order by e.empno;

-- emp 테이블과 dept 테이블에서
-- 사번 이름 급여 부서번호 부서이름
-- 단 급여가 2000 이상인 직원만
select e.empno, e.ename, e.deptno, e.sal, d.dname
from emp e , dept d
where e.deptno = d.deptno and e.sal>=2000
order by e.empno;

select e.empno, e.ename, e.deptno, e.sal, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.sal>=2000
order by e.empno;

-- EMP 테이블과 SALGRADE 테이블에서 
-- 사번 이름 급여 급여등급 출력

select e.empno, e.ename, e.sal, s.grade
from emp e , salgrade s
where e.sal >= s.losal and e.sal <= s.hisal
order by e.sal;

select  e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal >= s.losal and e.sal <= s.hisal
order by e.sal;

-- 사번 이름 부서번호 부서이름 급여 급여등급 출력

select e.empno, e.ename, d.deptno, d.dname, e.sal, s.grade
from emp e , salgrade s, dept d
where e.sal >= s.losal and e.sal <= s.hisal and d.deptno = e.deptno
order by e.sal;

select  e.empno, e.ename, d.deptno, d.dname, e.sal, s.grade
from emp e join salgrade s on e.sal >= s.losal and e.sal <= s.hisal join dept d on d.deptno = e.deptno
order by e.sal;

-- 사번, 이름, 매니저 사번, 매니저 이름 출력
select e.empno, e.ename, m.empno, m.ename
from emp e, emp m
where e.mgr = m.empno;

select e.empno, e.ename, m.empno, m.ename "mgr name"
from emp e join emp m on e.mgr = m.empno;

-- emp, dept 테이블에서 사번, 이름, 부서번호, 부서이름을 출력
-- dept 테이블의 모든 부서 정보를 출력
--Oracle
select e.empno, e.ename, e.deptno, d.dname
from emp e, dept d
where  e.deptno (+)= d.deptno;


--ANSI
select  e.empno, e.ename, e.deptno, d.dname
from emp e right join dept d
    on e.deptno = d.deptno;
    
--Oracle2
select e.empno, e.ename, e.deptno, d.dname
from dept d, emp e
where  d.deptno = e.deptno(+) ;

-- emp 테이블에서 사번, 이름, 매니저 사번, 매니저 이름 
-- 매니저가 존재하지 않는 king의 정보도 함께 출력한다.
select e1.empno, e1.ename, e1.mgr,  e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);
--없으면 null로 추가하겠다.

--ANSI 
select from e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1 left join emp p2
on e1.mgr = e2.empno;


select e1.empno, e1.ename, e1.mgr,  e2.ename
from emp e1, emp e2
where e1.mgr(+) = e2.empno;

--full outer join
-- full join은 ANSI 방식의 문법만 있고, Oracle 방식의 문법은 없음. 
-- Oracle 방식에서는 Union 문법을 활용해야 한다.
select e1.empno, e1.ename, e2.empno, e2.ename
from emp e1 full join emp e2
    on e1.mgr = e2.empno;


--1
select e.deptno, d.dname, round(avg(e.sal),1), max(e.sal), min(e.sal), count(*)
from emp e, dept d
where e.deptno = d.deptno
group by e.deptno, d.dname;

select e.deptno, d.dname, round(avg(e.sal),1), max(e.sal), min(e.sal), count(*)
from emp e join dept d on e.deptno = d.deptno
group by e.deptno, d.dname;

--2
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e, dept d
where e.deptno(+) = d.deptno;

select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e right join dept d on e.deptno = d.deptno;

--3
select d.deptno, d.dname, e.empno, e.ename, e.mgr, m.ename "mgrName", e.sal, s.grade
from emp e right join  dept d on e.deptno = d.deptno 
                    left   join emp m on e.mgr = m.empno
                    left   join salgrade s on e.sal between s.losal and s.hisal
order by deptno asc   ;


select d.deptno, d.dname, e.empno, e.ename, e.mgr, m.ename "mgrName", e.sal, s.grade
from emp e , dept d , emp m , salgrade s
where e.deptno(+) = d.deptno and 
          e.mgr = m.empno(+) and
          e.sal between  s.losal(+) and s.hisal(+)
order by deptno asc;


--4-1 hr계정
select e.employee_id, e.first_name, e.last_name, e.job_id, j.job_title, h.start_date, h.end_date
from employees e, job_history h, jobs j
where e.job_id=j.job_id and e.employee_id = h.employee_id;

select e.employee_id, e.first_name, e.last_name, e.job_id, j.job_title, h.start_date, h.end_date
from employees e join jobs j on  e.job_id=j.job_id
                          join job_history h on e.employee_id = h.employee_id;


--4-2 hr ?????????
/*
select d.department_id, d.department_name, m.manager_id, m.first_name, m.last_name
from employees e         join employees m on  e.manager_id=m.employee_id 
                          right join departments d on e.department_id = d.department_id
        order by department_id asc;
--where e.manager_id=m.employee_id and e.department_id(+) = d.department_id;


select d.department_id, d.department_name, m.manager_id, m.first_name, m.last_name
from employees e  , employees m ,departments d 
where e.department_id(+) = d.department_id and 
        e.manager_id=m.employee_id(+)
order by department_id asc
;
*/



