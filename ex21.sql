--

select deptno from dept;
-------------------------------------------------------------------------------------
set serveroutput on; 

declare
    v_num number := 19950801;  --변수 선언
begin
    dbms_output.put_line('v_num 값 = ' || v_num);  -- 출력
end;
/
DECLARE     -- 변수 선언부
            -- 변수 선언과 동시에 초기화
    v_age number(3) := 16;
    
            --변수 선언만!
    v_name varchar2(20);
BEGIN       -- 실행부
    dbms_output.put_line('나이 : '|| v_age); -- 화면(console)에 출력
    -- v_name는 초기화되지 않은 변수. v_name은 null.
    v_name := '오쌤';
    dbms_output.Put_line('이름 : '|| v_name);
END;
/

accept p_age prompt '나이가 어떻게 되세요 ~?';
declare 
    v_age number := &p_age;
begin
    dbms_output.put_line('당신의 나이는 ' || v_age);
end;
/

accept a_length prompt '가로 길이 입력 : ';
accept a_width  prompt '세로 길이 입력 : ';
declare
     v_width  number := &a_length;
     v_height number := &a_width;
     v_area   number;
begin
    v_area := v_width * v_height;
    dbms_output.put_line('가로의 길이는 ' || v_width);
    dbms_output.put_line('세로의 길이는 ' || v_height);
    dbms_output.put_line('사각형의 넓이는 ' || v_area);
end;

/

