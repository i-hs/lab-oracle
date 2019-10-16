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
where sal<      (select  avg(sal) 
                    from ex_emp3);

select avg(sal)
from ex_emp3;
select *    from ex_emp3 ;
--1
create table customers (
    customer_id                 varchar2(20),
    customer_pw                 varchar2(20)  not null, 
    customer_email              varchar2(100), 
    customer_gender             number(1),
    customer_age                number(3) default 0,
     
     constraint cust_id_chk         check       (length(customer_id)>=8),
     constraint pk_cst              primary key (customer_id),
     constraint cust_pw_chk         check       (length(customer_pw)>=8),
     constraint gen_cst             check       (customer_gender in (0,1,2)),
     constraint age_lmit            check       (customer_age between 0 and 200)
); 
--2
create table orders(
    order_id           number(12),
    order_date         date         default sysdate,
    order_method       varchar2(8),
    customer_id        number(6),
    order_status       number(2)    default 0,
    sales_rep_id       number(6),
    
    constraint ord_mth_chks check (order_method in('direct', 'online'))
);
--update orders(order_id)
--set order_id = 'chochen'
insert into orders
values('111112','1994-05-09','300303','online','123456','2','12456');

update orders
set sales_rep_id=100
where sales_rep_id is null;
select * from orders;
commit;

--3
create table order_items(
    order_id            number(12),
    product_id          number(10),
    quantity            number(4)           default 0,
    price               number(10),
    
    constraint pk_ord_items     primary key (order_id, product_id)
);

-- order items table에 record insert 
insert into order_items
values (1111112,11187572,10,40000);

insert into order_items(order_id, product_id)
values (1000010,111,32,15000);
select * from order_items;

select o.order_id, o.order_date, i.product_id, i.quantity, i.price
from orders o join order_items i
on o.order_id = i.order_id;

select o.order_id, o.order_date, i.product_id, i.quantity, i.price
from orders o ,order_items i
where o.order_id = i.order_id; 

-- orders, order_items 테이블에서 주문번호, 주문 날짜, 상품 아이디, 상품 수량, 샹품 가격

-- Data manipulation language : insert, update, delete 
-- commit을 명시적으로 수행한 경우에만 데이터베이스에 영구히 저장
SELECT * from order_items;
delete from order_items;
rollback;
truncate table order_items;


drop table ex_emp2;
select * from ex_emp2;
rollback;


--1 













