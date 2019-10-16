set serveroutput on;

declare
    -- ���ڿ��� ���ҷ� ����, ���� ������ �ε����� ����ϴ� ���� �迭�� ����.
    type students is table of varchar2(20) 
    index by PLS_INTEGER;
    
    -- ������ ���� �迭 Ÿ���� ���� ����
    v_stu students;

begin
    -- ���� �迭�� ������ ���� : �迭�̸�(�ε���) := ��;
    v_stu(1)    := '������';
    v_stu(2)    := '�����';
    v_stu(3)    := '�迵��';
    
    -- ���� �迭�� ����� ����(������)���� ���� �� : �迭�̸�(�ε���)
    for i in 1..3 loop
    dbms_output.put_line(v_stu(i));
    end loop;

end;
/
declare
    type korea is table of varchar2(5) 
    index by varchar2(20);
    v_kor korea;
begin
    v_kor('seoul')    := '02';
    v_kor('gyongido')    := '031';
    v_kor('busan')    := '051';
    
   
    dbms_output.put_line(v_kor('seoul'));
    dbms_output.put_line(v_kor('gyongido'));
    dbms_output.put_line(v_kor('busan'));
    
end;
/
declare
    -- �ε��� : ���� ���� , ���� ( ������ Ÿ�� ) : ���� 
    -- ������ Ÿ���� ������ ����;
    type arr_numbers is table of number(3)
    index by pls_integer;
    v_scores arr_numbers;
    v_sum number := 0;
    v_avg number := 0;
    v_devsum number := 0;
    v_dev   number  := 0;
    
begin
    -- ���� �迭 v_score�� 5���� ������ �Է��ϼ���
    v_scores(1) := 100;
    v_scores(2) := 75;
    v_scores(3) := 50;
    v_scores(4) := 60;
    v_scores(5) := 84;
    

   
    for i in 1..v_scores.count loop
        v_sum := v_sum + v_scores(i);
    end loop;
    
    v_avg := v_sum/v_scores.count;
    
    for j in 1..v_scores.count loop
        v_devsum := v_devsum + power((v_scores(j)-v_avg),2);
    end loop;
    
    v_dev := v_devsum/v_scores.count;
    
        
    dbms_output.put_line('�հ� : '||v_sum);
    dbms_output.put_line('��� : '||v_avg);
    dbms_output.put_line('�л� : '||v_dev);
    dbms_output.put_line('ǥ������ : '||SQRT(v_dev));
end;
/

--emp ���̺��� �޿��� ����, ���, �л�, ǥ�������� ����ϴ� PL/SQL?
DECLARE
    v_sum number;
    v_avg number;
    v_var number;
    v_std number;    
BEGIN

    select sum(sal), avg(sal), variance(sal), stddev(sal)
    into v_sum, v_avg, v_var, v_std
    from emp;
    
    dbms_output.put_line(trunc(v_sum,2));
    dbms_output.put_line(trunc(v_avg,2));
    dbms_output.put_line(trunc(v_var,2));
    dbms_output.put_line(trunc(v_std,2));
    
END;
/

-- �ε����� ���� ����, �迭�� ����(������)�� ���� Ÿ���� ���� �迭�� ����
-- ���� (dbms_random.value(x,y))�Լ��� trunc�� �̿��ؼ�, 
-- for loop�� ����ؼ� ���� �迭�� 10���� ���� ����(0 ~ 100)�� ����
-- 10�� ���� ������ ����, ���, �л�, ǥ�������� ����ϴ� ���� ����
-- power(x,y), sqrt(x)

declare

    type arr_numbers is table of number(3)
    index by pls_integer;
    v_scores arr_numbers;
    v_sum number := 0;
    v_avg number := 0;
    v_devsum number := 0;
    v_dev   number  := 0;
    v_max   number := 0;
    v_min   number := 100;
    ------������������� ����
    t_sum number := 0 ;
    t_avg number := 0 ;
    t_dev number := 0 ;
    t_std number := 0 ;
    t_max number := 0 ;
    t_min number ;
    -- ����Ʈ�� ����
    x_x number :=0 ;
    --�迭��ȣ
    
    type rec_score is record (
        sid     ex_scores.sid%type,
        score   ex_scores.score%type );
    
    v_sc rec_score;
    
    ---������>���ڵ� ����
begin

    -- ���� ���
    for k in x_x..(x_x+10) loop
        v_scores(k) := trunc(dbms_random.value(1,101),0); 
    end loop;
           t_min := v_scores(x_x);
    for i in x_x..(x_x+10)loop
        v_sum := v_sum + v_scores(i);
    end loop;
    
    v_avg := v_sum/10;
    
    for j in x_x..(x_x+10) loop
        v_devsum := v_devsum + power((v_scores(j)-v_avg),2);
    end loop;
    
    for m in x_x..x_x+10 loop
        if v_max<v_scores(m) then
            v_max := v_scores(m);
        end if;
    end loop;
    
    for n in x_x..(x_x+10) loop
        if v_min>v_scores(n) then
            v_min := v_scores(n);
        end if;
    end loop;
    
    v_dev := v_devsum/(9);
    
--���� ��갪 ���
    dbms_output.put_line('����հ� : '||v_sum);
    dbms_output.put_line('������ : '||v_avg);
    dbms_output.put_line('���л� : '||v_dev);
    dbms_output.put_line('���ǥ������ : '||SQRT(v_dev));
    dbms_output.put_line('����ִ� : '||v_max);
    dbms_output.put_line('����ּ� : '||v_min);
    dbms_output.put_line(' ');
    
-- ���ڵ忡 �Է�
    for l in x_x..(x_x+10) loop
        v_sc.sid := l;
        v_sc.score := v_scores(l);
        insert into ex_scores
        values v_sc;
    end loop;
    
--select��
    select sum(score), avg(score), variance(score), stddev(score), max(score), min(score)
    into t_sum, t_avg, t_dev, t_std, t_max, t_min
    from ex_scores;
    
    dbms_output.put_line('�����հ� : '||t_sum);
    dbms_output.put_line('������� : '||t_avg);
    dbms_output.put_line('�����л� : '||t_dev);
    dbms_output.put_line('����ǥ������ : '||t_std);
    dbms_output.put_line('�����ִ� : '||t_max);
    dbms_output.put_line('�����ּ� : '||t_min);

end;
/
--create table ex_scores(
--    sid number primary key,
--    score number not null
--);
delete from ex_scores;




