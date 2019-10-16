/*
2. 
다음과 같은 수열을 피보나치 수열(Fibonacci numbers)라고 합니다.
1, 1, 2, 3, 5, 8, 13, 21, 34, ...
피보나치 수열은 다음과 같은 식으로 일반화할 수 있습니다.
f[1] = 1, f[2] = 1, 
f[n] = f[n-1] + f[n-2], n >= 3
피보나치 수열의 원소 20개를 출력하는 PL/SQL을 작성하세요.
이웃하는 피보나치 수의 비율은 황금비(golden ratio)라 불리는 수 1.61803...에 수렴함을 보이세요.
f[n+1] / f[n] ~ 1.61803...
*/
set serveroutput on;
declare
    type NumberArray is table of number
    index by PLS_INTEGER;
    arr NumberArray;

begin
    arr(1) :=1;
    arr(2) :=1;

    for i in 3..20 loop
        arr(i):=arr(i-1)+arr(i-2);
    end loop;
    for j in 1..20 loop
        dbms_output.put(arr(j)||' ');
    end loop;
        dbms_output.new_line;
end;
/
select employee_id, first_name, salary, department_id
from employees
where salary in (
    select min(salary) from employees
    group by department_id
);

