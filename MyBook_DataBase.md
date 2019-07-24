# [ MyBook Projecet DataBase ]

## < Member Table >

```sql
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
    id NUMBER(38) primary key not null,
    email VARCHAR2(200) not null,
    title VARCHAR2(500),
    author VARCHAR2(200),
    publisher VARCHAR2(500),
    description VARCHAR2(4000),
    image VARCHAR2(1000),
    m_title VARCHAR2(500),
    m_star VARCHAR2(30),
    m_content VARCHAR2(4000),
    registdate date
);

CREATE TABLE interestBooklist(
    id NUMBER(38) primary key not null,
    email VARCHAR2(200) not null,
    title VARCHAR2(500),
    author VARCHAR2(200),
    publisher VARCHAR2(500),
    description VARCHAR2(4000), 
    image VARCHAR2(1000),
    registdate date
);

create sequence mybooklist_seq
start with 1
increment by 1;

create table log (
    id NUMBER(38) primary key not null,
    email VARCHAR2(200) not null,
    userName varchar2(30) not null,
    myBookTitle VARCHAR2(500),
    interestBookTitle VARCHAR2(500),
    m_star VARCHAR2(30),
    m_content VARCHAR2(4000),
    isupdate VARCHAR2(10),
    logregistdate date
);
-----------------------------------------------------

-- 페이지 범위 지정
select id, image, m_title, registdate, m_star, m_content from 
(select id, image, m_title, registdate, m_star, m_content, rownum rnum from
(select * from mybooklist where email = #{email} order by id asc))
where rnum between #{startPage} and #{endPage};

-----------------------------------------------------
ALTER TABLE interestBooklist RENAME COLUMN logregistdate TO registdate;
-----------------------------------------------------

--현재 시퀀스 값 조회
SELECT mybooklist_seq.CURRVAL FROM DUAL;

--*전체 시퀀스 조회
SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG 
FROM USER_SEQUENCES;

----------------------------------------------------
commit;
ROLLBACK;
----------------------------------------------------
```