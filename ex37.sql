--��Ű�� ��(���� �ۼ�)
set serveroutput on;
create or replace package my_pkg
is
    -- Ÿ�� ����
    type rec_emp_sal is record (
        empno   emp.empno%type,
        ename   emp.ename%type,
        sal     emp.sal%type
    );
    -- ���� ����
    num1 number := 0;
    
    -- ���ν��� ������Ÿ��(prototype) ����
    procedure my_proc(p_empno number);
    
    -- �Լ� ������Ÿ�� ���� 
    function my_add(p_x number, p_y number) return number;
    
end;
/


--��Ű���� ����(��ü,body)�� �ۼ�
create or replace package body my_pkg
is
    procedure my_proc(p_empno number)
    is
    -- ��Ű�� ���� ����� ���ν��� ����
        v_result my_pkg.rec_emp_sal;
    begin
        select empno, ename, sal
        into v_result 
        from emp
        where empno = p_empno;
        
        dbms_output.put_line(v_result.empno || ', ' 
                            || v_result.ename || ', '
                            || v_result.sal);
    end my_proc;
    
    -- ��Ű�� ���� ����� �Լ� ����
    function my_add(p_x number, p_y number) return number
    is        
    begin   
        return p_x + p_y;
    end my_add; -- ��Ű������ end�� �����Ƿ� end ���� �̸��� ���ش�.    
end;
/
declare
    v_result my_pkg.rec_emp_sal;

begin
    dbms_output.put_line(my_pkg.num1);
    my_pkg.my_proc(7788);
end;
/

select my_pkg.my_add(1,2) from dual;