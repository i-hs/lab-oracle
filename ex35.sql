set serveroutput on;

--���ν��� ����
create or replace procedure my_proc1
is 
    v_empno emp.empno%type := 7788;
    v_ename emp.ename%type;
    
begin 
    select ename into v_ename from emp where empno = v_empno;
    dbms_output.put_line('�̸�: '||v_ename);
end;
/


-- ���ν��� ����
begin
    my_proc1();
end;
/

--���ν��� Ȯ��
select * from user_source where name='MY_PROC1';

-- ���ν��� ����
drop procedure my_proc1;


-- �Ķ���͸� ���� ���ν��� ����
create or replace procedure my_proc2(
    p_empno emp.empno%type
)
is
    v_ename emp.ename%type;
begin
    select ename into v_ename from emp where empno = p_empno;
    dbms_output.put_line('name: '|| v_ename);
end
;
/

--�Ķ���� �ִ� ���ν��� ����
declare
    cursor my_cursor is 
        select empno from emp;
    
begin
    for v_eno in my_cursor loop
        my_proc2(v_eno.empno);
    end loop;
end;
/

create or replace procedure my_proc3(
    in_empno    in      emp.empno%type,       -- in ��� �Ķ���� : input�� ���� �Է�
    out_ename   out     emp.ename%type,       -- out��� �Ķ���� : output ���� ���� ������ �Է�
    out_deptno  out     emp.deptno%type
)

is      -- ������� �ڵ尡 ������ is�� �����ϸ� �� ��!

begin
    select ename, deptno into out_ename, out_deptno
    from emp
    where empno = in_empno;
end;
/
declare v_ename emp.ename%type;
        v_deptno emp.deptno%type;
begin
    my_proc3(7654, v_ename, v_deptno);
    dbms_output.put_line(v_ename||', '||v_deptno);
end;
/


-- in out ��� ���ν��� ����
create or replace procedure my_proc4(
    v_number in out number
)
is
begin
    v_number := 2 * v_number;
end;
/

declare 
    v_test number := 10;
begin
    DBMS_OUTPUT.PUT_LINE('procedure ȣ�� �� v_ test = '|| v_test );
    my_proc4(v_test);   -- ���ν��� ȣ��
    DBMS_OUTPUT.PUT_LINE('procedure ȣ�� �� v_ test = '|| v_test );
    
end;
/

-- �⺻���� ���� �Ķ���� 
create or replace procedure my_proc5(
    param1 number,          -- �⺻���� �������� ���� �Ķ����
    param2 number := 123    -- �⺻���� ������ �Ķ����
)
is
begin
    dbms_output.put_line (param1 || ', '|| param2); 
end;
/

begin
    my_proc5(1);
end;
/


/* �������� ���ν��� : get_total_sal
    �Ķ���� :
        p_empno -   in ���, emp���̺�
        p_total -   out ���, ���� Ÿ��
        p_tax -     in  ����  �⺻�� 0.05
    ��� : ���޹��� ������� ������sal�� Ŀ�̼�comm�� �˻��Ѵ�.
*/

create or replace procedure get_total_sal(
    p_empno in  emp.empno%type,
    p_total out number,
    p_tax   in  number  :=0.05
)
    
is
       v_sal emp.sal%type;
    v_comm emp.comm%type ;
begin
    select sal, nvl(comm,0)   into v_sal, v_comm  from emp 
    where empno=p_empno;
    p_total := (v_sal+ v_comm) * (1-p_tax);
    dbms_output.put_line (v_sal||', ' || v_comm); 
    dbms_output.put_line ('total : '||p_total); 

exception 
    when NO_DATA_FOUND then 
        dbms_output.put_line('���� ����Դϴ�');
    when others then --  others : ��������. �׻� exception ������ ���� �ڿ� �;� �Ѵ�.
        dbms_output.put_line('�����ڵ�: '||sqlcode);     -- sqlcode : ���� �ڵ�
        dbms_output.put_line('���� �޼���: '||sqlerrm);  -- sqlerrm :  ���� �޼���
end;
/
declare 
v_total number;
begin
    get_total_sal(7788,v_total);
    dbms_output.put_line('total2 : '|| v_total);
end;
/
--���� ��������

create or replace procedure get_total_sal2(
    p_empno in  emp.empno%type,
    p_tax   in  number  :=0.05
)
    
is
    v_sal number;
    v_total number;
    v_comm number := 0;
    
begin
    select sal, nvl(comm,0)   into v_sal, v_comm  from emp 
    where empno=p_empno;
    v_total := (v_sal+ v_comm) * (1-p_tax);
    dbms_output.put_line (v_sal||', ' || v_comm); 
        dbms_output.put_line ('total : '||v_total);  
    
           
    

exception 
    when NO_DATA_FOUND then 
        dbms_output.put_line('���� ����Դϴ�');
    when others then --  others : ��������. �׻� exception ������ ���� �ڿ� �;� �Ѵ�.
        dbms_output.put_line('�����ڵ�: '||sqlcode);     -- sqlcode : ���� �ڵ�
        dbms_output.put_line('���� �޼���: '||sqlerrm);  -- sqlerrm :  ���� �޼���  
end;
/
declare
    cursor my_cursor is
    select empno from emp;
begin
    for r in my_cursor loop
        get_total_sal(r.empno);
    end loop;
end;
/


