select upper ('SQL course') from dual;
select lower ('SQL course') from dual;
select initcap ('SQL course') from dual;
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM emp;

SELECT * FROM emp
WHERE UPPER(ename) = UPPER('scott');

-- 직원 이름 중에 'LA'가 포함된 모든 직원들의 정보?
SELECT * FROM emp
WHERE UPPER(ename) LIKE UPPER('%LA%');

SELECT CONCAT ('HELLO', 'WORLD') FROM DUAL;

SELECT SUBSTR('HELLO', 1,4) FROM DUAL;

SELECT LENGTHb ('이이abc') FROM DUAL;

SELECT *
FROM emp
WHERE LENGTH(ename)>=6;

SELECT instr('HelloWorld', 'l',5) from dual;

SELECT instr(lower('HelloWorld'), 'w') from dual;
select rpad('hello',10,'abcde' ) from dual;
select lpad('hello',15,'abcde' ) from dual;

select rpad(substr(ename,1,3),length(ename),'*') from emp where sal>=1500;

select trim('h' from 'hhello hello ollehhh') from dual;
select trim(' ' from '       hhello                hello         ollehhh               ') from dual;
select round(123.4567, 0), round(123.4567, 1), round(123.4567, 2) from dual;
select round(123.4567, -1), round(123.4567, -2) from dual;

select trunc(123.4567, 0), turnc(123.4567, 1), turnc(123.4567, 2)from dual;

select mod(7,3) from dual;

SELECT ceil(3.14), floor(3.14), ceil(-3.14), floor(-3.14) from dual;

select sysdate from dual;
SELECT add_months(sysdate, 1) from dual;

select add_months(sysdate +2, 1) from dual;

SELECT (round(months_between(sysdate, hiredate)/12,1)-30) FROM emp;

SELECT months_between(sysdate,hiredate) from emp;

SELECT round(sysdate, 'YYYY'), round(sysdate, 'Q'), round(sysdate, 'MM'), round(sysdate, 'DD'), SYSDATE from dual;

-- 오라클은 숫자로 변환할 수 있는 문자열들을 묵시적으로 타입 변환을 수행한 후 사칙 연산 계산을 함

SELECT '1000'+'abc' FROM dual;

SELECT '1000' + '100' FROM dual;

SELECT to_number('1,000', '999,999') + to_number('100','999') from dual;

select sysdate ,
        to_char(sysdate, 'yyyyMONDD')
   --  TO_CHAR(SYSDATE, 'HH:MI:SS AM'),
from dual;
select sysdate, 

        TO_CHAR(SYSDATE, 'DY'), TO_CHAR(SYSDATE,'DAY')
        
        
FROM DUAL;        

SELECT TO_CHAR(1000) + TO_CHAR(100) FROM DUAL;

SELECT TO_DATE('19/08/09') FROM DUAL;

SELECT TO_DATE('50/08/29', 'YY/MM/DD') ,
            TO_DATE('49/08/29', 'RR/MM/DD') ,
            TO_DATE('50/08/29', 'RR/MM/DD') 
FROM DUAL;

SELECT TO_DATE('17:10:15', 'HH24:MI:SS') FROM DUAL;