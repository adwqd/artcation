package com.webserver.project.controller;

import com.webserver.project.model.Comment;
import com.webserver.project.model.CommunityPost;
import com.webserver.project.service.CommentService;
import com.webserver.project.service.CommunityService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
@Slf4j
public class CommunityController {
  private final CommunityService svc;
  private final CommentService commentService;

  @GetMapping
  public String list(@RequestParam(defaultValue = "latest") String sort, 
                    @RequestParam(defaultValue = "1") int page,
                    @RequestParam(required = false) String search,
                    Model m) {
    
    // 페이지네이션 설정
    int pageSize = 10; // 한 페이지당 10개
    int offset = (page - 1) * pageSize;
    
    List<CommunityPost> posts;
    int totalPosts;
    
    // 검색어가 있는 경우
    if (search != null && !search.trim().isEmpty()) {
      posts = svc.searchWithSortAndPagination(search.trim(), sort, pageSize, offset);
      totalPosts = svc.getSearchCount(search.trim());
    } else {
      posts = svc.listWithSortAndPagination(sort, pageSize, offset);
      totalPosts = svc.getTotalCount();
    }
    
    int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
    
    m.addAttribute("posts", posts);
    m.addAttribute("currentSort", sort);
    m.addAttribute("currentPage", page);
    m.addAttribute("totalPages", totalPages);
    m.addAttribute("totalPosts", totalPosts);
    m.addAttribute("searchKeyword", search);
    
    return "community";
  }

