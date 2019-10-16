set serveroutput on;
--9/27
--EMP 테이블과 DEPT 테이블에서
-- 사번, 이름, 급여, 부서 이름, 부서 위치
-- 변수들을 저장할 수 있는 레코드(emp_dept)를 정의
-- 조인(join) 문장을 작성해서 7788번 사원의 scott의 정보를 출력하는 pl/sql을 작성
declare
    type my_record  is record (
        empno emp.empno%type,
        ename emp.ename%type,
        sal     emp.sal%type,
        dname   dept.dname%type,
        loc     dept.loc%type
    );
        v_record my_record;
begin
    select e.empno, e.ename, e.sal, d.dname, d.loc
    into v_record
    from emp e , dept d 
    where e.deptno = d.deptno and e.empno = 7788;
  
    dbms_output.put_line( v_record.empno||','|| 
                            v_record.ename||','||
                            v_record.sal||','||
                            v_record.dname||' ,'||
                            v_record.loc);

end;
/
--9/30 
--피보나치수열 20개를 출력하고 f(n)/f(n+1) 출력하기
declare
a number := 1;
b number := 1;
begin
    for i in range 1..20 loop
         := 
end;
/
create table order_items2(
    order_id number(12),
    product_id number(10),
    quantity number(4) default 0,
    constraint o_it_pk primary key ( order_id, product_id)
);


--employees 각부서 테이블에서 급여 최소값 받는, (employee_id, first_name, department_id, salary) 출력
select employee_id, first_name, department_id, salary
from employees 
where (department_id, salary) in
    (select department_id, min(salary) from employees group by department_id);




