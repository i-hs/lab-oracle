--1. employees ���̺��� ����� 179���� ����� ���ڵ带 ���
select * 
from employees
where employee_id = 179;

--2. 1���� ã�� ������ ����ؼ� 179�� ����� ��å �̸��� �ٸ� ���̺��� �˻��ؼ� ���
select job_title
FROM jobs
WHERE job_id = 'SA_REP';

--3. 1���� ã�� ������ ����ؼ� 179�� ����� ���ϴ� �μ��� ������ �ٸ� ���̺��� �˻��ؼ� ��� 
select department_name
FROM departments
WHERE department_id = 80;

--4. 1���� ã�� ������ ����ؼ� 179�� ����� �Ŵ��� ������ �˻��ؼ� ���
SELECT *
FROM employees
WHERE employee_id = 149;

--5. departments ���̺��� manager_id�� �����ϴ� ���ڵ���� ���
select *
FROM departments
WHERE manager_id IS NOT NULL;

--6. departments ���̺��� �μ���ȣ�� 20���� �μ��� ���ڵ带 ���
SELECT *
FROM departments
WHERE department_id = 20;

--7. 6���� ã�� ������ ����ؼ� 20�� �μ��� �������� ������ �ٸ� ���̺��� �˻��ؼ� ���
SELECT *
FROM employees
WHERE employee_id = 201;

--8. 6���� ã�� ������ ����ؼ� 20�� �μ� ��ġ�� �ּ� ������ �ٸ� ���̺��� �˻��ؼ� ���
SELECT *
FROM locations
WHERE location_id = 1800;


LOWER ('SQL Course'):
