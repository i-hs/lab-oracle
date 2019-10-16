-- 조건문(Conditional Statement)

set serveroutput on;
accept p_num prompt '숫자 입력 : ';
declare
    v_num number := &p_num ;
begin
    if      mod(v_num, 3) = 0    then
            dbms_output.put_line('나머지 0');
    elsif   mod(v_num, 3) = 1    then
            dbms_output.put_line('나머지 1');
            
    else    dbms_output.put_line('나머지 2');
            
    end if;
    
    dbms_output.put_line('End PL/SQL');
end;
/
accept p_num prompt '숫자를 입력하세요';
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

accept p_num prompt '점수를 입력하세요 : ';
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

--입력받은 숫자가 짝수 or  홀수  ?
--1. 짝수이면, 'even number' 출력
--  (1) 4의 배수이면, '4의 배수이다'
--  (2) 그렇지 않으면, '4의 배수가 아닙니다' 출력
--2. 홀수이면, 'odd number'  출력

accept p_num prompt '숫자를 입력하세요';
declare
    v_test number := &p_num;
begin
    if mod(v_test, 2) = 0 then
        dbms_output.put_line('even number');
        if mod(v_test, 4) = 0 then
            dbms_output.put_line('4의 배수이다.');
        else
            dbms_output.put_line('4의 배수가 아니다.');
        end if;
    else
        dbms_output.put_line('odd number');
    end if;
end;
/

select power(5,2) from dual;


accept p_a prompt '삼각형의 변의 길이 a를 입력하세요';
accept p_b prompt '삼각형의 변의 길이 b를 입력하세요';
accept p_c prompt '삼각형의 변의 길이 c를 입력하세요';

declare
    v_a number(30,10);
    v_c number(30,10);
    v_b number(30,10);

begin
select power(&p_a,2), power(&p_b,2), power(&p_c,2) into v_a, v_b, v_c from dual;

if v_a+v_b>v_c or v_b+v_c>v_a or v_a+v_c>v_b then
    if (((v_a+v_b)=v_c) or ((v_b+v_c)=v_a) or ((v_a+v_c)=v_b)) then
        dbms_output.put_line('직각삼각형입니다.');
    else
        dbms_output.put_line('직각삼각형이 아닙니다.');
    end if;
else
    dbms_output.put_line('삼각형이 아닙니다.');
end if;

end;
/
