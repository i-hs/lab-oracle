/*
ex 7.
(1) ���� �̸��� �� ������ �Ŵ��� �̸��� ����ϴ� SQL �ۼ�. ��, �Ŵ����� ���� ������ ����ؾ� ��.
(��� ����)
emp_name mgr_name
FORD	 JONES
SCOTT	 JONES
JAMES	 BLAKE
......
KING 
*/
select e1.ename, e2.ename manager
from emp e1 left join emp e2
    on e1.mgr = e2.empno;



--(2) SCOTT�� �Ŵ��� �̸��� ����ϴ� SQL �ۼ�.
    select m.ename from emp e, emp m where e.ename='SCOTT' and e.mgr=m.empno;

/*
(3) ���� �̸��� �Ķ���Ϳ� �����ϸ� �Ŵ����� �̸��� �����ϴ� �Լ��� �ۼ��ϰ� ����� Ȯ��.
*/
create or replace function my_mgr(
    p_ename emp.ename%type
    
) return varchar2
is
    v_result emp.ename%type;                      
begin
    select d.ename into v_result 
    from emp e, emp d
    where e.ename = upper(p_ename) and
            e.mgr = d.empno;
    
    return v_result;                       
end;            
/         

select my_mgr('scott') from dual;