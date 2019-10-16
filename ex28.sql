--EX
--1
SET SERVEROUTPUT ON;
begin
    for j in 2..9 loop    
        for i in 1..9 loop
            DBMS_OUTPUT.PUT_LINE (j||' x '|| i || ' = ' || j*i);
        end loop;
        DBMS_OUTPUT.PUT_LINE ('--------------------------');
    end loop;
end;
/

declare
    v_x number := 1;
    v_y number := 2;
begin
    loop
        v_x := 1;
        loop
            DBMS_OUTPUT.PUT_LINE (v_y || ' x '|| v_x || ' = ' || (v_y*v_x));
            exit when v_x=9;
             v_x := v_x+1;
        end loop;
        v_y := v_y+1;
        DBMS_OUTPUT.PUT_LINE ('--------------------------------------------------');
        exit when v_y=10;
    end loop;
end;
/

declare
    v_x number := 1;
    v_y number := 2;
begin
    while v_y <= 9 loop
            v_x := 1;
            DBMS_OUTPUT.PUT_LINE (v_y || ' 단 ');
            while v_x<=9 loop
                DBMS_OUTPUT.PUT_LINE (v_y || ' x '|| v_x || ' = ' || (v_y*v_x));
                v_x := v_x+1;
                
            end loop;
                DBMS_OUTPUT.PUT_LINE ('--------------------------------------------------');
            v_y := v_y+1;
       
    end loop;
    
end;
/

DECLARE
    i number    := 2;
    j number    := 1;
    
BEGIN
    while i<10 loop  
        while j<10 loop
            j   := j+1;
            DBMS_OUTPUT.PUT_LINE (i||' x '|| j || ' = ' || j*i);
        end loop;
        i   :=  i+1;
    end loop;

END;
/
--2
begin
    for j in 2..9 loop    
        for i in 1..j loop
            DBMS_OUTPUT.PUT_LINE (j||' x '|| i || ' = ' || j*i);
        end loop;
        DBMS_OUTPUT.PUT_LINE ('--------------------------'); 
    end loop;
end;
/
--2------------------------------
declare
    v_x number := 1;
    v_y number := 2;
begin
    loop
        v_x := 1;
        loop
            DBMS_OUTPUT.PUT_LINE (v_y || ' x '|| v_x || ' = ' || (v_y*v_x));
            exit when v_x=v_y;
             v_x := v_x+1;
        end loop;
        v_y := v_y+1;
        DBMS_OUTPUT.PUT_LINE ('--------------------------------------------------');
        exit when v_y=10;
    end loop;
end;
/

declare
    v_x number := 1;
    v_y number := 2;
begin
    while v_y <= 9 loop
            v_x := 1;
            while v_x<=9 loop
                DBMS_OUTPUT.PUT_LINE (v_y || ' x '|| v_x || ' = ' || (v_y*v_x));
                v_x := v_x+1;
                exit when v_x=v_y+1;
            end loop;
                DBMS_OUTPUT.PUT_LINE ('--------------------------------------------------');
            v_y := v_y+1;
        exit when v_y>9;
    end loop;
    
end;
/
--2--------------------------------------








--3
--(3-1)
declare
    v_rn number;
begin
select trunc(dbms_random.value(0,2)) into v_rn from dual;
DBMS_OUTPUT.PUT_LINE(v_rn);
end;
/
--(3-2)
declare
    v_rn number;
begin
    select trunc(dbms_random.value(0,2)) into v_rn from dual;
    if v_rn = 0 then
        DBMS_OUTPUT.PUT_LINE('head');
    else
        DBMS_OUTPUT.PUT_LINE('tail');
    end if;
        
end;
/
--(3-3)--------------------------------------------------------------
declare
    v_rn number;
    v_x  number := 0;
