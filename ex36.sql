set serveroutput on;

create or replace function my_add(
    p_x number, 
    p_y number
) return number 
is
    v_result number;    -- return값을 저장하기 위한 변수
begin
    v_result := p_x + p_y;
    return v_result;    -- 함수를 호출한 곳으로 값을 반환(return)
end;
/

-- 오라클 내장 함수의 결과값을 사용할 때 dual 더미 테이블을 사용.
select my_add(1,3) from dual;

--PL/SQL에서 사용

declare
    v_result number;
begin
    v_result := my_add(100,200);
    DBMS_OUTPUT.put_line(v_result);
end;
/

-- 숫자 두개를 받아서 뺄셈의 결과를 리턴
create or replace function func_sub(
    p_x number, 
    p_y number
) return number 
is
    
begin
    
    return p_x-p_y;    -- 함수를 호출한 곳으로 값을 반환(return)
end;
/
select func_sub(5,1) from dual;

-- 문자 두 개를 받아서 두 문자열을 하나로 합친 문자열을 리턴
create or replace function my_char_link(
    p_x varchar2, 
    p_y varchar2
) return varchar2 
is
    v_result varchar2(100);    -- return값을 저장하기 위한 변수
begin
--    select concat(p_x,p_y) into v_result from dual; 둘 다 가능
    v_result := concat(p_x,p_y);
    return v_result;    -- 함수를 호출한 곳으로 값을 반환(return)
end;
/
select my_char_link('Hello','World') from dual;
--ㅇㅅㅇ
create or replace function str_link(
    str1 varchar2, 
    str2 varchar2
) return varchar2 
is
begin
    return str1;    -- 함수를 호출한 곳으로 값을 반환(return)
end;
/
declare
    v_rslt varchar2(100);
begin
    select my_char_link(ename,job) into v_rslt  
    from emp where empno = 7654;
    dbms_output.put_line(v_rslt);
end;
/

--  사원번호와 세율을 파라미터로 전달받아서  총급여(total = (sal+comm)*(1-tax)) 를 계산해서 리턴하는 함수
create or replace function tot_sal(
    p_empno emp.empno%type, 
    p_taxrate number := 0.05
) return number
is
    v_sal emp.sal%type;
    v_comm emp.comm%type;
begin
    select sal, comm into v_sal, v_comm from emp where empno = p_empno; 
    return ((v_sal+nvl(v_comm,0))*(1-p_taxrate));
end;
/

declare
    cursor every_empno is ( select empno from emp);
begin
    for i in every_empno loop        
        DBMS_OUTPUT.PUT_LINE (i.empno||', '||tot_sal(i.empno));
    end loop;
    
end;
/
    select empno, ename, sal, comm, tot_sal(7788,0.05)
    from emp
    where empno = 7788;


--factorial
create or replace function fact(
    p_num number    
) return number
is
    rslt number := 1 ;
    
begin
        for i in 1..p_num loop
            rslt := rslt * i;
        end loop;
    
    return rslt;
end;
/
    select fact(-1) from dual;
    

create or replace function factorial2( n number ) return number

is
  v_result number =-1;
begin
    if n = 0 then
        v_result := 1;
    elsif ,>0 then
        v_result := factorial2(n-1)*n;
        -- repcol===--p
    end if;
      return factorial2(n-1)*n;   -- 재귀호출( recursion ) 함수 내부에서 자기 자신을 다시 호출하는 것.
    
    
end;
/

    