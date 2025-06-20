package com.webserver.project.controller;

import com.webserver.project.dto.LoginRequest;
import com.webserver.project.model.User;
import com.webserver.project.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class AuthController {
  private final AuthService authService;

  @GetMapping("/login")
  public String loginForm(Model model, HttpSession session) {
    // 이미 로그인된 경우 홈으로 리다이렉트
    if (session.getAttribute("loginUser") != null) {
      return "redirect:/";
    }
    return "login";
  }

  @PostMapping("/login")
  public String login(LoginRequest dto, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
    try {
      User user = authService.login(dto.getUsername(), dto.getPassword());
      if (user == null) {
        model.addAttribute("error", "사용자명 또는 비밀번호가 올바르지 않습니다.");
        return "login";
      }
      
      // 세션에 사용자 정보 저장
      session.setAttribute("loginUser", user);
      session.setAttribute("userId", user.getUserId());
      session.setAttribute("username", user.getUsername());
      session.setAttribute("displayName", user.getDisplayName());
      session.setAttribute("role", user.getRole());
      
      redirectAttributes.addFlashAttribute("message", user.getDisplayName() + "님, 환영합니다!");
      
      // 로그인 후 이동할 페이지 확인 (세션에 저장된 이전 페이지가 있으면 그곳으로)
      String redirectUrl = (String) session.getAttribute("redirectAfterLogin");
      if (redirectUrl != null) {
        session.removeAttribute("redirectAfterLogin");
        return "redirect:" + redirectUrl;
      }
      
      return "redirect:/blog";
    } catch (Exception e) {
      model.addAttribute("error", "로그인 처리 중 오류가 발생했습니다: " + e.getMessage());
      return "login";
    }
  }

  @GetMapping("/logout")
  public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
    String displayName = (String) session.getAttribute("displayName");
    session.invalidate(); // 세션 무효화
    
    if (displayName != null) {
      redirectAttributes.addFlashAttribute("message", displayName + "님, 안전하게 로그아웃되었습니다.");
    }
    return "redirect:/";
  }

  // 로그인 체크 유틸리티 메서드
  public static boolean isLoggedIn(HttpSession session) {
    return session.getAttribute("loginUser") != null;
  }

  public static User getLoginUser(HttpSession session) {
    return (User) session.getAttribute("loginUser");
  }

  public static boolean isArtistOrAdmin(HttpSession session) {
    String role = (String) session.getAttribute("role");
    return "artist".equals(role) || "admin".equals(role);
  }
}
