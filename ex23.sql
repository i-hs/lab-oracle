set serveroutput on
--1
--�̸��� �Է� �޾Ƽ�, ��� �μ���ȣ�� �˻��ؼ�, ��� �̸� �μ���ȣ�� ���
accept p_ename char prompt '�̸��� �Է��ϼ��� : ';
DECLARE
    v_empno     number(4,0);
    v_deptno    number(2,0);
    v_ename     varchar2(10) := upper('&p_ename');

BEGIN
    select empno, deptno 
    into v_empno, v_deptno  from emp
    where upper(ename) = v_ename;
    dbms_output.put_line('����� �̸��� : '|| v_ename );
    dbms_output.put_line('����� ����� : '|| v_empno);
    dbms_output.put_line('����� �μ���ȣ�� : '|| v_deptno);

END;

/

--2
-- �̸��� �Է� �޾Ƽ�
-- emp, dept ���̺��� �̿��ؼ�(join)
-- 'scott�� DALLAS�� RESEARCH �μ����� �ٹ��մϴ�.'�� ���� �������� ���
accept p_ename char prompt '�̸��� �Է��ϼ��� : ';
DECLARE
    v_ename     varchar2(10) := trim(upper('&p_ename'));
    v_deptno    number(2,0);
    v_loc       varchar(13);
    v_dname     varchar(14);
BEGIN
    select d.dname, d.loc into v_dname, v_loc
    from dept d, emp e
    where upper(e.ename) = v_ename and e.deptno = d.deptno;
    
    dbms_output.put_line(v_ename||'�� '||v_loc||'�� '||v_dname||'�μ����� �ٹ��մϴ�.' );

END;
/


accept p_ename  char prompt '�̸��� �Է��ϼ��� : ';
DECLARE
    v_ename     varchar2(20)    :=  upper(trim('&p_name'));
    v_dname     varchar2(14);
    v_loc       varchar2(13);  
    v_deptno    number(2);
BEGIN
    -- ��� �̸����� �� ����� �ٹ��ϴ� �μ� ��ȣ�� �˻�
    select deptno       into v_deptno 
    from emp            where upper(ename) = v_ename;
    -- �μ� ��ȣ�� �̿��ؼ� �μ��� �̸�, ��ġ�� �˻�����
    select loc, dname   into v_loc, v_dname 
    from dept           where deptno = v_deptno;
    
    dbms_output.put_line(v_ename || v_loc || v_dname);
        dbms_output.put_line(v_ename||'�� '||v_loc||'�� '||v_dname||'�μ����� �ٹ��մϴ�.' );
END;

/






