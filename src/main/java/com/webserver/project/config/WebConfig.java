package com.webserver.project.config;

import java.io.File;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    
    @Value("${file.upload.path:uploads/}")
    private String uploadPath;
    
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 업로드된 파일들을 실제 업로드 경로로 매핑
        File uploadDir = new File(uploadPath);
        String uploadLocation = "file:" + uploadDir.getAbsolutePath() + "/";
        
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations(uploadLocation);
        
        // 기본 정적 리소스 핸들러 (assets 등)
        registry.addResourceHandler("/assets/**")
                .addResourceLocations("classpath:/static/assets/");
    }
} 