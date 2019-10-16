-- PL/SQL�� ������ Ÿ��
SET SERVEROUTPUT ON;

declare
    -- dept ���̺��� �� Į���� ������ ������ �� �ִ� ���� ����.
    v_deptno     dept.deptno%type := 10; 
    v_dname      dept.dname%type;
    v_loc        dept.loc%type;
    
begin
    select dname, loc   into v_dname, v_loc
    from dept           where deptno=v_deptno;
    
    dbms_output.put_line(v_deptno || ' : ' || v_dname || ' : ' || v_loc);
end;
/

declare
    -- emp ���̺��� ��row �� ��� ������ ������ �� �ִ� ������ ����
    v_emp7788    emp%rowtype;
       
begin
    select *        into v_emp7788
    from emp        where empno = 7788;
    dbms_output.put_line(v_emp7788.ename);
    dbms_output.put_line(v_emp7788.sal);
    dbms_output.put_line(v_emp7788.hiredate);
    end;
/









