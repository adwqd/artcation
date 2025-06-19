package com.webserver.project.controller;

import com.webserver.project.dto.LoginRequest;
import com.webserver.project.model.User;
import com.webserver.project.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class AuthController {
  private final AuthService authService;

  @GetMapping("/login")
  public String loginForm() { return "login"; }

  @PostMapping("/login")
  public String login(LoginRequest dto, Model m) {
    User u = authService.login(dto.getUsername(), dto.getPassword());
    if (u==null) {
      m.addAttribute("error","로그인 실패");
      return "login";
    }
    // 세션에 저장 등…
    return "redirect:/";
  }
}
