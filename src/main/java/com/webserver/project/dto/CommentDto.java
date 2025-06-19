package com.webserver.project.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentDto {
  private Integer postId;
  private String content;
  // + authorId or guestName/guestPw
}
