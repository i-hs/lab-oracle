SET SERVEROUTPUT ON;

select *    from dept;

declare
    v_dept dept%rowtype;
begin
    select * into v_dept  from dept where deptno=10;
    -- 오라클 DB 내부에서 묵시적 커서가 자동으로 생성됨.
    dbms_output.put_line(v_dept.deptno);
end;
/
  
  -- select into 구문은 1개 이상의 행(row)이 select되는 경우는 사용할 수 없다.
  -- 명시적 커서는 select의 결과 행의 갯수에 상관없이 사용할 수 있다.
  declare
  -- 명시적 커서 선언
  -- cursor  커서이름 is (SQL 문장);
    cursor my_cursor is (
        select * from dept where deptno = 10     -- 세미콜론(;) 없음
    );

    v_row dept%rowtype;  -- 커서의 데이터를 저장(fetch) 할 때 사용할 변수
  begin
    -- 커서 open (열기, sql 문장 실행)
        open my_cursor;
    
    -- 커서 fetch(데이터 읽기)
        fetch my_cursor into v_row;
        dbms_output(v_row.deptno || v_row.dname|| v_row.loc);
    -- 커서 close(닫기)
        close my_cursor;
  end;
  /
  
  declare
    --(1) 커서 선언
    cursor sel_emp is (
        select * from emp where empno = 7788
    );
    v_row emp%rowtype;
  
  begin
  --(2) 커서 open
    open sel_emp;
  --(3) 커서 실행 결과 읽기(fetch)
    fetch sel_emp into v_row;
    dbms_output.put_line(v_row.empno||','||v_row.ename);
    
    -- (4) 커서 close
    close sel_emp;
  
  end;
  /
  
  -- 결과 행이 여러개가 될 수 있는 명시적 커서
  declare
    -- 명시적 커서 선언
    cursor sel_dept is (
        select * from dept
    );
    -- 커서 실행 결과를 fetch 할 때 사용할 변수
    v_row dept%rowtype;

  begin
    --(2) open
    open sel_dept;
    
    --(3) fetch -- 결과 행이 여러개일 경우 반복문 안에서 fetch해야 한다.
    loop
        fetch sel_dept into v_row;
        -- 커서에서 더 이상 읽을 레코드가 없을 때 loop 종료
        exit when sel_dept%notfound;
        dbms_output.put_line(v_row.deptno || ', ' ||v_row.dname || ', '|| v_row.loc);
    end loop;        
    
    --(4) close 
    close sel_dept;
  end;
  /
  
-- emp 테이블에서 부서번호가 30번인 직원들의 사번, 이름, 급여를 출력

declare
    cursor emp_inf is (
        select empno, ename, sal from emp 
    );
    type my_record is record(
    empno emp.empno%type,
    ename emp.ename%type,
    sal emp.sal%type
    );  -- 변수를 레코드타입으로 선언한다.
    v_row my_record;
begin
    open emp_inf;
/*        loop
            fetch emp_inf into v_row;
            exit when emp_inf%notfound;
            dbms_output.put_line(e_empno||', '||e_ename||', '||e_sal);
        end loop;*/
--        아래와 위는같은 의미. 한번 fetch를 해야 found가 되므로 먼저 한 번 fetch를 한다.
--          while 아래의 fetch가 다음 행을 읽어들이는 것.
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


-- 명시적 커서, for loop를 사용해서
-- 20번 부서 직원들의 사번, 이름, 급여를 출력
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

-- 1. 전체 직원의 급여 평균보다 적은 급여를 받는 직원들의 이름을 출력하는 PL/SQL
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

-- 파라미터(parameter, 매개변수)를 갖는 커서 선언
-- cursor  커서이름(매개변수1 변수타입1,매개변수2 변수타입2 ... ) is SQL문장;
declare
    v_avg number;
    cursor my_cursor(p_avg number) is (
        select ename from emp where sal < p_avg);
begin
    -- 전체 직원의 급여 평균을 알아냄.
    select avg(sal) into v_avg from emp;
    dbms_output.put_line(v_avg);

    -- 파라미터를 갖는 커서를 open/fetch/close
    for row in my_cursor(v_avg) loop
        dbms_output.put_line(row.ename);
    end loop;
end;
/






-- 2. 10번 부서에서, 10번 부서 직원들의 급여 평균보다 적은 급여를 받는 직원들의 이름을 출력하는 PL/SQL
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

-- 3. 각 부서에서, 그 부서 직원들의 급여 평균보다 적은 급여를 받는 직원들의 
-- 부서번호와 직원 이름을 출력하는 PL/SQL
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

-- 3. 각 부서에서, 그 부서 직원들의 급여 평균보다 적은 급여를 받는 직원들의 
-- 부서번호와 직원 이름을 출력하는 PL/SQL

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
--내꺼
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