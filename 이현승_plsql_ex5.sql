/*
ex 5. 
(1) �̸��� SCOTT �� ����� �̸��� �μ� ��ġ�� ����ϴ� SQL �ۼ�.

(2) �̸��� prompt�� �����, �ش����� �μ� ��ġ�� ����ϴ� PL/SQL �ۼ�. ��, �̸��� �ҹ��ڷ� �Է��ص� ����ǰ� �ۼ�.
(��)
�̸� �Է� ~ scott
SCOTT�� DALLAS���� �ٹ��մϴ�
*/
--(1)
select e.ename, d.loc 
from emp e, dept d
where e.ename ='SCOTT' and e.deptno = d.deptno;

--(2)
accept p_name prompt '�̸��� �Է��ϼ��� : ';

declare v_loc dept.loc%type;
        v_name emp.ename%type :=upper('&p_name');
begin
select d.loc into v_loc 
from dept d, emp e 
where e.ename=v_name and d.deptno=e.deptno;

dbms_output.put_line(v_name||'�� '||v_loc||'���� �ٹ��մϴ�.');
end;
/
