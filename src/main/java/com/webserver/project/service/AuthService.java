package com.webserver.project.service;

import com.webserver.project.mapper.UserMapper;
import com.webserver.project.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthService {
  private final UserMapper userMapper;

  public User login(String username, String password) {
    User u = userMapper.findByUsername(username);
    if (u != null && u.getPassword().equals(password)) {
      return u;
    }
    return null;
  }
}
