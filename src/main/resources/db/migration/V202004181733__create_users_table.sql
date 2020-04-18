CREATE TABLE users (
	id INTEGER NOT NULL AUTO_INCREMENT,
  login_id VARCHAR(255) UNIQUE,
  password VARCHAR(255),
  name VARCHAR(255),
  created_at DATE,
  updated_at DATE,
    
  PRIMARY KEY (id)
);