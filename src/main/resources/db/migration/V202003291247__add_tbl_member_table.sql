create table tbl_member (
    userId varchar(50) not null,
    userPass varchar(100) not null,
    userName varchar(30) not null,
    regidate date default CURRENT_TIMESTAMP,
    
    primary key(userId)
);