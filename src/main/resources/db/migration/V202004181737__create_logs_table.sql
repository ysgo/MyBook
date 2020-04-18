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