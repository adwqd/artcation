package com.webserver.project.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.webserver.project.mapper")
public class MyBatisConfig {
  // mapper XML 경로 등은 application.properties로 설정되어 있습니다.
}

