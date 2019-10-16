/*
1. 
dbms_random.value() 함수 이용해서, 주사위 2개를 던졌을 때 나오는 눈을 (x, y) 형식으로 출력하는 PL/SQL을 작성하세요. 주사위 2개의 눈이 같아졌을 때 출력을 멈추세요.
(결과 예시)
1차: (1, 4)
2차: (5, 2)
3차: (6, 6)
반복문, 조건문
*/

declare
    type NumberArray is table of number
    index by PLS_INTEGER;
    arr NumberArray;
    i number :=-1;
    j number :=0;
    k number := 1;
    
begin
    loop
        i := i+2;
        j := j+2;
        arr(i) := trunc(dbms_random.value (0,7));
        arr(j) := trunc(dbms_random.value (0,7));
        dbms_output.put_line(k||'차 : (' || arr(i) || ', ' || arr(j) || ')');
        k := k+1;        
        exit when arr(i)=arr(j);
    end loop;
   
end;
/
