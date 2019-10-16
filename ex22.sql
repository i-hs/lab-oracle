-- ���(constant): ���� �ѹ� ����(�Ҵ�)�Ǹ� ���� ������ �� ���� ����

DECLARE
 -- ��������&�ʱ�ȭ
    var1     number          := 1;
    var2     varchar2(20)    := 'abc' ;
    const1   constant number := 3.14;
BEGIN
    VAR1 := 2;
    VAR2 := '������';

END;
/
set serveroutput on;
DECLARE
    v_num   number default 0;
    
BEGIN
    dbms_output.put_line('v_num =' || v_num);
END;
/
set serveroutput on;
declare
    v_num1 number := 10;
    v_num2 number not null := 20;
begin
    v_num1 := null;
    v_num2 := null;
end
;
/

DECLARE
    v_sal       number;
BEGIN
    -- emp ���̺��� 7788�� ����� �޿��� �˻�
    select sal  into v_sal 
                from emp    where empno = 7788;
    -- �˻��� 7788�� ����� �޿��� ȭ�鿡 ���
    dbms_output.put_line('7788�� ����� �޿��� ' || v_sal); 
END;
/
--1��
--����� �Է� �޾Ƽ� �Է� ���� �����
--��� �̸��� �μ���ȣ�� �˻��ؼ� ȭ�鿡 ���
accept p_empno prompt '����� �Է��ϼ��� : ';
DECLARE
    v_name      varchar2(10) ;
    v_empno     number(20) := &p_empno ;
    v_deptno    number(10) ;
    v_deptname  varchar2(10);
BEGIN
    select ename, deptno into v_name, v_deptno 
                         from emp              where empno = v_empno;
    select d.dname  into v_deptname 
                    from emp e, dept d 
                    where e.empno = v_empno and e.deptno = d.deptno;
                    
    dbms_output.put_line('����� �̸��� : '|| v_name );
    dbms_output.put_line('����� �μ��̸��� : '|| v_deptname);
    dbms_output.put_line('����� �μ���ȣ�� : '|| v_deptno);
END;
/
--2
accept p_empno prompt '����� �Է��ϼ��� : ';
    
DECLARE
    v_sal       number(38) ;
    v_comm      number(38) ;
    v_empno     number(20) := &p_empno ;
    v_sum       number(38)  ;
    v_name      varchar2(10) ;
    v_deptno    number(10) ;
    v_deptname  varchar2(10);
BEGIN
    select sal              into v_sal                  --�޿�
    from emp                where empno = v_empno;
    select NVL(COMM, 0)     into v_comm                 --������
    from emp                where empno = v_empno;
    select ename, deptno    into v_name, v_deptno         --�̸�/�μ���ȣ
                            from emp              where empno = v_empno;
    select d.dname          into v_deptname                 --�μ��̸�
                            from emp e, dept d 
                            where e.empno = v_empno and e.deptno = d.deptno;
    v_sum := v_sal + v_comm;                                --�ѱ޿� (sal+comm)
    dbms_output.put_line('����� �̸��� : '|| v_name );
    dbms_output.put_line('����� �μ��̸��� : '|| v_deptname);
    dbms_output.put_line('����� �μ���ȣ�� : '|| v_deptno);
    dbms_output.put_line('�����  �޿��� : '|| v_sal );
    dbms_output.put_line('�����  �������� : '|| v_comm );
    dbms_output.put_line('�����  �ѱ޿��� : '|| v_sum );

END;
/
select * from emp;

