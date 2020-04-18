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