package com.webserver.project.controller;

import com.webserver.project.model.CommunityPost;
import com.webserver.project.service.CommunityService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {
  private final CommunityService svc;

  @GetMapping
  public String list(Model m) {
    m.addAttribute("posts", svc.list());
    return "community/list";
  }

  @GetMapping("/view/{id}")
  public String view(@PathVariable int id, Model m) {
    m.addAttribute("post", svc.get(id));
    return "community/view";
  }

  @GetMapping("/add")
  public String addForm() { return "community/form"; }

  @PostMapping("/add")
  public String add(CommunityPost p) {
    svc.add(p);
    return "redirect:/community";
  }

  @GetMapping("/edit/{id}")
  public String editForm(@PathVariable int id, Model m) {
    m.addAttribute("post", svc.get(id));
    return "community/form";
  }

  @PostMapping("/edit")
  public String edit(CommunityPost p) {
    svc.update(p);
    return "redirect:/community/view/" + p.getPostId();
  }

  @GetMapping("/delete/{id}")
  public String delete(@PathVariable int id) {
    svc.delete(id);
    return "redirect:/community";
  }
}