begin
    for i in 1..1000 loop
        select trunc(dbms_random.value(0,2)) into v_rn from dual;
        if v_rn = 1 then
            v_x := v_x+1;
        end if;
    end loop;
    DBMS_OUTPUT.PUT_LINE('0이 나온 횟수 : '|| (1000-v_x));
    DBMS_OUTPUT.PUT_LINE('1이 나온 횟수 : '|| v_x);
    DBMS_OUTPUT.PUT_LINE('1이 나온 횟수/전체 횟수 : '|| v_x/1000);
    
end;
/

--(3-3-2)--------------------------------------------------------------
declare
    v_rn number;
    v_x  number := 0;
    i    number :=1;
begin
    loop 
        select trunc(dbms_random.value(0,2)) into v_rn from dual;
        if v_rn = 1 then
            v_x := v_x+1;
        end if;
        i:=i+1;
    exit when i = 1000;
    end loop;
    DBMS_OUTPUT.PUT_LINE('0이 나온 횟수 : '|| (1000-v_x));
    DBMS_OUTPUT.PUT_LINE('1이 나온 횟수 : '|| v_x);
    DBMS_OUTPUT.PUT_LINE('1이 나온 횟수/전체 횟수 : '|| v_x/1000);
    
end;
/
--(3-3-3)--------------------------------------------------------------
declare
    v_rn number;
    v_x  number := 0;
    i    number := 1;
    j    number := 0;
    v_sum  number := 0;
begin
    for j in 1..1000 loop
        i := 0;
        v_x := 0;
        while i<=1000 loop 
            select trunc(dbms_random.value(0,2)) into v_rn from dual;
            if v_rn = 1 then
                v_x := v_x+1;
            end if;
            i:=i+1;   
        end loop;
        v_sum := v_sum+ v_x ;
        DBMS_OUTPUT.PUT_LINE('v_sum: '|| v_sum);
      end loop;
    DBMS_OUTPUT.PUT_LINE('1000번 실행해서 1이 나온 횟수의 평균 : '|| (v_sum / 1000000));
end;
/


--4 -1---------------------------
DECLARE
    v_x number;
    v_y number;
BEGIN
    v_x := dbms_random.value(0, 1);
    v_y := dbms_random.value(0, 1);
DBMS_OUTPUT.PUT_LINE('무작위 좌표 : ('|| v_x||','||v_y||')' );
END;
/
--4-2
DECLARE
    v_x number;
    v_y number;
    v_hit number := 0;
BEGIN
--    if sqrt(x ** 2, y **2)<1 then 

    select  power(dbms_random.value(0, 1),2),
            power(dbms_random.value(0, 1),2) 
    into v_x, v_y           from dual;

    if (v_x+v_y)<1 then
        v_hit := v_hit+1;
    end if;

DBMS_OUTPUT.PUT_LINE('v_hit : '|| v_hit );
END;
/

--4-3
DECLARE
    v_x number;
    v_y number;
    v_hit number := 0;
BEGIN

    for i in 1..1000000 loop
        select  power(dbms_random.value(0, 1),2),
                power(dbms_random.value(0, 1),2) 
        into v_x, v_y           from dual;
    
        if (v_x+v_y)<1 then
            v_hit := v_hit+1;
        end if;
    
    end loop;
DBMS_OUTPUT.PUT_LINE('v_hit : '|| v_hit );
DBMS_OUTPUT.PUT_LINE('(v_hit/1000000)*4 : '|| (v_hit/1000000)*4 );
END;
/

--      4-4 실험을 1000번 반복하고 평균을 구하자


DECLARE
    v_x number;
    v_y number;
    v_hit number := 0;
    v_sum number := 0;
BEGIN
    for i in 1..1000 loop
        v_hit := 0;
        for i in 1..1000 loop
            select  power(dbms_random.value(0, 1),2),
                    power(dbms_random.value(0, 1),2) 
            into v_x, v_y           from dual;
        
            if (v_x+v_y)<1 then
                v_hit := v_hit+1;
            end if;
        end loop;
        v_sum := v_sum + ((v_hit/1000)*4);
    end loop;
DBMS_OUTPUT.PUT_LINE('v_avg : '|| v_sum/1000 );

END;
/


