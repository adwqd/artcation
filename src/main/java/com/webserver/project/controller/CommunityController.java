package com.webserver.project.controller;

import com.webserver.project.model.CommunityPost;
import com.webserver.project.service.CommunityService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {
  private final CommunityService svc;

  @GetMapping
  public String list(Model m) {
    m.addAttribute("posts", svc.list());
    return "community";
  }

  @GetMapping("/view/{id}")
  public String view(@PathVariable int id, Model m) {
    m.addAttribute("post", svc.get(id));
    return "community-detail";
  }

  @GetMapping("/write")
  public String writeForm() {
    return "community-write";
  }

  @PostMapping("/write")
  public String write(@RequestParam String authorName, 
                     @RequestParam String authorPassword,
                     @RequestParam String title,
                     @RequestParam String content,
                     RedirectAttributes redirectAttributes) {
    
    try {
      CommunityPost post = new CommunityPost();
      post.setTitle(title);
      post.setContent(content);
      post.setGuestName(authorName);
      post.setGuestPw(authorPassword);
      
      svc.add(post);
      redirectAttributes.addFlashAttribute("message", "글이 성공적으로 등록되었습니다.");
      return "redirect:/community";
    } catch (Exception e) {
      redirectAttributes.addFlashAttribute("error", "글 등록에 실패했습니다: " + e.getMessage());
      return "redirect:/community/write";
    }
  }

  @PostMapping("/edit/{id}")
  public String editPasswordCheck(@PathVariable int id, 
                                 @RequestParam String password,
                                 RedirectAttributes redirectAttributes) {
    if (svc.validateGuestPassword(id, password)) {
      return "redirect:/community/edit-form/" + id;
    } else {
      redirectAttributes.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
      return "redirect:/community/view/" + id;
    }
  }

  @GetMapping("/edit-form/{id}")
  public String editForm(@PathVariable int id, Model m) {
    m.addAttribute("post", svc.getWithoutViewIncrement(id));
    return "community-edit";
  }

  @PostMapping("/update/{id}")
  public String update(@PathVariable int id,
                      @RequestParam String title,
                      @RequestParam String content,
                      RedirectAttributes redirectAttributes) {
    try {
      CommunityPost post = new CommunityPost();
      post.setPostId(id);
      post.setTitle(title);
      post.setContent(content);
      
      svc.update(post);
      redirectAttributes.addFlashAttribute("message", "글이 성공적으로 수정되었습니다.");
      return "redirect:/community/view/" + id;
    } catch (Exception e) {
      redirectAttributes.addFlashAttribute("error", "글 수정에 실패했습니다: " + e.getMessage());
      return "redirect:/community/edit-form/" + id;
    }
  }

  @PostMapping("/delete/{id}")
  public String delete(@PathVariable int id, 
                      @RequestParam String password,
                      RedirectAttributes redirectAttributes) {
    if (svc.validateGuestPassword(id, password)) {
      try {
        svc.delete(id);
        redirectAttributes.addFlashAttribute("message", "글이 성공적으로 삭제되었습니다.");
        return "redirect:/community";
      } catch (Exception e) {
        redirectAttributes.addFlashAttribute("error", "글 삭제에 실패했습니다: " + e.getMessage());
        return "redirect:/community/view/" + id;
      }
    } else {
      redirectAttributes.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
      return "redirect:/community/view/" + id;
    }
  }
}
