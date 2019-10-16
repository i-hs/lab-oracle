set serveroutput on;
--9/27
--EMP ���̺�� DEPT ���̺���
-- ���, �̸�, �޿�, �μ� �̸�, �μ� ��ġ
-- �������� ������ �� �ִ� ���ڵ�(emp_dept)�� ����
-- ����(join) ������ �ۼ��ؼ� 7788�� ����� scott�� ������ ����ϴ� pl/sql�� �ۼ�
declare
    type my_record  is record (
        empno emp.empno%type,
        ename emp.ename%type,
        sal     emp.sal%type,
        dname   dept.dname%type,
        loc     dept.loc%type
    );
        v_record my_record;
begin
    select e.empno, e.ename, e.sal, d.dname, d.loc
    into v_record
    from emp e , dept d 
    where e.deptno = d.deptno and e.empno = 7788;
  
    dbms_output.put_line( v_record.empno||','|| 
                            v_record.ename||','||
                            v_record.sal||','||
                            v_record.dname||' ,'||
                            v_record.loc);

end;
/
--9/30 
--�Ǻ���ġ���� 20���� ����ϰ� f(n)/f(n+1) ����ϱ�
declare
a number := 1;
b number := 1;
begin
    for i in range 1..20 loop
         := 
end;
/
create table order_items2(
    order_id number(12),
    product_id number(10),
    quantity number(4) default 0,
    constraint o_it_pk primary key ( order_id, product_id)
);


--employees ���μ� ���̺��� �޿� �ּҰ� �޴�, (employee_id, first_name, department_id, salary) ���
select employee_id, first_name, department_id, salary
from employees 
where (department_id, salary) in
    (select department_id, min(salary) from employees group by department_id);




