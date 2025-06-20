package com.webserver.project.model;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Likes {
  private Integer likeId;
  private Integer userId;
  private String targetType; // 'artist_post', 'community_post', 'comment'
  private Integer targetId;
  private LocalDateTime createdAt;
} 