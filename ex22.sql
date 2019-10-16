-- 상수(constant): 값이 한번 저장(할당)되면 값을 변경할 수 없는 변수

DECLARE
 -- 변수선언&초기화
    var1     number          := 1;
    var2     varchar2(20)    := 'abc' ;
    const1   constant number := 3.14;
BEGIN
    VAR1 := 2;
    VAR2 := '가나다';

END;
/
set serveroutput on;
DECLARE
    v_num   number default 0;
    
BEGIN
    dbms_output.put_line('v_num =' || v_num);
END;
/
set serveroutput on;
declare
    v_num1 number := 10;
    v_num2 number not null := 20;
begin
    v_num1 := null;
    v_num2 := null;
end
;
/

DECLARE
    v_sal       number;
BEGIN
    -- emp 테이블에서 7788번 사원의 급여를 검색
    select sal  into v_sal 
                from emp    where empno = 7788;
    -- 검색한 7788번 사원의 급여를 화면에 출력
    dbms_output.put_line('7788번 사원의 급여는 ' || v_sal); 
END;
/
--1번
--사번을 입력 받아서 입력 받은 사번의
--사원 이름과 부서번호를 검색해서 화면에 출력
accept p_empno prompt '사번을 입력하세요 : ';
DECLARE
    v_name      varchar2(10) ;
    v_empno     number(20) := &p_empno ;
    v_deptno    number(10) ;
    v_deptname  varchar2(10);
BEGIN
    select ename, deptno into v_name, v_deptno 
                         from emp              where empno = v_empno;
    select d.dname  into v_deptname 
                    from emp e, dept d 
                    where e.empno = v_empno and e.deptno = d.deptno;
                    
    dbms_output.put_line('당신의 이름은 : '|| v_name );
    dbms_output.put_line('당신의 부서이름은 : '|| v_deptname);
    dbms_output.put_line('당신의 부서번호는 : '|| v_deptno);
END;
/
--2
accept p_empno prompt '사번을 입력하세요 : ';
    
DECLARE
    v_sal       number(38) ;
    v_comm      number(38) ;
    v_empno     number(20) := &p_empno ;
    v_sum       number(38)  ;
    v_name      varchar2(10) ;
    v_deptno    number(10) ;
    v_deptname  varchar2(10);
BEGIN
    select sal              into v_sal                  --급여
    from emp                where empno = v_empno;
    select NVL(COMM, 0)     into v_comm                 --성과금
    from emp                where empno = v_empno;
    select ename, deptno    into v_name, v_deptno         --이름/부서번호
                            from emp              where empno = v_empno;
    select d.dname          into v_deptname                 --부서이름
                            from emp e, dept d 
                            where e.empno = v_empno and e.deptno = d.deptno;
    v_sum := v_sal + v_comm;                                --총급여 (sal+comm)
    dbms_output.put_line('당신의 이름은 : '|| v_name );
    dbms_output.put_line('당신의 부서이름은 : '|| v_deptname);
    dbms_output.put_line('당신의 부서번호는 : '|| v_deptno);
    dbms_output.put_line('당신의  급여는 : '|| v_sal );
    dbms_output.put_line('당신의  성과금은 : '|| v_comm );
    dbms_output.put_line('당신의  총급여는 : '|| v_sum );

END;
/
select * from emp;

