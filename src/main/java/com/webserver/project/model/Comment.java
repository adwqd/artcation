package com.webserver.project.model;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Comment {
  private Integer commentId;
  private String postType;     // 'community', 'artist'
  private Integer postId;
  private Integer authorId;    // 회원
  private String guestName;    // 비회원
  private String guestPw;
  private String content;
  private Integer likeCount;
  private LocalDateTime createdAt;
  
  // 조회용 필드 (JOIN 결과)
  private String authorName;   // 로그인 사용자의 display_name 또는 guestName
  private String authorRole;   // 로그인 사용자의 role (admin, user)
  // getters/setters omitted
}

