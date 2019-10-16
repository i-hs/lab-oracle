/*예외 / 오류 ( exception / error ) 처리

*/

set serveroutput on;

declare
    v_result number;
begin
    dbms_output.put_line('실행 전...');
    
--    v_result :='ab';
--    v_result := 123/0;
--    select deptno into v_result from emp where empno=7651;
--    select ename into v_result from emp where empno=7788;
--    select * into v_result from emp;
    dbms_output.put_line(v_result); 

end;
/

-- 예외 처리 구문
declare
    v_result number;
begin
    dbms_output.put_line(' 예외 발생 전');
    v_result := 'abc';

exception
    when value_error then
        dbms_output.put_line('숫자가 아닙니다');
end;
/
declare
    v_result number;
begin
    dbms_output.put_line('예외 발생 전..');
    v_result := 123/0;
    dbms_output.put_line(v_result); 
exception
    when zero_divide then
        dbms_output.put_line('0으로 나눌 수 없습니다.'); 
    when others then --  others : 나머지들
        dbms_output.put_line('에러코드: '||sqlcode);     -- sqlcode : 에러 코드
        dbms_output.put_line('에러 메세지: '||sqlerrm);  -- sqlerrm : 에러 메세지
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
        bms_output.put_line('0으로 나눌 수 없습니다.'); 
    when too_maney_rows then
        dbms_output.put_line('결과행이 너무 많아요'); 
    when others then
            dbms_output.put_line(sqlcode||', '||sqlerrm); 
end;
/
