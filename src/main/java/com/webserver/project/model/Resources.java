package com.webserver.project.model;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Resources {
  private Integer resourceId;
  private String title;
  private String content;
  private String filePath;
  private Integer createdBy;
  private LocalDateTime createdAt;
  private LocalDateTime updatedAt;
  
  // 조인된 데이터용 필드
  private String createdByName; // 작성자 이름
} 