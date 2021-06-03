package dev.mvc.study_maria;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"dev.mvc"})
public class StudyMariaApplication {

	public static void main(String[] args) {
		SpringApplication.run(StudyMariaApplication.class, args);
	}

}
