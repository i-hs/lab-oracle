SET SERVEROUTPUT ON;

select *    from dept;

declare
    v_dept dept%rowtype;
begin
    select * into v_dept  from dept where deptno=10;
    -- ����Ŭ DB ���ο��� ������ Ŀ���� �ڵ����� ������.
    dbms_output.put_line(v_dept.deptno);
end;
/
  
  -- select into ������ 1�� �̻��� ��(row)�� select�Ǵ� ���� ����� �� ����.
  -- ����� Ŀ���� select�� ��� ���� ������ ������� ����� �� �ִ�.
  declare
  -- ����� Ŀ�� ����
  -- cursor  Ŀ���̸� is (SQL ����);
    cursor my_cursor is (
        select * from dept where deptno = 10     -- �����ݷ�(;) ����
    );

    v_row dept%rowtype;  -- Ŀ���� �����͸� ����(fetch) �� �� ����� ����
  begin
    -- Ŀ�� open (����, sql ���� ����)
        open my_cursor;
    
    -- Ŀ�� fetch(������ �б�)
        fetch my_cursor into v_row;
        dbms_output(v_row.deptno || v_row.dname|| v_row.loc);
    -- Ŀ�� close(�ݱ�)
        close my_cursor;
  end;
  /
  
  declare
    --(1) Ŀ�� ����
    cursor sel_emp is (
        select * from emp where empno = 7788
    );
    v_row emp%rowtype;
  
  begin
  --(2) Ŀ�� open
    open sel_emp;
  --(3) Ŀ�� ���� ��� �б�(fetch)
    fetch sel_emp into v_row;
    dbms_output.put_line(v_row.empno||','||v_row.ename);
    
    -- (4) Ŀ�� close
    close sel_emp;
  
  end;
  /
  
  -- ��� ���� �������� �� �� �ִ� ����� Ŀ��
  declare
    -- ����� Ŀ�� ����
    cursor sel_dept is (
        select * from dept
    );
    -- Ŀ�� ���� ����� fetch �� �� ����� ����
    v_row dept%rowtype;

  begin
    --(2) open
    open sel_dept;
    
    --(3) fetch -- ��� ���� �������� ��� �ݺ��� �ȿ��� fetch�ؾ� �Ѵ�.
    loop
        fetch sel_dept into v_row;
        -- Ŀ������ �� �̻� ���� ���ڵ尡 ���� �� loop ����
        exit when sel_dept%notfound;
        dbms_output.put_line(v_row.deptno || ', ' ||v_row.dname || ', '|| v_row.loc);
    end loop;        
    
    --(4) close 
    close sel_dept;
  end;
  /
  
-- emp ���̺��� �μ���ȣ�� 30���� �������� ���, �̸�, �޿��� ���

declare
    cursor emp_inf is (
        select empno, ename, sal from emp 
    );
    type my_record is record(
    empno emp.empno%type,
    ename emp.ename%type,
    sal emp.sal%type
    );  -- ������ ���ڵ�Ÿ������ �����Ѵ�.
    v_row my_record;
begin
    open emp_inf;
/*        loop
            fetch emp_inf into v_row;
            exit when emp_inf%notfound;
            dbms_output.put_line(e_empno||', '||e_ename||', '||e_sal);
        end loop;*/
--        �Ʒ��� ���°��� �ǹ�. �ѹ� fetch�� �ؾ� found�� �ǹǷ� ���� �� �� fetch�� �Ѵ�.
--          while �Ʒ��� fetch�� ���� ���� �о���̴� ��.
    fetch emp_inf into v_row;
    while emp_inf%found loop
        fetch emp_inf into v_row;
        dbms_output.put_line(my_record.empno||', '||my_record.ename||', '||my_record.sal);
    end loop;
    
    close emp_inf;

end;
/

declare
    cursor my_cursor is (
    select * from dept   
    );
begin
    for row in my_cursor loop
        dbms_output.put_line(row.deptno || ', '|| row.dname ||', '|| row.loc);
    end loop;
end;
/


-- ����� Ŀ��, for loop�� ����ؼ�
-- 20�� �μ� �������� ���, �̸�, �޿��� ���
declare
    cursor my_cursor is (
    select * from emp where deptno = 20 
    );

begin
    for ii in my_cursor loop
        dbms_output.put_line(ii.empno || ', '|| ii.ename ||', '|| ii.sal);
    end loop;
end;
/

-- 1. ��ü ������ �޿� ��պ��� ���� �޿��� �޴� �������� �̸��� ����ϴ� PL/SQL
declare
    cursor my_cursor is (
    select ename from emp where sal<(select avg(sal) from emp) 
    );
    

