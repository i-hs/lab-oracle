
SELECT * FROM emp WHERE ename like 'A%';

SELECT *
FROM emp
WHERE hiredate LIKE '%/04/%';


SELECT *
FROM emp
WHERE comm is null;

SELECT EMPNO, ENAME, SAL
FROM emp
WHERE (COMM IS NULL) AND (SAL>1500);

SELECT * FROM emp WHERE deptno = 10 or deptno = 20;

SELECT * FROM emp WHERE deptno = 10 
UNION
SELECT * FROM emp WHERE deptno = 20;


--이름이 'E'를 포함하는 모든 직원 정보
SELECT * FROM emp WHERE ename LIKE '%E%'
INTERSECT
SELECT * FROM emp WHERE job LIKE '%E%';

SELECT * FROM emp WHERE ename LIKE '%E%' AND job LIKE '%E%';

SELECT * FROM emp WHERE job LIKE '%E%'
MINUS
SELECT * FROM emp WHERE ename LIKE '%E%';

SELECT * FROM emp WHERE job LIKE '%E%' AND (NOT ename LIKE '%E%');

--1)
SELECT EMPNO "사번", ENAME "이름", SAL "급여", DEPTNO "부서번호", JOB "직책"
FROM emp
WHERE deptno = 30 AND job = 'SALESMAN';

--2)
SELECT EMPNO "사번", ENAME "이름", SAL "급여", DEPTNO "부서번호"
FROM emp
WHERE deptno IN(20, 30) AND sal>2000;

--3)
SELECT *
FROM emp
WHERE (mgr IS NOT NULL) AND (comm IS NULL) AND (job IN ('CLERK', 'MANAGER'));

--SQL EX 02))))
--1)
DESC employees;

--2)
SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE 'J%';

--3)
SELECT employee_id, first_name, last_name, phone_number
FROM employees
WHERE phone_number LIKE '011%';

--4)
SELECT employee_id, first_name, last_name, manager_id, department_id
FROM employees
WHERE manager_id = 120 ;

--5)
SELECT * 
FROM employees
WHERE employee_id=120;

--6)
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary>=3000 and salary<=5000;

--7)
SELECT employee_id, first_name, last_name, salary, commission_pct, ((salary*12)*(1+commission_pct)) as annual_salary
FROM employees
WHERE (commission_pct IS NOT NULL);


