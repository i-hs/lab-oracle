-- ���̺� ����
 create table ex1 (
    ex_id number, 
    ex_text varchar2(10),
    ex_date date
 );
 
 --���̺� ����(�÷��̸�, ������Ÿ��,  Null����) Ȯ��
 desc ex1;
 
 -- ���̺� ������(���ڵ�) ����(����)
 insert into ex1(ex_id, ex_text, ex_date)
 values(1,'Hello',sysdate);

 
 select * from ex1;
 
 insert into ex1(ex_id, ex_text, ex_date)
 values(3,'LHSBTHDY',to_date('1991/04/06'));
 
 -- ����� �����͸� DBMS�� ���� ����
 commit;
 
 insert into ex1 (ex_id, ex_text)
 values (4, 'ITWILL');
 
 --���̺��� ��� �÷��� �μ�Ʈ�� ��
 -- insert into �������� �÷� �̸��� ������ �� �ִ�.
 alter table ex1
 modify(
    ex_text varchar2(50)
 );
 desc ex1;
 
  insert into ex1 (ex_id, ex_text, ex_date)
 values (4, 'Nuclear No Jam', sysdate);
 
 create table ex2 (
    ex_id number(2),
    ex_text varchar(50 char)
 );
 desc ex2;
alter table ex2
modify ( ex_text varchar (5 char));

insert into  ex2
values( 100,'�ȴ����輼��');

select * from ex2;