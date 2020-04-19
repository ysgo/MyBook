package com.mc.mybook.repository.books;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mc.mybook.model.books.Log;

public interface LogsRepository extends JpaRepository<Log, Integer> {

}
