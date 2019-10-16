
--ex 9.
--(1) 사번, 이름, 입사일, 매니저 이름, 매니저 입사일을 출력하는 SQL 작성. 단, 매니저보다 먼저 입사한 직원들만 출력.
    select e.empno, e.ename, m.ename, m.hiredate 
    from emp e, emp m 
    where e.mgr=m.empno and e.hiredate <m.hiredate;
--(2) 7369 사원은 자기 매니저보다 먼저 입사했는 지 아닌지 확인하는 SQL 작성.
--7839 사원은 자기 매니저보다 먼저 입사했는지 아닌지 확인하는 SQL 작성
    select e.empno, e.ename, m.ename, m.hiredate 
    from emp e, emp m 
    where e.mgr=m.empno and e.hiredate <m.hiredate
    and e.empno = 7369;
--(3) 사번을 파라미터에 전달해서, 관리자보다 먼저 입사한 직원은 1, 그렇지 않은 직원은 0을 리턴하는 함수를 작성
    create or replace function mgr_hiredate( p_empno number  ) return number
    is
        v_hiredate date;
        v_mgr_hiredate date;
    begin
        select e1.hiredate, e2.hiredate
        into v_hiredate, v_mgr_hiredate
        from emp e1 left join emp e2
        on e1.mgr  = e2.empno
        where e1.empno = p_empno;
        
        if v_hiredate > v_mgr_hiredate then
            return 0;
        else
            return 1;
        end if;        
    end;
    /
    
--(4) 위에서 작성한 함수를 사용하여 아래와 같이 결과가 출력되도록 PL/SQL 작성
--SMITH  1980/12/17  1
--KING   1981/11/19  0
--......


declare
    cursor my_cursor is (
    select ename, to_char(hiredate,'yyyy/mm/dd') as hiredate, empno  from emp   
    );
begin
    for r in my_cursor loop
        dbms_output.put_line(r.ename || ', '|| r.hiredate ||', '|| mgr_hiredate(r.empno));
    end loop;
end;
/
