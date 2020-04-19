package com.mc.mybook.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mc.mybook.model.Log;

public interface LogsRepository extends JpaRepository<Log, Integer> {

}
