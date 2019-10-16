-- PL/SQL의 데이터 타입
SET SERVEROUTPUT ON;

declare
    -- dept 테이블의 각 칼럼의 값들을 저장할 수 있는 변수 선언.
    v_deptno     dept.deptno%type := 10; 
    v_dname      dept.dname%type;
    v_loc        dept.loc%type;
    
begin
    select dname, loc   into v_dname, v_loc
    from dept           where deptno=v_deptno;
    
    dbms_output.put_line(v_deptno || ' : ' || v_dname || ' : ' || v_loc);
end;
/

declare
    -- emp 테이블의 행row 의 모든 정보를 저장할 수 있는 변수를 선언
    v_emp7788    emp%rowtype;
       
begin
    select *        into v_emp7788
    from emp        where empno = 7788;
    dbms_output.put_line(v_emp7788.ename);
    dbms_output.put_line(v_emp7788.sal);
    dbms_output.put_line(v_emp7788.hiredate);
    end;
/









