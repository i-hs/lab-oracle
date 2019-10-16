-- 테이블 생성
 create table ex1 (
    ex_id number, 
    ex_text varchar2(10),
    ex_date date
 );
 
 --테이블 구조(컬럼이름, 데이터타입,  Null여부) 확인
 desc ex1;
 
 -- 테이블에 데이터(레코드) 저장(삽입)
 insert into ex1(ex_id, ex_text, ex_date)
 values(1,'Hello',sysdate);

 
 select * from ex1;
 
 insert into ex1(ex_id, ex_text, ex_date)
 values(3,'LHSBTHDY',to_date('1991/04/06'));
 
 -- 변경된 데이터를 DBMS에 영구 저장
 commit;
 
 insert into ex1 (ex_id, ex_text)
 values (4, 'ITWILL');
 
 --테이블의 모든 컬럼을 인서트할 때
 -- insert into 구문에서 컬럼 이름을 생략할 수 있다.
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
values( 100,'안뇽히계세요');

select * from ex2;