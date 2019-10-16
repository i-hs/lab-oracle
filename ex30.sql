--
set serveroutput on;


declare
    -- ���ڵ� ����
    type rec_dept is record (
        deptno  number,
        dname   varchar2(20),
        loc     varchar2(20)        
    );
        --���ڵ��� �̸��� ������ ������ �� ���
        v_dept_row rec_dept;
begin
    -- ���ڵ� ������ ���� ����
     
        v_dept_row.deptno := 99;
        v_dept_row.dname := 'ITWILL';
        v_dept_row.loc := '���� ����';
    
    dbms_output.put_line('��ȣ : '|| v_dept_row.deptno);
    dbms_output.put_line('��ȣ : '|| v_dept_row.dname);
    dbms_output.put_line('��ȣ : '|| v_dept_row.loc);
end;
/
select * from
dept2;

--/////////////

--dept2 ���̺� ���ڵ带 insert !!

declare
    type rec_dept is record (
        deptno  dept2.deptno%type,
        dname   dept2.dname%type,
        loc     dept2.loc%type
    );
    
    v_row rec_dept;
begin
    v_row.deptno    := 11;
    v_row.dname     := '�����ͺ��̽�';
    v_row.loc       := '����';
    
    --dept2 ���̺� ���ڵ带 ����insert!
    insert into dept2     values v_row;

end;
/
declare
    type rec_dept is record (
        deptno  dept2.deptno%type,
        dname   dept2.dname%type,
        loc     dept2.loc%type
    );
    
    v_row rec_dept;
begin
-- ���ڵ� Ÿ���� ������ ����� dept2 ���̺� ������Ʈ
--UPDATE dept2   SET deptno = ?, dname = '', loc = '' where deptno = 11;
    v_row.deptno    := 99;
    v_row.dname     := 'PL/SQL';
    v_row.loc       := '����';
    update dept2 set row = v_row where deptno = 11;
end;
/
DECLARE
    -- row type ��������
    v_row1 dept%rowtype;
    -- ���̺��� ����(�÷� �̸�/Ÿ��)�� �Ȱ��� ���ڵ� Ÿ��
BEGIN
    v_row1.deptno   := 22;
    v_row1.dname    := 'restaurant';
    v_row1.loc      := 'north korea';
    
    insert into dept2    values v_row1;
END;
/





-- ���ڵ带 �̿��� SELECT ���� 
DECLARE
    -- ���̺��� ��� Į���� �˻��ϴ� ��쿡��
    -- ���ڵ带 ���� �����ϴ� �ͺ��� %rowtype ������ ����ϴ� ���� ����.
    v_emp_row1 emp%rowtype;
    
    -- ���̺��� �Ϻ� �÷��� �˻��ϰų� �ΰ� �̻��� ���̺��� �����ϴ� ���
    -- ����� ���� ���ڵ带 �����ϴ� ���� ����.
    type rec_emp is record (
        empno   emp.empno%type,
        ename   emp.ename%type,
        job     emp.job%type
    );
    v_emp_row2 rec_emp;
    
BEGIN
    -- ���̺��� ��ü �÷� �˻�
    select *    into    v_emp_row1
    from emp    where   empno = 7788;
    dbms_output.put_line(v_emp_row1.empno|| ', ' || v_emp_row1.ename);

    
    -- ���̺��� �Ϻ� �÷��� �˻� 
    select empno, ename, job    into v_emp_row2
    from emp            where empno = 7839;
    dbms_output.put_line(v_emp_row2.empno|| ', ' || v_emp_row2.ename);
END;
/
--1
-- EMP ���̺�� DEPT ���̺���
-- ���, �̸�, �޿�, �μ� �̸�, �μ� ��ġ
-- �������� ������ �� �ִ� ���ڵ�(emp_dept)�� ����
-- ����(join) ������ �ۼ��ؼ� 7788�� ����� scott�� ������ ����ϴ� pl/sql�� �ۼ�
DECLARE
    type emp_dept is record (
        empno   emp.empno%type,
        ename   emp.ename%type,
        sal     emp.sal%type,
        deptno  dept.deptno%type,
        loc     dept.loc%type
    );
    v_emp_dept emp_dept;
    
BEGIN
    select e.empno, e.ename, e.sal, d.deptno, d.loc    into    v_emp_dept
    from emp e, dept d    where   e.empno = 7788 and e.deptno = d.deptno ;
    dbms_output.put_line('empno : '     ||v_emp_dept.empno|| 
                        ', ename : '    || v_emp_dept.ename||
                        ', sal : '      || v_emp_dept.sal || 
                        ', deptno : '   ||v_emp_dept.deptno || 
                        ', loc : '      ||v_emp_dept.loc);

END;
/
--2
-- emp ���̺�� salgrade ���̺���
-- ���, �̸�, �޿�, �޿� ���
-- 4�� �������� ������ �� �ִ� ���ڵ�(emp_sal)�� ����
-- ����(join) ������ �ۼ��ؼ� scott�� ������ ����ϴ� pl/sql
DECLARE
    type emp_sal is record (
        empno   emp.empno%type,
        ename   emp.ename%type,
        sal     emp.sal%type,
        grade   salgrade.grade%type        
    );
    v_emp_sal emp_sal;
    
BEGIN
    select e.empno, e.ename, e.sal, s.grade    into    v_emp_sal
    from emp e, salgrade s  
    where   e.empno = 7788 and 
           (e.sal between s.losal and s.hisal) ;
            
    dbms_output.put_line
    ('empno : '     ||v_emp_sal.empno|| 
    ', ename : '    || v_emp_sal.ename||
    ', sal : '      ||v_emp_sal.sal || 
    ', grade : '    ||v_emp_sal.grade );

END;
/





