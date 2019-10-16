--�÷���
set SERVEROUTPUT ON;
    
    declare
        -- ��ø ���̺� ����
        type NumberArray is table of number; -- index by�� ������� ����
        -- ��ø ���̺� Ÿ���� ������ ��������
        v_numbers NumberArray;
    begin
    --    v_numbers(1) := 100;
    --    ��ø ���̺��� �ݵ�� �����ڸ� ȣ���ؼ� �ʱ�ȭ(initialize)�� �ؾ� ��.
        v_numbers := NumberArray(100, 200, 300);  -- ���⼭ NumberArray�� �������̴�. �迭�� ����� �ִ� ���� �������̴�. 
                                                  -- Type�� �̸��� �������� �̸�(TypeArray)�� ����.
                                                  -- �������� �Ű������� ��ø���̺�/ Varray�� ������ ������ �����Ѵ�.    
                                                  
        -- ��ø ���̺� ���� �߰��� ����
        -- extend(�迭 Ȯ�� �Լ�)�� ȣ���ؼ� �迭�� ������ �� �ִ� ������ ������ �÷��� ��
        -- ���� �߰��ؾ� ��.
        v_numbers.extend(3);
        v_numbers(4) := 400;
        v_numbers(5) := 500;
        v_numbers(6) := 600;
        
            -- ��ø ���̺� ����� ������ ���
        for i in 1 .. v_numbers.count loop
            dbms_output.put_line(i||' :  '|| v_numbers(i));
        end loop;
        
    end;
    /
   
declare
    -- VARRAY Ÿ�� ����
    type NumberArray is varray(5) of number;
    v_numbers NumberArray;
begin
    -- VARRAY ������ ȣ��
    v_numbers := NumberArray(11, 22, 33, 44);
    dbms_output.put_line( 'count : ' || v_numbers.count); -- count : 4
    DBMS_OUTPUT.PUT_LINE('limit : ' || v_numbers.limit);  -- limit : 5
    v_numbers.extend(1);
    v_numbers(5) := 55;
    
    for i in 1.. v_numbers.count loop
        dbms_output.put_line(i || ' : ' || v_numbers(i));
    end loop;
end;
/
-- ���ڿ� 5���� ������ �� �ִ� varray�� StringArray��� �̸����� ����
-- StringArray  Ÿ���� ����(v_names)�� ����
-- v_names�� ���Ұ� ���� varray �� �ʱ�ȭ(������ ȣ��)
-- v_names �����ϴ� ������ ������ 5���� Ȯ��(extend)
-- v_names�� 5���� ���ڿ��� ����
-- v_names�� ����� ���ڿ��� ���

declare
    type StringArray is varray(5) of varchar2(10);
    v_names StringArray;
begin 
    v_names := StringArray();
    v_names.extend(5);
    v_names(1) := '����';
    v_names(2) := '����';
    v_names(3) := '����';
    v_names(4) := '�ʱ���';
    v_names(5) := '��¡��';
    
    for i in 1..v_names.count loop
        dbms_output.put_line(i||' : ' || v_names(i));
    end loop;
end;
/


   
