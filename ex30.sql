--
set serveroutput on;


declare
    -- 레코드 정의
    type rec_dept is record (
        deptno  number,
        dname   varchar2(20),
        loc     varchar2(20)        
    );
        --레코드의 이름은 변수를 선언할 때 사용
        v_dept_row rec_dept;
begin
    -- 레코드 변수에 값을 저장
     
        v_dept_row.deptno := 99;
        v_dept_row.dname := 'ITWILL';
        v_dept_row.loc := '서울 강남';
    
    dbms_output.put_line('번호 : '|| v_dept_row.deptno);
    dbms_output.put_line('번호 : '|| v_dept_row.dname);
    dbms_output.put_line('번호 : '|| v_dept_row.loc);
end;
/
select * from
dept2;

--/////////////

--dept2 테이블에 레코드를 insert !!

declare
    type rec_dept is record (
        deptno  dept2.deptno%type,
        dname   dept2.dname%type,
        loc     dept2.loc%type
    );
    
    v_row rec_dept;
begin
    v_row.deptno    := 11;
    v_row.dname     := '데이터베이스';
    v_row.loc       := '서울';
    
    --dept2 테이블에 레코드를 저장insert!
    insert into dept2     values v_row;

end;
/
declare
    type rec_dept is record (
        deptno  dept2.deptno%type,
        dname   dept2.dname%type,
        loc     dept2.loc%type
    );
    
    v_row rec_dept;
begin
-- 레코드 타입의 변수를 사용한 dept2 테이블 업데이트
--UPDATE dept2   SET deptno = ?, dname = '', loc = '' where deptno = 11;
    v_row.deptno    := 99;
    v_row.dname     := 'PL/SQL';
    v_row.loc       := '강남';
    update dept2 set row = v_row where deptno = 11;
end;
/
DECLARE
    -- row type 참조변수
    v_row1 dept%rowtype;
    -- 테이블의 구조(컬럼 이름/타입)와 똑같은 레코드 타입
BEGIN
    v_row1.deptno   := 22;
    v_row1.dname    := 'restaurant';
    v_row1.loc      := 'north korea';
    
    insert into dept2    values v_row1;
END;
/





-- 레코드를 이용한 SELECT 구문 
DECLARE
    -- 테이블의 모든 칼럼을 검색하는 경우에는
    -- 레코드를 직접 정의하는 것보다 %rowtype 참조를 사용하는 것이 편리함.
    v_emp_row1 emp%rowtype;
    
    -- 테이블의 일부 컬럼만 검색하거나 두개 이상의 테이블에서 조인하는 경우
    -- 사용자 정의 레코드를 선언하는 것이 편리함.
    type rec_emp is record (
        empno   emp.empno%type,
        ename   emp.ename%type,
        job     emp.job%type
    );
    v_emp_row2 rec_emp;
    
BEGIN
    -- 테이블에서 전체 컬럼 검색
    select *    into    v_emp_row1
    from emp    where   empno = 7788;
    dbms_output.put_line(v_emp_row1.empno|| ', ' || v_emp_row1.ename);

    
    -- 테이블에서 일부 컬럼만 검색 
    select empno, ename, job    into v_emp_row2
    from emp            where empno = 7839;
    dbms_output.put_line(v_emp_row2.empno|| ', ' || v_emp_row2.ename);
END;
/
--1
-- EMP 테이블과 DEPT 테이블에서
-- 사번, 이름, 급여, 부서 이름, 부서 위치
-- 변수들을 저장할 수 있는 레코드(emp_dept)를 정의
-- 조인(join) 문장을 작성해서 7788번 사원의 scott의 정보를 출력하는 pl/sql을 작성
DECLARE
    type emp_dept is record (
        empno   emp.empno%type,
        ename   emp.ename%type,
        sal     emp.sal%type,
        deptno  dept.deptno%type,
        loc     dept.loc%type
    );
    v_emp_dept emp_dept;
    
BEGIN
    select e.empno, e.ename, e.sal, d.deptno, d.loc    into    v_emp_dept
    from emp e, dept d    where   e.empno = 7788 and e.deptno = d.deptno ;
    dbms_output.put_line('empno : '     ||v_emp_dept.empno|| 
                        ', ename : '    || v_emp_dept.ename||
                        ', sal : '      || v_emp_dept.sal || 
                        ', deptno : '   ||v_emp_dept.deptno || 
                        ', loc : '      ||v_emp_dept.loc);

END;
/
--2
-- emp 테이블과 salgrade 테이블에서
-- 사번, 이름, 급여, 급여 등급
-- 4개 변수들을 저장할 수 있는 레코드(emp_sal)를 정의
-- 조인(join) 문장을 작성해서 scott의 정보를 출력하는 pl/sql
DECLARE
    type emp_sal is record (
        empno   emp.empno%type,
        ename   emp.ename%type,
        sal     emp.sal%type,
        grade   salgrade.grade%type        
    );
    v_emp_sal emp_sal;
    
BEGIN
    select e.empno, e.ename, e.sal, s.grade    into    v_emp_sal
    from emp e, salgrade s  
    where   e.empno = 7788 and 
           (e.sal between s.losal and s.hisal) ;
            
    dbms_output.put_line
    ('empno : '     ||v_emp_sal.empno|| 
    ', ename : '    || v_emp_sal.ename||
    ', sal : '      ||v_emp_sal.sal || 
    ', grade : '    ||v_emp_sal.grade );

END;
/





