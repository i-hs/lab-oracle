--���ǹ�, �ݺ��� ����
set serveroutput on;
begin 

    
    dbms_output.put('Hello World');

    dbms_output.new_line; -- Ű���忡�� ����Ű�� ġ�� ��
    

end;
/
-- ȭ�鿡 *****���

 begin
 dbms_output.put_line('*****');
 dbms_output.put('*');
 dbms_output.put('*');
 dbms_output.put('*');
 dbms_output.put('*');
 dbms_output.put('*');
 dbms_output.new_line;

  
    --(3)
    for i in 1..5 loop
        dbms_output.put('*');
    end loop;
    dbms_output.new_line;
    end;
    /
--��������1
accept itt prompt '�ݺ� Ƚ�� �Է� : ';

        declare
         d_num number := 1;
         d_mun number := 5;
         d_it  number := &itt;
        begin

            while d_num<=6 loop
                for i in 1..d_num loop
                    dbms_output.put('*');
                end loop;
            dbms_output.new_line;
            d_num := d_num+1;    
            end loop;
            ----------------�ݴ�
             while d_mun>0 loop
                for i in reverse 1..d_mun loop
                    dbms_output.put('*');
                end loop;
            dbms_output.new_line;
            d_mun := d_mun-1;    
            end loop;
    
end;
/
--��������2
declare
 d_num number := 5;
begin
    while d_num>0 loop
        for i in reverse 1..d_num loop
            dbms_output.put('*');
        end loop;
    dbms_output.new_line;
    d_num := d_num-1;    
    end loop;
end;
/

----------------------------���(for)
begin
    for i in 1..5 loop
        for j in i..5 loop
            dbms_output.put('*');
        end loop;
        dbms_output.new_line;
    end loop;
end;
/
--3
begin
    for i in 1..10 loop
        for j in 1..10 loop
            dbms_output.put(rpad(j+10*(i-1),3,' '));
        end loop;
        dbms_output.new_line;
    end loop;
end;
/
--
declare
    d_num number := 0;
begin
    while d_num<=100 loop   
        d_num := d_num+1;
        dbms_output.put(d_num||' ');        
        if mod(d_num,10) = 0 then
            dbms_output.new_line;       
        end if;
    end loop;
end;
/
--4
declare
    d_num number := 0;
begin
    while d_num<=100 loop   
        d_num := d_num+1;
        if trunc(d_num,-1)=3 or trunc(d_num,-1)=6 or trunc(d_num,-1)=9 then
            if mod(d_num,10)=3 or mod(d_num,10)=6 or mod(d_num,10)=9 then
                dbms_output.put('# ');
           
            else    
                dbms_output.put('* ');        
            end if;
        else
            if mod(d_num,10)=3 or mod(d_num,10)=6 or mod(d_num,10)=9 then
                dbms_output.put('* ');
           
            else    
                dbms_output.put(d_num||' ');        
            end if;
        end if;    
            
        if mod(d_num,10) = 0 then
            dbms_output.new_line;       
        end if;
    end loop;
end;
/

select trunc(33,-1) from dual;
--- test


declare
    d_num number := 0;
begin
    while d_num<=100 loop   
        d_num := d_num+1;
        if trunc(d_num,-1)=3 or trunc(d_num,-1)=6 or trunc(d_num,-1)=9 then
            if mod(d_num,10)=3 or mod(d_num,10)=6 or mod(d_num,10)=9 then
                dbms_output.put('# ');
           
            else    
                dbms_output.put('* ');        
            end if;
        elsif mod(d_num,10)=3 or mod(d_num,10)=6 or mod(d_num,10)=9 then
                dbms_output.put('* ');
           
        else    
            dbms_output.put(d_num||' ');        
           
        end if;    
            
        if mod(d_num,10) = 0 then
            dbms_output.new_line;       
        end if;
    end loop;
end;
/



begin
    for i in 1..100 loop
        if mod(i,30)=0 then
            dbms_output.put('* ');
--        if mod(i,10)=3 or mod(i,10)=6 or mod(i,10)=9 then
--                dbms_output.put('* ');
--           or trunc(i,-1)=6 or trunc(i,-1)=9 
--        else    
        else
        dbms_output.put(rpad(i,3,' '));
--        end if;
        end if;
        
         if mod(i,10) = 0 then
            dbms_output.new_line;       
        end if;       
    end loop;
end;
/

--------------------------------
begin
    for i in 1..10 loop
        for j in 1..10 loop
--            if (i>=2 and mod((i-1),3)=0)  and (mod(i,10)=3 or mod(i,10)=6 or mod(i,10)=9) then 
--                dbms_output.put('# ');
            if mod(i,10)=3 or mod(i,10)=6 or mod(i,10)=9 then 
                dbms_output.put(rpad('*',3,' '));
            elsif i>=2 and mod((i-1),3)=0 then
                dbms_output.put(rpad('*',3,' '));
            else
                dbms_output.put(rpad(j+10*(i-1),3,' '));
            end if;
        end loop;
        dbms_output.new_line;
    end loop;
end;
/
declare
    n1 number; -- 1�� �ڸ� ���ڸ� ������ ����
    n10 number; -- 10���ڸ� ���ڸ� ������ ����

begin
    for x in 1..100 loop
        n1 := mod(x,10);
        n10 := trunc(x/10,0);
        
        if n10 in (3,6,9) and n1 in (3,6,9) then
            dbms_output.put(rpad('# ',3,' '));
        elsif n10 in (3,6,9)or n1 in(3, 6, 9)  then
            dbms_output.put(rpad('* ',3,' '));        
        else        
            dbms_output.put(rpad(x,3,' '));
        end if;
        
        if mod(x,10) = 0 then
            dbms_output.new_line;
--             dbms_output.put_line('n1 : '||rpad(n1,3,' '));
--             dbms_output.put_line('n10 : '||rpad(n10,3,' '));
        end if; 
    end loop;
    dbms_output.new_line;
        
end;
/
declare
    z number;
begin
    for x in 0..9 loop
        for y in 1..10 loop
            z := 10*x + y;
            if      y in(3,6,9) and  x in(3,6,9) then
                dbms_output.put(rpad('#',3,' '));
            elsif   y in(3,6,9)  or   x in(3,6,9)  then
                dbms_output.put(rpad('*',3,' '));
            else
                dbms_output.put(rpad(z,3,' '));
            end if;
        end loop;
        dbms_output.new_line;
        
    end loop;
    
end;
/

-- factorial !! 
accept num prompt '���丮���� ����� ������ �Է��ϼ���. '
declare
    rst number:=1;
begin
    for i in 1..&num loop
        rst := rst * i;
    end loop;

DBMS_OUTPUT.put_line(&num || ' factorial ��갪�� : '|| rst);
        
end;
/






