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
  private Integer viewCount;
  private LocalDateTime createdAt;
  private LocalDateTime updatedAt;
  
  // 조인된 데이터용 필드
  private String displayName; // 작성자 이름
} 