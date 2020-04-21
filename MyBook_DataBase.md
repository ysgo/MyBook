# [ MyBook Projecet DataBase ]

## < Users Table >

```mtsql
CREATE TABLE users (
	id INTEGER NOT NULL AUTO_INCREMENT,
    login_id VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    name VARCHAR(255),
    created_at DATE,
    updated_at DATE,
    
    PRIMARY KEY (id)
);
```

---

## < Books Table >

```mysql
CREATE TABLE books (
	id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    author VARCHAR(255),
    publisher VARCHAR(255),
    content VARCHAR(255),
    image VARCHAR(255),
    interested INTEGER,
    user_id INTEGER,
    created_at DATE,
    updated_at DATE,
    
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);
```

---

## < Reviews Table >

```mysql
CREATE TABLE reviews (
	id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    star VARCHAR(30),
    content VARCHAR(255),
    book_id INTEGER,
    created_at DATE,
    updated_at DATE,
    
    PRIMARY KEY (id),
    FOREIGN KEY (book_id) REFERENCES books (id)
);
```

---

## < Logs Table >

```mysql
CREATE TABLE logs (
	id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    title VARCHAR(255),
    interested INTEGER,
    review_id INTEGER,
    created_at DATE,
    updated_at DATE,
    
    PRIMARY KEY (id),
    FOREIGN KEY (review_id) REFERENCES reviews (id)
);
```

