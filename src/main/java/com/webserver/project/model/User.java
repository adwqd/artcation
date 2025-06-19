package com.webserver.project.model;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class User {
  private Integer userId;
  private String username;
  private String password;
  private String displayName;
  private String role;       // 'user','artist','admin'
  private LocalDateTime createdAt;
  // getters/setters omitted
}
