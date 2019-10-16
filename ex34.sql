/*���� / ���� ( exception / error ) ó��

*/

set serveroutput on;

declare
    v_result number;
begin
    dbms_output.put_line('���� ��...');
    
--    v_result :='ab';
--    v_result := 123/0;
--    select deptno into v_result from emp where empno=7651;
--    select ename into v_result from emp where empno=7788;
--    select * into v_result from emp;
    dbms_output.put_line(v_result); 

end;
/

-- ���� ó�� ����
declare
    v_result number;
begin
    dbms_output.put_line(' ���� �߻� ��');
    v_result := 'abc';

exception
    when value_error then
        dbms_output.put_line('���ڰ� �ƴմϴ�');
end;
/
declare
    v_result number;
begin
    dbms_output.put_line('���� �߻� ��..');
    v_result := 123/0;
    dbms_output.put_line(v_result); 
exception
    when zero_divide then
        dbms_output.put_line('0���� ���� �� �����ϴ�.'); 
    when others then --  others : ��������
        dbms_output.put_line('�����ڵ�: '||sqlcode);     -- sqlcode : ���� �ڵ�
        dbms_output.put_line('���� �޼���: '||sqlerrm);  -- sqlerrm : ���� �޼���
end;
/
declare
    v_result number;
    v_row emp%rowtype;
begin
        select ename into v_result from emp where empno= 7788;
        dbms_output.put_line(V_row.ename); 
--    select * into v_result from emp where empno=7788;
exception
    when value_error then
        bms_output.put_line('0���� ���� �� �����ϴ�.'); 
    when too_maney_rows then
        dbms_output.put_line('������� �ʹ� ���ƿ�'); 
    when others then
            dbms_output.put_line(sqlcode||', '||sqlerrm); 
end;
/
