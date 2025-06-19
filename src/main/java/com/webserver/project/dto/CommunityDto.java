package com.webserver.project.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommunityDto {
  private Integer postId;
  private String title;
  private String content;
  // + authorId or guestName/guestPw
}
