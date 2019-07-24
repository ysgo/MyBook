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

select * from mybooklist;

-- 페이지 범위 지정
select id, image, m_title, registdate, m_star, m_content from 
(select * from
(select * from mybooklist where email = 'qwe@gmail.com' order by id asc))
where rownum between 6 and 10;

select id, image, m_title, registdate, m_star, m_content from 
(select id, image, m_title, registdate, m_star, m_content, rownum rnum from
(select * from mybooklist where email = #{email} order by id asc))
where rnum between #{startPage} and #{endPage};

select id, title, content, author, regisDate
    from (
        select id, title, content, author, regisDate,
            row_number() over(order by id desc) as rNum
        from mybooklist
        ) mb
    where rNum between 1 and 10
        order by bno desc;

-----------------------------------------------------
ALTER TABLE interestBooklist RENAME COLUMN logregistdate TO registdate;

-----------------------------------------------------
--drop table
drop table mybooklist;

drop table interestBooklist;

drop table tbl_member;

drop table log;

--drop sequence
drop sequence mybooklist_seq;

--현재 시퀀스 값 조회
SELECT mybooklist_seq.CURRVAL FROM DUAL;

--*전체 시퀀스 조회
SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG 
FROM USER_SEQUENCES;

select * from user_sequences;

insert into log(id, email, userName, logregistdate) values(1,'e','e',to_date('1999-04-03 12:33:33','yyyy-MM-dd HH24:MI:SS'));
----------------------------------------------------
commit;
ROLLBACK;
----------------------------------------------------

select * from mybooklist;

select * from interestBooklist;
select count(*) as total from interestBooklist where email='ss@gmail.com';

select * from tbl_member;

select * from log;

select id, userName,myBookTitle,m_star,m_content, isupdate, 
to_char(logregistdate,'YYYY-MM-DD HH24:Mi:SS') from log;

select id, title, m_content, to_char(registdate,'YYYY-MM-DD hh:mi:ss') from mybooklist;

select max(to_char(registdate,'yyyy-MM-dd hh:mi:ss')) KEEP(DENSE_RANK First ORDER BY registdate DESC) from mybooklist;

update interestBooklist
set logregistdate = sysdate
where logregistdate is null;

select userName, myBookTitle, interestBookTitle, m_star, m_content, logregistdate
from log order by logregistdate desc;

insert into log(to_Date(logregistdate,'yyyy-MM-dd HH:mm:ss')) 
    	values('Mon Jul 22 10:33:55 KST 2019');

insert into tbl_member(userId, userPass, userName)
values('qwe@gmail.com', '1234', 'qwe');

insert into mybooklist(id,email,registdate) values(5,'qwe@gmail.com',sysdate);

select max(id) from mybooklist;

insert into log (id,userName, myBookTitle,logregistdate) values(2,'tt', '제목',TO_DATE('2019-07-21 18:35:20','yyyy-MM-dd'));
--select title, count(*) from mybooklist,(select title, count(*) from mybooklist group by title order by count(*) desc) where rownum<=5;

```

