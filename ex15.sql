-- 제약 조건 2 
create table ex08 (
    col1 number,
    col2 number,
    constraint pk_ex08 primary key(col1),
    constraint uq_ex08 unique (col2)
    );

create table ex_emp2(
    empno number constraint pk_ex_emp2 primary key,
    ename varchar2(20),
    deptno number,    
    constraint fk_ex_dept2 foreign key (deptno) references ex_dept (deptno)
);

create table ex09(
    col1 number,
    col2 varchar2(20),
    constraint  pk_ex09 primary key (col1, col2) 
);

INSERT into ex09 values (1,'a');    --가능
INSERT into ex09 values (1,'b');    --가능
INSERT into ex09 values (2,'a');    --가능
INSERT into ex09 values (1,null);   --null 삽입 불가능


INSERT INTO EX_EMP2 (EMPNO, ename, deptno)
        SELECT empno, ename, deptno FROM EMP;

insert into ex_dept values (20, 'BusinessStrategy');

SELECT ep.ename, ep.empno, edpt.deptno, edpt.dname
from ex_dept edpt, ex_emp2 ep
where ep.deptno(+) = edpt.deptno;

SELECT ep.ename, ep.empno, edpt.deptno, edpt.dname
from ex_dept edpt left join ex_emp2 ep on ep.deptno = edpt.deptno;

CREATE TABLE EX_EMP3
AS SELECT * FROM EMP;







