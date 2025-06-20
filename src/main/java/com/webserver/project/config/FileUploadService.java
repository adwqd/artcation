package com.webserver.project.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

@Service
public class FileUploadService {
    
    // application.properties에서 설정할 수 있도록 (기본값 설정)
    @Value("${file.upload.path:src/main/resources/static/uploads/}")
    private String uploadPath;
    
    @Value("${file.upload.url-prefix:/uploads/}")
    private String urlPrefix;
    
    /**
     * 이미지 파일 업로드
     * @param file 업로드할 파일
     * @return 업로드된 파일의 URL 경로
     * @throws IOException 파일 업로드 실패 시
     */
    public String uploadImage(MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            return null;
        }
        
        // 파일 유효성 검사
        validateImageFile(file);
        
        // 업로드 디렉토리 생성
        createUploadDirectory();
        
        // 고유한 파일명 생성
        String fileName = generateUniqueFileName(file.getOriginalFilename());
        
        // 파일 저장
        Path filePath = Paths.get(uploadPath + fileName);
        Files.copy(file.getInputStream(), filePath);
        
        // URL 경로 반환
        return urlPrefix + fileName;
    }
    
    /**
     * 이미지 파일 유효성 검사
     */
    private void validateImageFile(MultipartFile file) {
        // 파일 크기 검사 (10MB 제한)
        if (file.getSize() > 10 * 1024 * 1024) {
            throw new IllegalArgumentException("파일 크기는 10MB를 초과할 수 없습니다.");
        }
        
        // 파일 타입 검사
        String contentType = file.getContentType();
        if (contentType == null || !contentType.startsWith("image/")) {
            throw new IllegalArgumentException("이미지 파일만 업로드 가능합니다.");
        }
        
        // 허용된 확장자 검사
        String originalFilename = file.getOriginalFilename();
        if (originalFilename == null) {
            throw new IllegalArgumentException("파일명이 올바르지 않습니다.");
        }
        
        String extension = getFileExtension(originalFilename).toLowerCase();
        if (!isAllowedExtension(extension)) {
            throw new IllegalArgumentException("허용되지 않는 파일 형식입니다. (jpg, jpeg, png, gif, webp만 가능)");
        }
    }
    
    /**
     * 업로드 디렉토리 생성
     */
    private void createUploadDirectory() {
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    }
    
    /**
     * 고유한 파일명 생성
     */
    private String generateUniqueFileName(String originalFilename) {
        String extension = getFileExtension(originalFilename);
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
        String uuid = UUID.randomUUID().toString().substring(0, 8);
        return timestamp + "_" + uuid + "." + extension;
    }
    
    /**
     * 파일 확장자 추출
     */
    private String getFileExtension(String filename) {
        int lastDotIndex = filename.lastIndexOf('.');
        if (lastDotIndex == -1) {
            return "";
        }
        return filename.substring(lastDotIndex + 1);
    }
    
    /**
     * 허용된 확장자 검사
     */
    private boolean isAllowedExtension(String extension) {
        return extension.equals("jpg") || extension.equals("jpeg") || 
               extension.equals("png") || extension.equals("gif") || 
               extension.equals("webp");
    }
    
    /**
     * 파일 삭제
     */
    public boolean deleteFile(String fileUrl) {
        if (fileUrl == null || !fileUrl.startsWith(urlPrefix)) {
            return false;
        }
        
        try {
            String fileName = fileUrl.substring(urlPrefix.length());
            Path filePath = Paths.get(uploadPath + fileName);
            return Files.deleteIfExists(filePath);
        } catch (IOException e) {
            return false;
        }
    }
} 