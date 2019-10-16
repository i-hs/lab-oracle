
--ex 8.
--(1) �Ŵ����� ������� �̸��� ����ϴ� SQL �ۼ�
select  distinct e.ename from emp e, emp d
where e.empno in d.mgr ;


--(2) �Ŵ����� �ƴ� ������� �̸��� ����ϴ� SQL �ۼ�
select  distinct e.ename from emp e, emp d
where e.empno not in d.mgr ;

--(3) ����� �Ķ���Ϳ� �����ϸ�, �� ����� �Ŵ����̸� 'm', �Ŵ����� �ƴϸ� 'e'�� �����ϴ� �Լ��� �ۼ��ϰ� �� ����� Ȯ��.

create or replace function my_mgr(
    p_empno emp.empno%type
    
) return varchar2
is
    
    cursor my_cursor is (
       select empno from emp where empno in (select distinct mgr from emp));
begin
    for i in my_cursor loop
        if p_empno = i.empno then
            return 'm'; 
        end if;
    end loop;          
    return 'e';
end;            
/
select my_mgr(7934) from dual;



/*
(4) ������ ���� �Լ��� ����ؼ� �Ʒ��� ���� ����� ��µǵ��� PL/SQL �ۼ�
SMITH  ���
SCOTT  �Ŵ���
KING   �Ŵ���
ADAM   ���
......
*/
declare
    cursor print_cursor is (
    select ename, empno from emp);
begin
    for i in print_cursor loop
        if my_mgr(i.empno)='m' then
            dbms_output.put_line(i.ename||' �Ŵ���');
        else
            dbms_output.put_line(i.ename||' ���');
        end if;
    end loop;

end;
/
