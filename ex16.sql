-- 레코드 수정/삭제
SELECT * FROM EX_EMP3;

create table ex_emp3
as select * from emp;

--EX_EMP3 TABLE에서 EMPNO 7369  사원의 급여를 2000으로 변경

UPDATE EX_EMP3 
set sal = 2000 
where empno = 7369;

select * from ex_emp3;
commit;
rollback;
delete FROM EX_EMP3 where deptno = 10;
select * from ex_emp3 ;

UPDATE EX_EMP3
SET DEPTNO = NULL
WHERE EMPNO = 7369;

update ex_emp3
set comm = 100
where deptno = 20;


update ex_emp3
set sal = 2*sal
where sal< (select  avg(sal) 
                    from ex_emp3);

select avg(sal)
from ex_emp3;
select * from ex_emp3 ;

create table customers (
    customer_id             varchar2(20)            constraint cust_id_chk     check(length(customer_id)>=8) 
                                                              constraint pk_cst             primary key,
    customer_pw            varchar2(20)           constraint cust_pw_chk     check(length(customer_pw)>=8)  
                                                                                                   not null, 
    customer_email        varchar2(100), 
    customer_gender      number(1)              constraint gen_cst            check (customer_gender in (0,1,2)),
    customer_age           number(3)                                                    default 0 
                                                              constraint age_lmit          check(customer_age<200)
);

create table orders(
    order_id            number(12),
    order_date         date                  default sysdate,
    order_method    varchar2(8)         constraint ord_mth_chk    check (order_method in('direct', 'online')),
    customer_id       number(6),
    order_status       number(2)          default 0,
    sales_rep_id       number(6)
);

create table order_items(
    order_id number(12),
    product_id number(10),
    quantity number(4) default 0,
    price number(10),
    
    constraint pk_ord_item primary key (order_id, product_id)
);