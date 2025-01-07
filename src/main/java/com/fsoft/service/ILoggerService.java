package com.fsoft.service;

import org.springframework.stereotype.Service;

@Service
public interface ILoggerService {

	void write(String text);

}
