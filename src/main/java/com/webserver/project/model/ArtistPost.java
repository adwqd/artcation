package com.webserver.project.model;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ArtistPost {
  private Integer postId;
  private Integer artistId;
  private String title;
  private String content;
  private String imageUrl;     // 이미지 파일 경로
  private String imageName;    // 원본 이미지 파일명
  private Integer viewCount;
  private LocalDateTime createdAt;
  private LocalDateTime updatedAt;
  
  // 조인된 데이터용 필드
  private String displayName; // 작성자 이름
} 