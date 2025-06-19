package com.webserver.project.model;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Comment {
  private Integer commentId;
  private String postType;     // 'community'
  private Integer postId;
  private Integer authorId;    // 회원
  private String guestName;    // 비회원
  private String guestPw;
  private String content;
  private Integer likeCount;
  private LocalDateTime createdAt;
  // getters/setters omitted
}

