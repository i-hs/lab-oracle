--

select deptno from dept;
-------------------------------------------------------------------------------------
set serveroutput on; 

declare
    v_num number := 19950801;  --���� ����
begin
    dbms_output.put_line('v_num �� = ' || v_num);  -- ���
end;
/
DECLARE     -- ���� �����
            -- ���� ����� ���ÿ� �ʱ�ȭ
    v_age number(3) := 16;
    
            --���� ����!
    v_name varchar2(20);
BEGIN       -- �����
    dbms_output.put_line('���� : '|| v_age); -- ȭ��(console)�� ���
    -- v_name�� �ʱ�ȭ���� ���� ����. v_name�� null.
    v_name := '����';
    dbms_output.Put_line('�̸� : '|| v_name);
END;
/

accept p_age prompt '���̰� ��� �Ǽ��� ~?';
declare 
    v_age number := &p_age;
begin
    dbms_output.put_line('����� ���̴� ' || v_age);
end;
/

accept a_length prompt '���� ���� �Է� : ';
accept a_width  prompt '���� ���� �Է� : ';
declare
     v_width  number := &a_length;
     v_height number := &a_width;
     v_area   number;
begin
    v_area := v_width * v_height;
    dbms_output.put_line('������ ���̴� ' || v_width);
    dbms_output.put_line('������ ���̴� ' || v_height);
    dbms_output.put_line('�簢���� ���̴� ' || v_area);
end;

/