  @GetMapping("/view/{id}")
  public String view(@PathVariable int id, Model m) {
    // 게시글 조회
    CommunityPost post = svc.get(id);
    m.addAttribute("post", post);
    
    // 댓글 조회
    List<Comment> comments = commentService.getCommentsByPost(id, "community");
    m.addAttribute("comments", comments);
    m.addAttribute("commentCount", comments.size());
    
    log.info("커뮤니티 게시글 {} 조회 - 댓글 {}개", id, comments.size());
    
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
                      @RequestParam(required = false) String password,
                      HttpSession session,
                      RedirectAttributes redirectAttributes) {
    try {
      CommunityPost existingPost = svc.getWithoutViewIncrement(id);
      if (existingPost == null) {
        redirectAttributes.addFlashAttribute("error", "게시글을 찾을 수 없습니다.");
        return "redirect:/community";
      }
      
      // 권한 확인
      Integer userId = (Integer) session.getAttribute("userId");
      String role = (String) session.getAttribute("role");
      
      boolean canUpdate = false;
      if ("admin".equals(role)) {
        canUpdate = true;
      } else if (existingPost.getAuthorId() != null && userId != null && existingPost.getAuthorId().equals(userId)) {
        // 로그인 사용자가 작성한 글: 작성자 본인만
        canUpdate = true;
      } else if (existingPost.getAuthorId() == null) {
        // 비로그인 사용자가 작성한 글: 비밀번호 확인
        if (password == null || !svc.validateGuestPassword(id, password)) {
          redirectAttributes.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
          return "redirect:/community/edit-form/" + id;
        }
        canUpdate = true;
      }
      
      if (!canUpdate) {
        redirectAttributes.addFlashAttribute("error", "수정 권한이 없습니다.");
        return "redirect:/community/view/" + id;
      }
      
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

  // ========== 댓글 관련 기능 ==========
  
  @PostMapping("/view/{postId}/comments")
  public String addComment(@PathVariable int postId,
                          @RequestParam String content,
                          @RequestParam(required = false) String guestName,
                          @RequestParam(required = false) String guestPw,
                          HttpSession session,
                          RedirectAttributes redirectAttributes) {
    try {
      Comment comment = new Comment();
      comment.setPostType("community");
      comment.setPostId(postId);
      comment.setContent(content);
      
      // 로그인 사용자 확인
      Integer userId = (Integer) session.getAttribute("userId");
      if (userId != null) {
        // 로그인 사용자
        comment.setAuthorId(userId);
        log.info("로그인 사용자 {}가 커뮤니티 게시글 {}에 댓글 작성", userId, postId);
      } else {
        // 게스트 사용자
        if (guestName == null || guestName.trim().isEmpty()) {
          redirectAttributes.addFlashAttribute("commentError", "이름을 입력해주세요.");
          return "redirect:/community/view/" + postId;
        }
        if (guestPw == null || guestPw.trim().isEmpty()) {
          redirectAttributes.addFlashAttribute("commentError", "비밀번호를 입력해주세요.");
          return "redirect:/community/view/" + postId;
        }
        comment.setGuestName(guestName.trim());
        comment.setGuestPw(guestPw);
        log.info("게스트 사용자 {}가 커뮤니티 게시글 {}에 댓글 작성", guestName, postId);
      }
      
      commentService.addComment(comment);
      redirectAttributes.addFlashAttribute("commentSuccess", "댓글이 성공적으로 등록되었습니다.");
      
    } catch (Exception e) {
      log.error("댓글 등록 실패: ", e);
      redirectAttributes.addFlashAttribute("commentError", "댓글 등록에 실패했습니다: " + e.getMessage());
    }
    
    return "redirect:/community/view/" + postId;
  }

  @PostMapping("/comments/{commentId}/edit")
  @ResponseBody
  public ResponseEntity<Map<String, Object>> editComment(@PathVariable int commentId,
                                                        @RequestParam String content,
                                                        @RequestParam(required = false) String guestPw,
                                                        HttpSession session) {
    Map<String, Object> response = new HashMap<>();
    
    try {
      Comment comment = commentService.getCommentById(commentId);
      if (comment == null) {
        response.put("success", false);
        response.put("message", "댓글을 찾을 수 없습니다.");
        return ResponseEntity.ok(response);
      }
      
      // 권한 확인
      Integer userId = (Integer) session.getAttribute("userId");
      String role = (String) session.getAttribute("role");
      
      boolean canEdit = false;
      if ("admin".equals(role)) {
        canEdit = true;
      } else if (comment.getAuthorId() != null && userId != null && comment.getAuthorId().equals(userId)) {
        canEdit = true;
      } else if (comment.getAuthorId() == null && guestPw != null && guestPw.equals(comment.getGuestPw())) {
        canEdit = true;
      }
      
      if (!canEdit) {
        response.put("success", false);
        response.put("message", "댓글 수정 권한이 없습니다.");
        return ResponseEntity.ok(response);
      }
      
      comment.setContent(content);
      commentService.updateComment(comment);
      
      response.put("success", true);
      response.put("message", "댓글이 수정되었습니다.");
      
    } catch (Exception e) {
      log.error("댓글 수정 실패: ", e);
      response.put("success", false);
      response.put("message", "댓글 수정에 실패했습니다.");
    }
    
    return ResponseEntity.ok(response);
  }

  @PostMapping("/comments/{commentId}/delete")
  @ResponseBody
  public ResponseEntity<Map<String, Object>> deleteComment(@PathVariable int commentId,
                                                          @RequestParam(required = false) String guestPw,
                                                          HttpSession session) {
    Map<String, Object> response = new HashMap<>();
    
    try {
      Comment comment = commentService.getCommentById(commentId);
      if (comment == null) {
        response.put("success", false);
        response.put("message", "댓글을 찾을 수 없습니다.");
        return ResponseEntity.ok(response);
      }
      
      // 권한 확인
      Integer userId = (Integer) session.getAttribute("userId");
      String role = (String) session.getAttribute("role");
      
      boolean canDelete = false;
      if ("admin".equals(role)) {
        canDelete = true;
      } else if (comment.getAuthorId() != null && userId != null && comment.getAuthorId().equals(userId)) {
        canDelete = true;
      } else if (comment.getAuthorId() == null && guestPw != null && guestPw.equals(comment.getGuestPw())) {
        canDelete = true;
      }
      
      if (!canDelete) {
        response.put("success", false);
        response.put("message", "댓글 삭제 권한이 없습니다.");
        return ResponseEntity.ok(response);
      }
      
      commentService.deleteComment(commentId);
      
      response.put("success", true);
      response.put("message", "댓글이 삭제되었습니다.");
      
    } catch (Exception e) {
      log.error("댓글 삭제 실패: ", e);
      response.put("success", false);
      response.put("message", "댓글 삭제에 실패했습니다.");
    }
    
    return ResponseEntity.ok(response);
  }
}
