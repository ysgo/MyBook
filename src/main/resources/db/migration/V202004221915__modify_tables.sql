ALTER TABLE books ADD review_id INTEGER AFTER user_id;
ALTER TABLE books ADD FOREIGN KEY (review_id) REFERENCES reviews (id) ON DELETE CASCADE;
ALTER TABLE reviews DROP FOREIGN KEY reviews_ibfk_1;
ALTER TABLE reviews DROP COLUMN book_id;