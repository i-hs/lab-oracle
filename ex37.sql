--패키지 명세(스펙 작성)
set serveroutput on;
create or replace package my_pkg
is
    -- 타입 선언
    type rec_emp_sal is record (
        empno   emp.empno%type,
        ename   emp.ename%type,
        sal     emp.sal%type
    );
    -- 변수 선언
    num1 number := 0;
    
    -- 프로시저 프로토타입(prototype) 선언
    procedure my_proc(p_empno number);
    
    -- 함수 프로토타입 선언 
    function my_add(p_x number, p_y number) return number;
    
end;
/


--패키지의 본문(본체,body)를 작성
create or replace package body my_pkg
is
    procedure my_proc(p_empno number)
    is
    -- 패키지 명세에 선언된 프로시저 구현
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
    
    -- 패키지 명세에 선언된 함수 구현
    function my_add(p_x number, p_y number) return number
    is        
    begin   
        return p_x + p_y;
    end my_add; -- 패키지에는 end가 많으므로 end 옆에 이름을 써준다.    
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