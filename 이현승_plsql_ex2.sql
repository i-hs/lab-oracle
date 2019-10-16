/*
2. 
������ ���� ������ �Ǻ���ġ ����(Fibonacci numbers)��� �մϴ�.
1, 1, 2, 3, 5, 8, 13, 21, 34, ...
�Ǻ���ġ ������ ������ ���� ������ �Ϲ�ȭ�� �� �ֽ��ϴ�.
f[1] = 1, f[2] = 1, 
f[n] = f[n-1] + f[n-2], n >= 3
�Ǻ���ġ ������ ���� 20���� ����ϴ� PL/SQL�� �ۼ��ϼ���.
�̿��ϴ� �Ǻ���ġ ���� ������ Ȳ�ݺ�(golden ratio)�� �Ҹ��� �� 1.61803...�� �������� ���̼���.
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

