create table log (
    id INT not null,
    email VARCHAR(200) not null,
    userName VARCHAR(30) not null,
    myBookTitle VARCHAR(255),
    interestBookTitle VARCHAR(255),
    m_star VARCHAR(30),
    m_content VARCHAR(255),
    isupdate VARCHAR(10),
    logregistdate TIMESTAMP,
    
    PRIMARY KEY (id)
);