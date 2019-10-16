--SELECT COMM, NVL(COMM, 0) ,NVL2(COMM, 'True', 'False') FROM EMP;
--1
SELECT empno, RPAD(SUBSTR(empno,1,2), LENGTH(empno), '*') "MASK_NO",
            ename, RPAD(SUBSTR(ename,1,1), LENGTH(ename), '*') "MASK_NAME"
FROM emp
WHERE LENGTH(ENAME)=5;

--2
SELECT empno, ename, sal, 
    TRUNC(SAL/21.5,3)"day_pay", 
            ROUND(SAL/(21.5*8),2)"time_pay"
FROM emp;

--3
SELECT empno, ename, sal, TO_CHAR(hiredate,'YYYY-MM-DD'),  TO_CHAR(next_day(ADD_MONTHS(hiredate,3),'월'),'YYYY-MM-DD') as"regular"
FROM emp;

SELECT TO_DATE(TO_CHAR(SYSDATE,'YYYY-MM-DD')) FROM DUAL;
/*
SELECT next_day(ADD_MONTHS(hiredate,3),'월요일')
FROM EMP;

SELECT NEXT_DAY(HIREDATE,'월요일')
FROM EMP; */
--3
