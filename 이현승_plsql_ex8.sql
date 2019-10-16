
--ex 8.
--(1) 매니저인 사원들의 이름을 출력하는 SQL 작성
select  distinct e.ename from emp e, emp d
where e.empno in d.mgr ;


--(2) 매니저가 아닌 사원들의 이름을 출력하는 SQL 작성
select  distinct e.ename from emp e, emp d
where e.empno not in d.mgr ;

--(3) 사번을 파라미터에 전달하면, 그 사원이 매니저이면 'm', 매니저가 아니면 'e'를 리턴하는 함수를 작성하고 그 결과를 확인.

create or replace function my_mgr(
    p_empno emp.empno%type
    
) return varchar2
is
    
    cursor my_cursor is (
       select empno from emp where empno in (select distinct mgr from emp));
begin
    for i in my_cursor loop
        if p_empno = i.empno then
            return 'm'; 
        end if;
    end loop;          
    return 'e';
end;            
/
select my_mgr(7934) from dual;



/*
(4) 위에서 만든 함수를 사용해서 아래와 같이 결과가 출력되도록 PL/SQL 작성
SMITH  사원
SCOTT  매니저
KING   매니저
ADAM   사원
......
*/
declare
    cursor print_cursor is (
    select ename, empno from emp);
begin
    for i in print_cursor loop
        if my_mgr(i.empno)='m' then
            dbms_output.put_line(i.ename||' 매니저');
        else
            dbms_output.put_line(i.ename||' 사원');
        end if;
    end loop;

end;
/
