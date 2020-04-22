package com.mc.mybook.service.books;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.mybook.model.books.Log;
import com.mc.mybook.repository.books.LogsRepository;

@Service
public class LogsService {
	@Autowired
	private LogsRepository logsRepository;
	
	public Log addLog(Log log) {
		log = logsRepository.save(log);
		return log;
	}
	
	public List<Log> listAll() {
		return logsRepository.findAll();
	}
}
