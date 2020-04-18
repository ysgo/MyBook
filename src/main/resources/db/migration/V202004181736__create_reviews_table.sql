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