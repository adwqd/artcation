package com.webserver.project.controller;

import com.webserver.project.model.Comment;
import com.webserver.project.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/community/{postId}/comments")
public class CommentController {
  private final CommentService svc;

  @GetMapping
  public String list(@PathVariable int postId, Model m) {
    m.addAttribute("comments", svc.listByPost(postId));
    return "community/comments";
  }

  @PostMapping
  public String add(@PathVariable int postId, Comment c) {
    c.setPostId(postId);
    svc.add(c);
    return "redirect:/community/view/" + postId;
  }
}
