set serveroutput on;

declare
    -- 문자열을 원소로 갖고, 양의 정수를 인덱스로 사용하는 연관 배열을 정의.
    type students is table of varchar2(20) 
    index by PLS_INTEGER;
    
    -- 정의한 연관 배열 타입의 변수 선언
    v_stu students;

begin
    -- 연관 배열에 데이터 저장 : 배열이름(인덱스) := 값;
    v_stu(1)    := '강다혜';
    v_stu(2)    := '김수인';
    v_stu(3)    := '김영광';
    
    -- 연관 배열에 저장된 원소(데이터)값을 읽을 때 : 배열이름(인덱스)
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
    -- 인덱스 : 양의 정수 , 원소 ( 데이터 타입 ) : 숫자 
    -- 연관된 타입의 변수를 선언;
    type arr_numbers is table of number(3)
    index by pls_integer;
    v_scores arr_numbers;
    v_sum number := 0;
    v_avg number := 0;
    v_devsum number := 0;
    v_dev   number  := 0;
    
begin
    -- 연관 배열 v_score에 5개의 정수를 입력하세요
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
    
        
    dbms_output.put_line('합계 : '||v_sum);
    dbms_output.put_line('평균 : '||v_avg);
    dbms_output.put_line('분산 : '||v_dev);
    dbms_output.put_line('표준편차 : '||SQRT(v_dev));
end;
/

--emp 테이블에서 급여의 총합, 평균, 분산, 표준편차를 출력하는 PL/SQL?
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

-- 인덱스는 양의 정수, 배열의 원소(데이터)는 숫자 타입인 연관 배열을 정의
-- 난수 (dbms_random.value(x,y))함수와 trunc를 이용해서, 
-- for loop를 사용해서 연관 배열에 10개의 시험 성적(0 ~ 100)을 저장
-- 10개 시험 성적의 총합, 평균, 분산, 표준편차를 계산하는 식을 구현
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
    ------ㄴㄴㄴ직접계산 변수
    t_sum number := 0 ;
    t_avg number := 0 ;
    t_dev number := 0 ;
    t_std number := 0 ;
    t_max number := 0 ;
    t_min number ;
    -- 셀랙트문 변수
    x_x number :=0 ;
    --배열번호
    
    type rec_score is record (
        sid     ex_scores.sid%type,
        score   ex_scores.score%type );
    
    v_sc rec_score;
    
    ---ㄴㄴㄴ>레코드 변수
begin

    -- 직접 계산
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
    
--직접 계산값 출력
    dbms_output.put_line('계산합계 : '||v_sum);
    dbms_output.put_line('계산평균 : '||v_avg);
    dbms_output.put_line('계산분산 : '||v_dev);
    dbms_output.put_line('계산표준편차 : '||SQRT(v_dev));
    dbms_output.put_line('계산최대 : '||v_max);
    dbms_output.put_line('계산최소 : '||v_min);
    dbms_output.put_line(' ');
    
-- 레코드에 입력
    for l in x_x..(x_x+10) loop
        v_sc.sid := l;
        v_sc.score := v_scores(l);
        insert into ex_scores
        values v_sc;
    end loop;
    
--select문
    select sum(score), avg(score), variance(score), stddev(score), max(score), min(score)
    into t_sum, t_avg, t_dev, t_std, t_max, t_min
    from ex_scores;
    
    dbms_output.put_line('쿼리합계 : '||t_sum);
    dbms_output.put_line('쿼리평균 : '||t_avg);
    dbms_output.put_line('쿼리분산 : '||t_dev);
    dbms_output.put_line('쿼리표준편차 : '||t_std);
    dbms_output.put_line('쿼리최대 : '||t_max);
    dbms_output.put_line('쿼리최소 : '||t_min);

end;
/
--create table ex_scores(
--    sid number primary key,
--    score number not null
--);
delete from ex_scores;




