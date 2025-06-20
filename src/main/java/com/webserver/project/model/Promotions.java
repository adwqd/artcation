package com.webserver.project.model;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Promotions {
  private Integer promoId;
  private String title;
  private String content;
  private String linkUrl;
  private Boolean active;
  private LocalDateTime createdAt;
} 