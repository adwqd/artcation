package com.webserver.project.model;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommunityPost {
  private Integer postId;
  private Integer authorId;   // 로그인 회원 ID
  private String guestName;   // 비회원 이름
  private String guestPw;     // 비회원 비번
  private String title;
  private String content;
  private Integer viewCount;
  private LocalDateTime createdAt;
  private LocalDateTime updatedAt;
  // getters/setters omitted
}
