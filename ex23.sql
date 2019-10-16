set serveroutput on
--1
--이름을 입력 받아서, 사번 부서번호를 검색해서, 사번 이름 부서번호를 출력
accept p_ename char prompt '이름을 입력하세요 : ';
DECLARE
    v_empno     number(4,0);
    v_deptno    number(2,0);
    v_ename     varchar2(10) := upper('&p_ename');

BEGIN
    select empno, deptno 
    into v_empno, v_deptno  from emp
    where upper(ename) = v_ename;
    dbms_output.put_line('당신의 이름은 : '|| v_ename );
    dbms_output.put_line('당신의 사번은 : '|| v_empno);
    dbms_output.put_line('당신의 부서번호는 : '|| v_deptno);

END;

/

--2
-- 이름을 입력 받아서
-- emp, dept 테이블을 이용해서(join)
-- 'scott은 DALLAS의 RESEARCH 부서에서 근무합니다.'와 같은 형식으로 출력
accept p_ename char prompt '이름을 입력하세요 : ';
DECLARE
    v_ename     varchar2(10) := trim(upper('&p_ename'));
    v_deptno    number(2,0);
    v_loc       varchar(13);
    v_dname     varchar(14);
BEGIN
    select d.dname, d.loc into v_dname, v_loc
    from dept d, emp e
    where upper(e.ename) = v_ename and e.deptno = d.deptno;
    
    dbms_output.put_line(v_ename||'는 '||v_loc||'의 '||v_dname||'부서에서 근무합니다.' );

END;
/


accept p_ename  char prompt '이름을 입력하세요 : ';
DECLARE
    v_ename     varchar2(20)    :=  upper(trim('&p_name'));
    v_dname     varchar2(14);
    v_loc       varchar2(13);  
    v_deptno    number(2);
BEGIN
    -- 사원 이름으로 그 사원이 근무하는 부서 번호를 검색
    select deptno       into v_deptno 
    from emp            where upper(ename) = v_ename;
    -- 부서 번호를 이용해서 부서의 이름, 위치를 검색하자
    select loc, dname   into v_loc, v_dname 
    from dept           where deptno = v_deptno;
    
    dbms_output.put_line(v_ename || v_loc || v_dname);
        dbms_output.put_line(v_ename||'는 '||v_loc||'의 '||v_dname||'부서에서 근무합니다.' );
END;

/






