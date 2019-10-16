set serveroutput on;
-- ��Ű�� ��(specification) �ۼ�
create or replace package my_stat
is
    -- ���� Ÿ���� �����ϰ�, �ε����� ���� ������ index-by table �� ���� : NumberArray 
    
    type NumberArray is table of number
    index by PLS_INTEGER;
    
    
    /*
    * �Լ� sum  : �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� ���� �����ϴ� �Լ�
    * �Ķ���� arr NumberArray 
    */
    function f_sum(arr NumberArray) return number;

    /*
    * �Լ� avg  : �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� ����� �����ϴ� �Լ�
    * �Ķ����  arr     NumberArray 
    * �Ķ����2 digit   number          ���ϰ�(���)�� �Ҽ��� ���� �ڸ���, �⺻���� 3
    */
    function f_avg(
                arr NumberArray, 
                digit number := 3
    ) return number;

    /*
    * �Լ� var  : �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� �л��� �����ϴ� �Լ�
    * �Ķ���� arr NumberArray 
    * �Ķ����2 digit   number          ���ϰ�(�л�)�� �Ҽ��� ���� �ڸ���, �⺻���� 3
    */
    function f_var(
                arr NumberArray, 
                digit number := 3
    ) return number;


    /*
    * �Լ� std  : �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� ǥ�������� �����ϴ� �Լ�
    * �Ķ���� arr NumberArray 
    * �Ķ����2 digit   number          ���ϰ�(ǥ������)�� �Ҽ��� ���� �ڸ���, �⺻���� 3
    */
    function f_std(
                arr NumberArray, 
                digit number := 3
    ) return number;

    /*
    * �Լ� max  : �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� �ִ��� �����ϴ� �Լ�
    * �Ķ���� arr NumberArray 
    */
     function f_max(arr NumberArray) return number;

    /*
    * �Լ� min  : �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� �ּڰ��� �����ϴ� �Լ�
    * �Ķ���� arr NumberArray 
    */
     function f_min(
                arr NumberArray
    ) return number;

end my_stat;
/

-- ��Ű�� ���� (body) �ۼ�
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


