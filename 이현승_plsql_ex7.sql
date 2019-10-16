/*
ex 7.
(1) 직원 이름과 그 직원의 매니저 이름을 출력하는 SQL 작성. 단, 매니저가 없는 직원도 출력해야 함.
(결과 예시)
emp_name mgr_name
FORD	 JONES
SCOTT	 JONES
JAMES	 BLAKE
......
KING 
*/
select e1.ename, e2.ename manager
from emp e1 left join emp e2
    on e1.mgr = e2.empno;



--(2) SCOTT의 매니저 이름을 출력하는 SQL 작성.
    select m.ename from emp e, emp m where e.ename='SCOTT' and e.mgr=m.empno;

/*
(3) 직원 이름을 파라미터에 전달하면 매니저의 이름을 리턴하는 함수를 작성하고 결과를 확인.
*/
create or replace function my_mgr(
    p_ename emp.ename%type
    
) return varchar2
is
    v_result emp.ename%type;                      
begin
    select d.ename into v_result 
    from emp e, emp d
    where e.ename = upper(p_ename) and
            e.mgr = d.empno;
    
    return v_result;                       
end;            
/         

select my_mgr('scott') from dual;