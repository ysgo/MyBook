# [ MyBook Projecet DataBase ]

## < Member Table >

```sql
/* 추가 개인정보 필요할시 사용할 테이블
create table tbl_member (
userId varchar2(50) not null,
userPass varchar2(100) not null,
userName varchar2(30) not null,
userPhon varchar2(20) null,
userAddr1 varchar2(20) null,
userAddr2 varchar2(50) null,
userAddr3 varchar2(50) null,
regidate date default sysdate,
verify number default 0,
primary key(userId)
);
*/
-----------------------------------------------------
create table tbl_member (
userId varchar2(50) not null,
userPass varchar2(100) not null,
userName varchar2(30) not null,
regidate date default sysdate,
primary key(userId)
);
-----------------------------------------------------
select * from tbl_member;

insert into tbl_member(userId, userPass, userName)
values('아이디', '비밀번호', '닉네임');

select * from tab;

select * from tbl_member;

delete tbl_member where username = 'adf';

drop table tbl_member;
-----------------------------------------------------
commit;
```

---

## < MyBookList Table >

```sql
CREATE TABLE mybooklist(
    id NUMBER(10) PRIMARY KEY not null,
    email VARCHAR2(100) not null,
    title VARCHAR2(100),
    author VARCHAR2(40),
    publisher VARCHAR2(50),
    image VARCHAR2(400),
    m_title VARCHAR2(400),
    m_star VARCHAR2(30),
    m_content VARCHAR2(500),
    registdate date
);

CREATE TABLE interestBooklist(
    id NUMBER(10) PRIMARY KEY not null,
    email VARCHAR2(200) not null,
    title VARCHAR2(200),
    author VARCHAR2(100),
    publisher VARCHAR2(100),
    image VARCHAR2(400)
);

create sequence mybooklist_seq
start with 1
increment by 1;
-----------------------------------------------------

select * from mybooklist;

select * from interestBooklist;

--drop table
drop table mybooklist;

drop table interestBooklist;

-----------------------------------------------------
--drop sequence
drop sequence mybooklist_seq;

--현재 시퀀스 값 조회
SELECT mybooklist_seq.CURRVAL FROM DUAL;

--*전체 시퀀스 조회
SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG 
FROM USER_SEQUENCES;

----------------------------------------------------
commit;

select * from user_sequences;
```

