--join
--Oracle == Cross Join ( Cartesian Product )
select *
from emp e dept d;

-- ǥ�� ��� (ANSI) Cross Join
select *
from emp cross join dept;

--Oracle ����� Join
select * 
from emp, dept
where emp.deptno = dept.deptno
order by empno;

-- ANSI ����� Join
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

-- emp ���̺�� dept ���̺���
-- ��� �̸� �޿� �μ���ȣ �μ��̸�
-- �� �޿��� 2000 �̻��� ������
select e.empno, e.ename, e.deptno, e.sal, d.dname
from emp e , dept d
where e.deptno = d.deptno and e.sal>=2000
order by e.empno;

select e.empno, e.ename, e.deptno, e.sal, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.sal>=2000
order by e.empno;

-- EMP ���̺�� SALGRADE ���̺��� 
-- ��� �̸� �޿� �޿���� ���

select e.empno, e.ename, e.sal, s.grade
from emp e , salgrade s
where e.sal >= s.losal and e.sal <= s.hisal
order by e.sal;

select  e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal >= s.losal and e.sal <= s.hisal
order by e.sal;

-- ��� �̸� �μ���ȣ �μ��̸� �޿� �޿���� ���

select e.empno, e.ename, d.deptno, d.dname, e.sal, s.grade
from emp e , salgrade s, dept d
where e.sal >= s.losal and e.sal <= s.hisal and d.deptno = e.deptno
order by e.sal;

select  e.empno, e.ename, d.deptno, d.dname, e.sal, s.grade
from emp e join salgrade s on e.sal >= s.losal and e.sal <= s.hisal join dept d on d.deptno = e.deptno
order by e.sal;

-- ���, �̸�, �Ŵ��� ���, �Ŵ��� �̸� ���
select e.empno, e.ename, m.empno, m.ename
from emp e, emp m
where e.mgr = m.empno;

select e.empno, e.ename, m.empno, m.ename "mgr name"
from emp e join emp m on e.mgr = m.empno;

-- emp, dept ���̺��� ���, �̸�, �μ���ȣ, �μ��̸��� ���
-- dept ���̺��� ��� �μ� ������ ���
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

-- emp ���̺��� ���, �̸�, �Ŵ��� ���, �Ŵ��� �̸� 
-- �Ŵ����� �������� �ʴ� king�� ������ �Բ� ����Ѵ�.
select e1.empno, e1.ename, e1.mgr,  e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);
--������ null�� �߰��ϰڴ�.

--ANSI 
select from e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1 left join emp p2
on e1.mgr = e2.empno;


select e1.empno, e1.ename, e1.mgr,  e2.ename
from emp e1, emp e2
where e1.mgr(+) = e2.empno;

--full outer join
-- full join�� ANSI ����� ������ �ְ�, Oracle ����� ������ ����. 
-- Oracle ��Ŀ����� Union ������ Ȱ���ؾ� �Ѵ�.
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


--4-1 hr����
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



