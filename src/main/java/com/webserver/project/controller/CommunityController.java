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
  @ResponseBody
  public ResponseEntity<Map<String, Object>> editPasswordCheck(@PathVariable int id, 
                                                              @RequestParam String password,
                                                              HttpSession session) {
    log.info("=== 비밀번호 검증 시작 ===");
    log.info("게시글 ID: {}", id);
    log.info("입력된 비밀번호: {}", password);
    
    Map<String, Object> response = new HashMap<>();
    
    if (svc.validateGuestPassword(id, password)) {
      log.info("비밀번호 검증 성공 - 세션에 저장");
      // 비밀번호 검증 성공 시 세션에 검증 정보 저장
      session.setAttribute("passwordVerified_" + id, true);
      response.put("success", true);
      response.put("message", "비밀번호 검증 성공");
      return ResponseEntity.ok(response);
    } else {
      log.warn("비밀번호 검증 실패");
      response.put("success", false);
      response.put("message", "비밀번호가 일치하지 않습니다.");
      return ResponseEntity.badRequest().body(response);
    }
  }

  @GetMapping("/edit-form/{id}")
  public String editForm(@PathVariable int id, 
                        HttpSession session, 
                        Model m,
                        RedirectAttributes redirectAttributes) {
    log.info("=== 수정 폼 접근 ===");
    log.info("게시글 ID: {}", id);
    
    CommunityPost post = svc.getWithoutViewIncrement(id);
    if (post == null) {
      redirectAttributes.addFlashAttribute("error", "게시글을 찾을 수 없습니다.");
      return "redirect:/community";
    }
    
    // 권한 확인
    Integer userId = (Integer) session.getAttribute("userId");
    String role = (String) session.getAttribute("role");
    
    boolean canEdit = false;
    if ("admin".equals(role)) {
      canEdit = true;
    } else if (post.getAuthorId() != null && userId != null && post.getAuthorId().equals(userId)) {
      // 로그인 사용자가 작성한 글: 작성자 본인만
      canEdit = true;
    } else if (post.getAuthorId() == null) {
      // 비로그인 사용자가 작성한 글: 세션에서 비밀번호 검증 상태 확인
      Boolean passwordVerified = (Boolean) session.getAttribute("passwordVerified_" + id);
      log.info("세션에서 비밀번호 검증 상태: {}", passwordVerified);
      
      if (passwordVerified == null || !passwordVerified) {
        log.warn("비밀번호 검증을 거치지 않고 직접 접근 시도");
        redirectAttributes.addFlashAttribute("error", "비밀번호 검증이 필요합니다.");
        return "redirect:/community/view/" + id;
      }
      canEdit = true;
    }
    
    if (!canEdit) {
      redirectAttributes.addFlashAttribute("error", "수정 권한이 없습니다.");
      return "redirect:/community/view/" + id;
    }
    
    log.info("수정 폼 페이지로 이동");
    m.addAttribute("post", post);
    return "community-edit";
  }

  @PostMapping("/update/{id}")
  public String update(@PathVariable int id,
                      @RequestParam String title,
                      @RequestParam String content,
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
        // 비로그인 사용자가 작성한 글: 세션의 비밀번호 검증 상태 확인
        Boolean passwordVerified = (Boolean) session.getAttribute("passwordVerified_" + id);
        if (passwordVerified == null || !passwordVerified) {
          redirectAttributes.addFlashAttribute("error", "비밀번호 검증이 필요합니다.");
          return "redirect:/community/view/" + id;
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
      
      // 수정 완료 후 세션에서 비밀번호 검증 정보 제거
      session.removeAttribute("passwordVerified_" + id);
      
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

  @PostMapping("/admin-delete/{id}")
  public String adminDelete(@PathVariable int id, 
                           HttpSession session,
                           RedirectAttributes redirectAttributes) {
    log.info("=== 관리자 권한 삭제 시도 ===");
    log.info("게시글 ID: {}", id);
    
    // 관리자 권한 확인
    String role = (String) session.getAttribute("role");
    if (!"admin".equals(role)) {
      log.warn("관리자가 아닌 사용자가 관리자 삭제 시도: {}", role);
      redirectAttributes.addFlashAttribute("error", "관리자 권한이 필요합니다.");
      return "redirect:/community/view/" + id;
    }
    
    try {
      svc.delete(id);
      log.info("관리자 권한으로 게시글 {} 삭제 완료", id);
      redirectAttributes.addFlashAttribute("message", "관리자 권한으로 글이 삭제되었습니다.");
      return "redirect:/community";
    } catch (Exception e) {
      log.error("관리자 삭제 실패: ", e);
      redirectAttributes.addFlashAttribute("error", "글 삭제에 실패했습니다: " + e.getMessage());
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
        // 관리자는 모든 댓글 수정 가능 (비밀번호 검증 없음)
        canEdit = true;
      } else if (comment.getAuthorId() != null && userId != null && comment.getAuthorId().equals(userId)) {
        // 로그인 사용자의 본인 댓글
        canEdit = true;
      } else if (comment.getAuthorId() == null && guestPw != null && guestPw.equals(comment.getGuestPw())) {
        // 게스트 댓글 - 비밀번호 확인
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
        // 관리자는 모든 댓글 삭제 가능 (비밀번호 검증 없음)
        canDelete = true;
      } else if (comment.getAuthorId() != null && userId != null && comment.getAuthorId().equals(userId)) {
        // 로그인 사용자의 본인 댓글
        canDelete = true;
      } else if (comment.getAuthorId() == null && guestPw != null && guestPw.equals(comment.getGuestPw())) {
        // 게스트 댓글 - 비밀번호 확인
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
