/*
1. 
dbms_random.value() �Լ� �̿��ؼ�, �ֻ��� 2���� ������ �� ������ ���� (x, y) �������� ����ϴ� PL/SQL�� �ۼ��ϼ���. �ֻ��� 2���� ���� �������� �� ����� ���߼���.
(��� ����)
1��: (1, 4)
2��: (5, 2)
3��: (6, 6)
�ݺ���, ���ǹ�
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
        dbms_output.put_line(k||'�� : (' || arr(i) || ', ' || arr(j) || ')');
        k := k+1;        
        exit when arr(i)=arr(j);
    end loop;
   
end;
/
