package com.webserver.project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
// 정확한 패키지명 확인하세요:

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(
		  exclude = org.springframework.boot.autoconfigure.sql.init.SqlInitializationAutoConfiguration.class
		)
@MapperScan("com.webserver.project.mapper")
public class ArtcationGoseongApplication extends SpringBootServletInitializer {
    public static void main(String[] args) {
        SpringApplication.run(ArtcationGoseongApplication.class, args);
    }
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(ArtcationGoseongApplication.class);
    }
}
