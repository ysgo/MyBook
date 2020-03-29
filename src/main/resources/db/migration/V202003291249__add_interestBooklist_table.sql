CREATE TABLE interestBooklist(
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(200) not null,
    title VARCHAR(255),
    author VARCHAR(200),
    publisher VARCHAR(255),
    description VARCHAR(255), 
    image VARCHAR(255),
    registdate date,
    
    PRIMARY KEY (id)
);