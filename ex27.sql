-- ¹Ýº¹¹®
DECLARE
    v_num  number:= 1;
BEGIN
    loop
        dbms_output.put_line('v_num='||v_num);
        v_num   :=  v_num+1;
        exit when (v_num!=10);    
    end loop;
END;
/

DECLARE
    v_num number    :=1;
BEGIN
    loop
        dbms_output.put_line('2 x '||v_num||' = '||2*v_num);
        v_num   :=   v_num + 1;
        exit when (v_num>9);    
    end loop;
END;
/

DECLARE
    v_num number    := 1;
    
BEGIN
    while v_num<6 loop  
        dbms_output.put_line('v_num = '||v_num);
        v_num   :=  v_num+1;
    end loop;

END;
/
DECLARE
    v_num number    := 1;
BEGIN
    WHILE v_num<10 loop
        dbms_output.put_line('3 x '||v_num||' = '|| 3*v_num);
        v_num := v_num+1;
    end loop;
END;
/

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
    v_num number := 1;

begin
    while v_num <10 loop
        dbms_output.put_line('v_num = '|| v_num);
        v_num := v_num +1;
        exit when v_num = 5;
    end loop;
end;
/
BEGIN 
    FOR i in 1..10 loop
        dbms_output.put_line('i = '|| i);
        exit when i = 5;
    end loop;
end;
/
BEGIN
    FOR I IN 1..10 LOOP
        continue when mod(i,2)=0;
        dbms_output.put_line(i);
    end loop;
end;
/
BEGIN
    for i in 0..4 loop
        dbms_output.put_line(2*i+1);
    end loop;
END;
/