begin
    for result in my_cursor loop
        dbms_output.put_line(result.ename);
    end loop;
    
end;
/

-- �Ķ����(parameter, �Ű�����)�� ���� Ŀ�� ����
-- cursor  Ŀ���̸�(�Ű�����1 ����Ÿ��1,�Ű�����2 ����Ÿ��2 ... ) is SQL����;
declare
    v_avg number;
    cursor my_cursor(p_avg number) is (
        select ename from emp where sal < p_avg);
begin
    -- ��ü ������ �޿� ����� �˾Ƴ�.
    select avg(sal) into v_avg from emp;
    dbms_output.put_line(v_avg);

    -- �Ķ���͸� ���� Ŀ���� open/fetch/close
    for row in my_cursor(v_avg) loop
        dbms_output.put_line(row.ename);
    end loop;
end;
/






-- 2. 10�� �μ�����, 10�� �μ� �������� �޿� ��պ��� ���� �޿��� �޴� �������� �̸��� ����ϴ� PL/SQL
declare
    cursor my_cursor is (
    select * from emp 
    where sal<=(select avg(sal) from emp where deptno = 10) 
    and deptno = 10
    );
    
    
begin
    
    for row in my_cursor loop
        dbms_output.put_line(row.ename);
    end loop;
    
end;
/
select ename,deptno from emp where deptno = 10 and sal<=(select avg(sal) from emp where deptno = 10) ;
select avg(sal) from emp group by deptno  ;
select sal, ename from emp ;
/
select * from emp where sal<=(select avg(sal) from emp );

-- 3. �� �μ�����, �� �μ� �������� �޿� ��պ��� ���� �޿��� �޴� �������� 
-- �μ���ȣ�� ���� �̸��� ����ϴ� PL/SQL
declare
    cursor my_cursor(p_dno emp.deptno%type) is (
    select * from emp 
    where sal<(select avg(sal) from emp where deptno = p_dno) 
    and deptno = p_dno
    );
    cursor dno_cursor is(
        select deptno from dept
    );
 
    
begin
    for dnum in dno_cursor loop  
            for row in my_cursor(dnum.deptno) loop
                dbms_output.put_line(row.deptno||', '|| row.ename);
            end loop;
        end loop;

end;
/

-- 3. �� �μ�����, �� �μ� �������� �޿� ��պ��� ���� �޿��� �޴� �������� 
-- �μ���ȣ�� ���� �̸��� ����ϴ� PL/SQL

declare
    cursor my_cursor(p_dno emp.deptno%type) is (
        select * from emp
        where sal<(select avg(sal) from emp where deptno = p_dno)
        and deptno = p_dno
    );
    cursor dno_cursor is(
        select distinct deptno from emp 
    );
    
begin
    for dnum in dno_cursor loop
        for row in my_cursor(dnum.deptno) loop
            dbms_output.put_line(row.deptno||', '|| row.ename);
        end loop;
    end loop;
end;
/
/*
declare
    type rec_emp is record(
        deptno dept.deptno%type,
--        sal   emp.sal%type
        avgsal  number
    );
    v_emp    rec_emp;
    
begin
    select deptno,  avg(sal)    into v_emp 
    from emp        group by deptno;
    
 
        loop
            exit when v_emp%notfound;
            dbms_output.put_line(v_emp.deptno||', '|| v_emp.avgsal);
        
        end loop;
end;
/   */
--����
declare
        cursor cur1 is
        select deptno, avg(sal) average from emp
        group by deptno
        order by deptno;
    
    cursor cur2(p_deptno emp.deptno%type, p_avg number) is
        select deptno, ename, sal from emp 
        where deptno = p_deptno and sal < p_avg;
    
begin
    for r1 in cur1 loop
        dbms_output.put_line(r1.deptno || ', ' || r1.average);
        for r2 in cur2(r1.deptno, r1.average) loop
                dbms_output.put_line(r2.deptno || ', '||r2.ename||', '||r2.sal);
        end loop;
    end loop;
end;
/

select a.dno
from (select deptno dno, avg(sal) average from emp group by deptno) a;


declare
cursor cur1 is(
    select e.ename, e.deptno, a.average, e.sal
    from emp e
        join (  select deptno,  avg(sal) average
                from emp        group by deptno) a
        on e.deptno = a.deptno
        where e.sal<a.average);
        
begin
    for rslt in cur1    loop
        dbms_output.put_line(rslt.ename||', '|| rslt.deptno||', '||rslt.sal);
    end loop;

end;