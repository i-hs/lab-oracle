
--  함수 테스트 my_stat.f_sum() 
--sum
declare
    v_scores my_stat.NumberArray;
    
begin
    v_scores(1) := 100;
    v_scores(2) := 75;
    v_scores(3) := 50;
    v_scores(4) := 60;
    v_scores(5) := 84;
    dbms_output.put_line('sum : '||my_stat.f_sum(v_scores));
end;
/
--avg
declare
    v_scores my_stat.NumberArray;
    
begin
    v_scores(1) := 100;
    v_scores(2) := 11;
    v_scores(3) := 1;
    dbms_output.put_line('avg : '||my_stat.f_avg(v_scores,5));
end;
/
--var
declare
    v_scores my_stat.NumberArray;
    
begin
    v_scores(1) := 100;
    v_scores(2) := 11;
    v_scores(3) := 1;
    dbms_output.put_line('var : '|| my_stat.f_var(v_scores,5));
end;
/
--std
declare
    v_scores my_stat.NumberArray;
    
begin
    v_scores(1) := 100;
    v_scores(2) := 11;
    v_scores(3) := 1;
    dbms_output.put_line('std : '||my_stat.f_std(v_scores,5));
end;
/
--max
declare
    v_scores my_stat.NumberArray;
    
begin
    v_scores(1) := 100;
    v_scores(2) := 11;
    v_scores(3) := 1000;
    dbms_output.put_line('max : '||my_stat.f_max(v_scores));
end;
/
--min
declare
    v_scores my_stat.NumberArray;
    
begin
    for i in 1..10 loop
        v_scores(i) := trunc(dbms_random.value (0,11));
        dbms_output.put(v_scores(i)||' ');
    end loop;
    dbms_output.new_line;    
    dbms_output.put_line('sum : '||my_stat.f_sum(v_scores));
    dbms_output.put_line('avg : '||my_stat.f_avg(v_scores,5));
    dbms_output.put_line('var : '|| my_stat.f_var(v_scores,5));
    dbms_output.put_line('std : '||my_stat.f_std(v_scores,5));
    dbms_output.put_line('max : '||my_stat.f_max(v_scores));
    dbms_output.put_line('min : '|| my_stat.f_min(v_scores));
end;
/
declare
    type x is table of number index by pls_integer;
begin
    select empno into x from emp;
end;
/