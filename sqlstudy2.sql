-- 패키지 명세(specification) 작성
create or replace package my_stat
is
    type NumberArray is table of number
    index by PLS_INTEGER;
    function f_sum(arr NumberArray) return number;
    function f_avg(arr NumberArray,digit number := 3) return number;
    function f_var(arr NumberArray,digit number := 3) return number;
    function f_max(arr NumberArray) return number;
end my_stat;
/
