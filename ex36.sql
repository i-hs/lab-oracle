set serveroutput on;

create or replace function my_add(
    p_x number, 
    p_y number
) return number 
is
    v_result number;    -- return���� �����ϱ� ���� ����
begin
    v_result := p_x + p_y;
    return v_result;    -- �Լ��� ȣ���� ������ ���� ��ȯ(return)
end;
/

-- ����Ŭ ���� �Լ��� ������� ����� �� dual ���� ���̺��� ���.
select my_add(1,3) from dual;

--PL/SQL���� ���

declare
    v_result number;
begin
    v_result := my_add(100,200);
    DBMS_OUTPUT.put_line(v_result);
end;
/

-- ���� �ΰ��� �޾Ƽ� ������ ����� ����
create or replace function func_sub(
    p_x number, 
    p_y number
) return number 
is
    
begin
    
    return p_x-p_y;    -- �Լ��� ȣ���� ������ ���� ��ȯ(return)
end;
/
select func_sub(5,1) from dual;

-- ���� �� ���� �޾Ƽ� �� ���ڿ��� �ϳ��� ��ģ ���ڿ��� ����
create or replace function my_char_link(
    p_x varchar2, 
    p_y varchar2
) return varchar2 
is
    v_result varchar2(100);    -- return���� �����ϱ� ���� ����
begin
--    select concat(p_x,p_y) into v_result from dual; �� �� ����
    v_result := concat(p_x,p_y);
    return v_result;    -- �Լ��� ȣ���� ������ ���� ��ȯ(return)
end;
/
select my_char_link('Hello','World') from dual;
--������
create or replace function str_link(
    str1 varchar2, 
    str2 varchar2
) return varchar2 
is
begin
    return str1;    -- �Լ��� ȣ���� ������ ���� ��ȯ(return)
end;
/
declare
    v_rslt varchar2(100);
begin
    select my_char_link(ename,job) into v_rslt  
    from emp where empno = 7654;
    dbms_output.put_line(v_rslt);
end;
/

--  �����ȣ�� ������ �Ķ���ͷ� ���޹޾Ƽ�  �ѱ޿�(total = (sal+comm)*(1-tax)) �� ����ؼ� �����ϴ� �Լ�
create or replace function tot_sal(
    p_empno emp.empno%type, 
    p_taxrate number := 0.05
) return number
is
    v_sal emp.sal%type;
    v_comm emp.comm%type;
begin
    select sal, comm into v_sal, v_comm from emp where empno = p_empno; 
    return ((v_sal+nvl(v_comm,0))*(1-p_taxrate));
end;
/

declare
    cursor every_empno is ( select empno from emp);
begin
    for i in every_empno loop        
        DBMS_OUTPUT.PUT_LINE (i.empno||', '||tot_sal(i.empno));
    end loop;
    
end;
/
    select empno, ename, sal, comm, tot_sal(7788,0.05)
    from emp
    where empno = 7788;


--factorial
create or replace function fact(
    p_num number    
) return number
is
    rslt number := 1 ;
    
begin
        for i in 1..p_num loop
            rslt := rslt * i;
        end loop;
    
    return rslt;
end;
/
    select fact(-1) from dual;
    

create or replace function factorial2( n number ) return number

is
  v_result number =-1;
begin
    if n = 0 then
        v_result := 1;
    elsif ,>0 then
        v_result := factorial2(n-1)*n;
        -- repcol===--p
    end if;
      return factorial2(n-1)*n;   -- ���ȣ��( recursion ) �Լ� ���ο��� �ڱ� �ڽ��� �ٽ� ȣ���ϴ� ��.
    
    
end;
/

    