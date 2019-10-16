/*
평균
my_stat.f_avg(arr)

편차
arr(i)-my_stat.f_avg(arr)
편차제곱
power((arr(i)-my_stat.f_avg(arr)),2))
편차 제곱의 합

편차제곱의 평균
my_stat.f_avg(power((arr(i)-my_stat.f_avg(arr)),2))
*/
create or replace package body my_stat
is  
-- func f_sum
    function f_sum(arr NumberArray) return number      --input하는 연관배열이 NumberArray타입이어야 함
    is
        v_rslt number := 0;
    begin
        for i in 1.. arr.count loop
            v_rslt := v_rslt + arr(i);
        end loop;  
        return v_rslt;
    end f_sum;

--func f_avg (14)
        function f_avg(arr NumberArray, digit number) return number
        is
            v_avg number := 0;
        begin
v_avg := trunc( my_stat.f_sum(arr) / arr.count, digit );
            return v_avg;
        end f_avg;    
--func f_var(26)
        function f_var(arr NumberArray, digit number) return number
        is
            v_sum number := 0;
            v_var number := 0;
        begin
            for i in 1.. arr.count loop
     v_sum := v_sum + power((arr(i)-my_stat.f_avg(arr)),2);
            end loop;
            v_var := trunc(v_sum/(arr.count-1),digit);
            return v_var;
        end f_var;
        
      --func std  (46)
        function f_std(arr NumberArray, digit number) return number
        is
            v_std number := 0;
        begin
v_std := trunc( sqrt ( my_stat.f_var(arr) ),digit ) ;
            return v_std;
        end f_std;
--func f_max
    function f_max(arr NumberArray) return number
    is
        v_num number;
       
    begin
        v_num := arr(arr.first);
        for i in arr.first.. arr.last loop
            if v_num<arr(i) then
                v_num := arr(i);
            end if;
        end loop;  
        return v_num;
    end f_max;
--func min
    function f_min(arr NumberArray) return number
    is
        v_num number;
       
    begin
        v_num := arr(arr.first);
        for i in arr.first.. arr.last loop
            if v_num>arr(i) then
                v_num := arr(i);
            end if;
        end loop;  
        return v_num;
    end f_min;
end my_stat;
/