set serveroutput on;

--프로시저 생성
create or replace procedure my_proc1
is 
    v_empno emp.empno%type := 7788;
    v_ename emp.ename%type;
    
begin 
    select ename into v_ename from emp where empno = v_empno;
    dbms_output.put_line('이름: '||v_ename);
end;
/


-- 프로시저 실행
begin
    my_proc1();
end;
/

--프로시저 확인
select * from user_source where name='MY_PROC1';

-- 프로시저 삭제
drop procedure my_proc1;


-- 파라미터를 갖는 프로시저 생성
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

--파라미터 있는 프로시저 실행
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
    in_empno    in      emp.empno%type,       -- in 모드 파라미터 : input할 값을 입력
    out_ename   out     emp.ename%type,       -- out모드 파라미터 : output 값을 받을 변수를 입력
    out_deptno  out     emp.deptno%type
)

is      -- 선언부의 코드가 없더라도 is는 생략하면 안 됨!

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


-- in out 모드 프로시저 선언
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
    DBMS_OUTPUT.PUT_LINE('procedure 호출 전 v_ test = '|| v_test );
    my_proc4(v_test);   -- 프로시저 호출
    DBMS_OUTPUT.PUT_LINE('procedure 호출 후 v_ test = '|| v_test );
    
end;
/

-- 기본값을 갖는 파라미터 
create or replace procedure my_proc5(
    param1 number,          -- 기본값이 지정되지 않은 파라미터
    param2 number := 123    -- 기본값이 지정된 파라미터
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


/* 연습문제 프로시저 : get_total_sal
    파라미터 :
        p_empno -   in 모드, emp테이블
        p_total -   out 모드, 숫자 타입
        p_tax -     in  숫자  기본값 0.05
    기능 : 전달받은 사번으로 셀러리sal와 커미션comm을 검색한다.
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
        dbms_output.put_line('없는 사번입니다');
    when others then --  others : 나머지들. 항상 exception 구문에 가장 뒤에 와야 한다.
        dbms_output.put_line('에러코드: '||sqlcode);     -- sqlcode : 에러 코드
        dbms_output.put_line('에러 메세지: '||sqlerrm);  -- sqlerrm :  에러 메세지
end;
/
declare 
v_total number;
begin
    get_total_sal(7788,v_total);
    dbms_output.put_line('total2 : '|| v_total);
end;
/
--과제 개선버전

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
        dbms_output.put_line('없는 사번입니다');
    when others then --  others : 나머지들. 항상 exception 구문에 가장 뒤에 와야 한다.
        dbms_output.put_line('에러코드: '||sqlcode);     -- sqlcode : 에러 코드
        dbms_output.put_line('에러 메세지: '||sqlerrm);  -- sqlerrm :  에러 메세지  
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


