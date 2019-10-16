--컬렉션
set SERVEROUTPUT ON;
    
    declare
        -- 중첩 테이블 선언
        type NumberArray is table of number; -- index by를 사용하지 않음
        -- 중첩 테이블 타입의 변수를 선언하자
        v_numbers NumberArray;
    begin
    --    v_numbers(1) := 100;
    --    중첩 테이블은 반드시 생성자를 호출해서 초기화(initialize)를 해야 함.
        v_numbers := NumberArray(100, 200, 300);  -- 여기서 NumberArray가 생성자이다. 배열을 만들어 주는 것이 생성자이다. 
                                                  -- Type의 이름과 생성자의 이름(TypeArray)이 같다.
                                                  -- 생성자의 매개변수로 중첩테이블/ Varray에 저장할 값들을 전달한다.    
                                                  
        -- 중첩 테이블에 값을 추가할 때는
        -- extend(배열 확장 함수)를 호출해서 배열이 저장할 수 있는 원소의 갯수를 늘려준 후
        -- 값을 추가해야 함.
        v_numbers.extend(3);
        v_numbers(4) := 400;
        v_numbers(5) := 500;
        v_numbers(6) := 600;
        
            -- 중첩 테이블에 저장된 값들을 출력
        for i in 1 .. v_numbers.count loop
            dbms_output.put_line(i||' :  '|| v_numbers(i));
        end loop;
        
    end;
    /
   
declare
    -- VARRAY 타입 선언
    type NumberArray is varray(5) of number;
    v_numbers NumberArray;
begin
    -- VARRAY 생성자 호출
    v_numbers := NumberArray(11, 22, 33, 44);
    dbms_output.put_line( 'count : ' || v_numbers.count); -- count : 4
    DBMS_OUTPUT.PUT_LINE('limit : ' || v_numbers.limit);  -- limit : 5
    v_numbers.extend(1);
    v_numbers(5) := 55;
    
    for i in 1.. v_numbers.count loop
        dbms_output.put_line(i || ' : ' || v_numbers(i));
    end loop;
end;
/
-- 문자열 5개를 저장할 수 있는 varray를 StringArray라는 이름으로 선언
-- StringArray  타입의 변수(v_names)를 선언
-- v_names를 원소가 없는 varray 로 초기화(생성자 호출)
-- v_names 저장하는 원소의 개수를 5개로 확장(extend)
-- v_names에 5개의 문자열을 저장
-- v_names에 저장된 문자열을 출력

declare
    type StringArray is varray(5) of varchar2(10);
    v_names StringArray;
begin 
    v_names := StringArray();
    v_names.extend(5);
    v_names(1) := '한일';
    v_names(2) := '두이';
    v_names(3) := '석삼';
    v_names(4) := '너구리';
    v_names(5) := '오징어';
    
    for i in 1..v_names.count loop
        dbms_output.put_line(i||' : ' || v_names(i));
    end loop;
end;
/


   
