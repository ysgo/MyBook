CREATE TABLE mybooklist(
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(200) NOT NULL,
    title VARCHAR(255),
    author VARCHAR(200),
    publisher VARCHAR(255),
    description VARCHAR(255),
    image VARCHAR(255),
    m_title VARCHAR(255),
    m_star VARCHAR(30),
    m_content VARCHAR(255),
    registdate DATE,
    
    PRIMARY KEY (id)
);