package com.salesianostriana.dam.challengerapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.TestConfiguration;

@TestConfiguration(proxyBeanMethods = false)
public class TestChallengerApiApplication {

	public static void main(String[] args) {
		SpringApplication.from(ChallengerApiApplication::main).with(TestChallengerApiApplication.class).run(args);
	}

}
