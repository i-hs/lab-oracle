
--ex 9.
--(1) ���, �̸�, �Ի���, �Ŵ��� �̸�, �Ŵ��� �Ի����� ����ϴ� SQL �ۼ�. ��, �Ŵ������� ���� �Ի��� �����鸸 ���.
    select e.empno, e.ename, m.ename, m.hiredate 
    from emp e, emp m 
    where e.mgr=m.empno and e.hiredate <m.hiredate;
--(2) 7369 ����� �ڱ� �Ŵ������� ���� �Ի��ߴ� �� �ƴ��� Ȯ���ϴ� SQL �ۼ�.
--7839 ����� �ڱ� �Ŵ������� ���� �Ի��ߴ��� �ƴ��� Ȯ���ϴ� SQL �ۼ�
    select e.empno, e.ename, m.ename, m.hiredate 
    from emp e, emp m 
    where e.mgr=m.empno and e.hiredate <m.hiredate
    and e.empno = 7369;
--(3) ����� �Ķ���Ϳ� �����ؼ�, �����ں��� ���� �Ի��� ������ 1, �׷��� ���� ������ 0�� �����ϴ� �Լ��� �ۼ�
    create or replace function mgr_hiredate( p_empno number  ) return number
    is
        v_hiredate date;
        v_mgr_hiredate date;
    begin
        select e1.hiredate, e2.hiredate
        into v_hiredate, v_mgr_hiredate
        from emp e1 left join emp e2
        on e1.mgr  = e2.empno
        where e1.empno = p_empno;
        
        if v_hiredate > v_mgr_hiredate then
            return 0;
        else
            return 1;
        end if;        
    end;
    /
    
--(4) ������ �ۼ��� �Լ��� ����Ͽ� �Ʒ��� ���� ����� ��µǵ��� PL/SQL �ۼ�
--SMITH  1980/12/17  1
--KING   1981/11/19  0
--......


declare
    cursor my_cursor is (
    select ename, to_char(hiredate,'yyyy/mm/dd') as hiredate, empno  from emp   
    );
begin
    for r in my_cursor loop
        dbms_output.put_line(r.ename || ', '|| r.hiredate ||', '|| mgr_hiredate(r.empno));
    end loop;
end;
/
