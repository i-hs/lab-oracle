-- ���ǹ�(Conditional Statement)

set serveroutput on;
accept p_num prompt '���� �Է� : ';
declare
    v_num number := &p_num ;
begin
    if      mod(v_num, 3) = 0    then
            dbms_output.put_line('������ 0');
    elsif   mod(v_num, 3) = 1    then
            dbms_output.put_line('������ 1');
            
    else    dbms_output.put_line('������ 2');
            
    end if;
    
    dbms_output.put_line('End PL/SQL');
end;
/
accept p_num prompt '���ڸ� �Է��ϼ���';
declare
    v_test number := &p_num;
begin
    if mod(v_test, 2) = 1 then
        dbms_output.put_line('odd number');
    else
        dbms_output.put_line('even number');
    end if;
        dbms_output.put_line('End PL/SQL');
end;
/

accept p_num prompt '������ �Է��ϼ��� : ';
declare
    v_num number := &p_num ;
begin
    if          v_num >=90   then
            dbms_output.put_line('A');
    elsif       v_num>=80    then
            dbms_output.put_line('B'); 
    elsif       v_num>=70    then
            dbms_output.put_line('C');
    else
            dbms_output.put_line('F');          
    end if;
 
end;
/

--�Է¹��� ���ڰ� ¦�� or  Ȧ��  ?
--1. ¦���̸�, 'even number' ���
--  (1) 4�� ����̸�, '4�� ����̴�'
--  (2) �׷��� ������, '4�� ����� �ƴմϴ�' ���
--2. Ȧ���̸�, 'odd number'  ���

accept p_num prompt '���ڸ� �Է��ϼ���';
declare
    v_test number := &p_num;
begin
    if mod(v_test, 2) = 0 then
        dbms_output.put_line('even number');
        if mod(v_test, 4) = 0 then
            dbms_output.put_line('4�� ����̴�.');
        else
            dbms_output.put_line('4�� ����� �ƴϴ�.');
        end if;
    else
        dbms_output.put_line('odd number');
    end if;
end;
/

select power(5,2) from dual;


accept p_a prompt '�ﰢ���� ���� ���� a�� �Է��ϼ���';
accept p_b prompt '�ﰢ���� ���� ���� b�� �Է��ϼ���';
accept p_c prompt '�ﰢ���� ���� ���� c�� �Է��ϼ���';

declare
    v_a number(30,10);
    v_c number(30,10);
    v_b number(30,10);

begin
select power(&p_a,2), power(&p_b,2), power(&p_c,2) into v_a, v_b, v_c from dual;

if v_a+v_b>v_c or v_b+v_c>v_a or v_a+v_c>v_b then
    if (((v_a+v_b)=v_c) or ((v_b+v_c)=v_a) or ((v_a+v_c)=v_b)) then
        dbms_output.put_line('�����ﰢ���Դϴ�.');
    else
        dbms_output.put_line('�����ﰢ���� �ƴմϴ�.');
    end if;
else
    dbms_output.put_line('�ﰢ���� �ƴմϴ�.');
end if;

end;
/
