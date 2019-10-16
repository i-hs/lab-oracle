/*
3. 
순열(Permutation), 조합(Combination)
a, b, c 3개의 문자 중에서 */

declare
    type NumberArray is table of varchar2(5)
    index by PLS_INTEGER;
    arr NumberArray;

begin
-- (1) 중복을 허락해서 2개의 문자를 순서대로 나열해서 출력
--    (결과) aa, ab, ac, ba, bb, bc, ca, cb, cc
    for i in 1..3 loop
        arr(1) := i;
        for j in 1..3 loop
            arr(2) := j;
            for k in 1..2 loop
                if arr(k)='1' then
                    arr(k) := 'a';
                elsif arr(k)='2' then
                    arr(k) := 'b';
                else
                    arr(k) := 'c';
--                elsif arr(k)='3' then
--                    arr(k) := 'c';
--                else
--                    arr(k) := 'd';
                end if;

           end loop;
              dbms_output.put_line (arr(1)|| ' ' || arr(2));
              arr(1):= i;
        end loop;
    end loop;
end;
/
-- (2) 중복을 허락하지 않고 2개의 문자를 순서대로 나열해서 출력
--    (결과) ab, ac, ba, bc, ca, cb 

declare
    type NumberArray is table of varchar2(5)
    index by PLS_INTEGER;
    arr NumberArray;

begin

    for i in 1..3 loop
        arr(1) := i;
        for j in 1..3 loop
            arr(2) := j;
            
            for k in 1..2 loop
            
                if arr(k)='1' then
                    arr(k) := 'a';
                elsif arr(k)='2' then
                    arr(k) := 'b';
                else
                    arr(k) := 'c';
                end if;

           end loop;
              if arr(1)<> arr(2) then
                  dbms_output.put_line (arr(1)|| ' ' || arr(2));
              else 
              dbms_output.put('');
              end if;
            arr(1):= i;
        end loop;
    end loop;
end;
/
    
-- (3) 중복을 허락하지 않고 2개의 문자를 선택해서 출력(순서는 중요하지 않음)
--    (결과) ab, ac, bc
declare
    type alpha is table of varchar2(1) index by pls_integer;
    v_alpha alpha;
begin
    v_alpha(1) := 'a';
    v_alpha(2) := 'b';
    v_alpha(3) := 'c';
    v_alpha(4) := 'a';
    v_alpha(5) := 'b';
    v_alpha(6) := 'c';
    for i in 1..3 loop
        for j in 4..6 loop
            if 
                dbms_output.put_line(v_alpha(i) || v_alpha(j) || ' ');
        end loop;
    end loop;
  
end;
/

    
-- (4) 2개의 문자(중복 가능)를 출력(순서는 중요하지 않음)
--    (결과) aa, ab, ac, bb, bc, cc

declare
    type alpha is table of varchar2(1) index by pls_integer;
    v_alpha alpha;
begin
    v_alpha(1) := 'a';
    v_alpha(2) := 'b';
    v_alpha(3) := 'c';
    for i in 1..3 loop
        for j in i..3 loop
            dbms_output.put(v_alpha(i) || v_alpha(j) || ' ');
        end loop;
    end loop;
    dbms_output.new_line;
end;
/


    
    
