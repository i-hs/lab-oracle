set serveroutput on;
-- 패키지 명세(specification) 작성
create or replace package my_stat
is
    -- 숫자 타입을 저장하고, 인덱스는 양의 정수인 index-by table 을 선언 : NumberArray 
    
    type NumberArray is table of number
    index by PLS_INTEGER;
    
    
    /*
    * 함수 sum  : 파라미터에 전달받은 배열에 있는 모든 원소들의 합을 리턴하는 함수
    * 파라미터 arr NumberArray 
    */
    function f_sum(arr NumberArray) return number;

    /*
    * 함수 avg  : 파라미터에 전달받은 배열에 있는 모든 원소들의 평균을 리턴하는 함수
    * 파라미터  arr     NumberArray 
    * 파라미터2 digit   number          리턴값(평균)의 소숫점 이하 자릿수, 기본값은 3
    */
    function f_avg(
                arr NumberArray, 
                digit number := 3
    ) return number;

    /*
    * 함수 var  : 파라미터에 전달받은 배열에 있는 모든 원소들의 분산을 리턴하는 함수
    * 파라미터 arr NumberArray 
    * 파라미터2 digit   number          리턴값(분산)의 소숫점 이하 자릿수, 기본값은 3
    */
    function f_var(
                arr NumberArray, 
                digit number := 3
    ) return number;


    /*
    * 함수 std  : 파라미터에 전달받은 배열에 있는 모든 원소들의 표준편차를 리턴하는 함수
    * 파라미터 arr NumberArray 
    * 파라미터2 digit   number          리턴값(표준편차)의 소숫점 이하 자릿수, 기본값은 3
    */
    function f_std(
                arr NumberArray, 
                digit number := 3
    ) return number;

    /*
    * 함수 max  : 파라미터에 전달받은 배열에 있는 모든 원소들의 최댓값을 리턴하는 함수
    * 파라미터 arr NumberArray 
    */
     function f_max(arr NumberArray) return number;

    /*
    * 함수 min  : 파라미터에 전달받은 배열에 있는 모든 원소들의 최솟값을 리턴하는 함수
    * 파라미터 arr NumberArray 
    */
     function f_min(
                arr NumberArray
    ) return number;

end my_stat;
/

-- 패키지 본문 (body) 작성
create or replace package body my_stat
is  
-- func f_sum
    function f_sum(arr NumberArray) return number
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
            
            v_rslt number := 0;
        begin
            v_rslt := trunc(my_stat.f_sum(arr)/arr.count,digit);
            return v_rslt;
        end f_avg;    
--func f_var(26)
        function f_var(arr NumberArray, digit number) return number
        is
     
            v_sum2 number := 0;
            v_var number := 0;
        begin
            for i in 1.. arr.count loop
                v_sum2 := v_sum2 + power((arr(i)-my_stat.f_avg(arr)),2);
            end loop;
            v_var := trunc(v_sum2/arr.count,digit);    
            return v_var;
        end f_var;    
        
      --func std  (46)
        function f_std(arr NumberArray, digit number) return number
        is
            v_std number := 0;
        begin
            v_std := trunc(sqrt(my_stat.f_var(arr)),digit);      
            return v_std;
            
        end f_std;    
--func f_max(69)
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


