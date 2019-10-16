-- case ~ when ±¸¹® 
SET SERVEROUTPUT ON;

DECLARE
    v_score number := 88;
BEGIN
    case trunc(v_score,-1)
        when 100 then
            dbms_output.put_line('A');
        when 90  then
            dbms_output.put_line('A');
        when 80 then
            dbms_output.put_line('B');
        when 70 then
            dbms_output.put_line('C');
        else
            dbms_output.put_line('F');
    end case;
            
    dbms_output.put_line(MOD(v_score,-1));

END;
/

DECLARE
    v_score number := 59;
BEGIN
    case 
        when 90<=v_score then
            dbms_output.put_line('A');
        when 80<=v_score  then
            dbms_output.put_line('B');
        when 70<=v_score then
            dbms_output.put_line('C');
        when 60<=v_score then
            dbms_output.put_line('D');
        else
            dbms_output.put_line('F');
    end case;
            

END;



