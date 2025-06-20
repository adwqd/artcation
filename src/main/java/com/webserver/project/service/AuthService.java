package com.webserver.project.service;

import com.webserver.project.mapper.UserMapper;
import com.webserver.project.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Service
@RequiredArgsConstructor
public class AuthService {
  private final UserMapper userMapper;
  private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

  // 로그인 (평문 비밀번호 - 개발용)
  public User login(String username, String password) {
    User u = userMapper.findByUsername(username);
    if (u != null && u.getPassword().equals(password)) {
      return u;
    }
    return null;
  }

  // 로그인 (암호화된 비밀번호 - 실제 운영용)
  public User loginWithEncryption(String username, String password) {
    User u = userMapper.findByUsername(username);
    if (u != null && passwordEncoder.matches(password, u.getPassword())) {
      return u;
    }
    return null;
  }

  // 회원가입
  public void register(User user) {
    // 사용자명 중복 검사
    if (userMapper.findByUsername(user.getUsername()) != null) {
      throw new IllegalArgumentException("이미 존재하는 사용자명입니다.");
    }

    // 필수 필드 검증
    if (user.getUsername() == null || user.getUsername().trim().isEmpty()) {
      throw new IllegalArgumentException("사용자명은 필수입니다.");
    }
    if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
      throw new IllegalArgumentException("비밀번호는 필수입니다.");
    }
    if (user.getDisplayName() == null || user.getDisplayName().trim().isEmpty()) {
      throw new IllegalArgumentException("표시 이름은 필수입니다.");
    }

    // 역할 기본값 설정
    if (user.getRole() == null || user.getRole().trim().isEmpty()) {
      user.setRole("user");
    }

    // 비밀번호 암호화 (실제 운영시 사용)
    // user.setPassword(passwordEncoder.encode(user.getPassword()));

    userMapper.insert(user);
  }

  // 비밀번호 변경
  public void changePassword(Integer userId, String currentPassword, String newPassword) {
    User user = userMapper.findById(userId);
    if (user == null) {
      throw new IllegalArgumentException("사용자를 찾을 수 없습니다.");
    }

    // 현재 비밀번호 확인
    if (!user.getPassword().equals(currentPassword)) {
      throw new IllegalArgumentException("현재 비밀번호가 일치하지 않습니다.");
    }

    // 새 비밀번호 설정
    user.setPassword(newPassword);
    // user.setPassword(passwordEncoder.encode(newPassword)); // 암호화 버전
    userMapper.update(user);
  }

  // 사용자 정보 업데이트
  public void updateProfile(User user) {
    if (user.getUserId() == null) {
      throw new IllegalArgumentException("사용자 ID가 필요합니다.");
    }
    userMapper.update(user);
  }

  // 사용자명 중복 검사
  public boolean isUsernameAvailable(String username) {
    return userMapper.findByUsername(username) == null;
  }

  // 사용자 조회
  public User findById(Integer userId) {
    return userMapper.findById(userId);
  }

  // 사용자명으로 조회
  public User findByUsername(String username) {
    return userMapper.findByUsername(username);
  }
}
