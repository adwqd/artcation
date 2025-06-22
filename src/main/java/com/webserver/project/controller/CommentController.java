package com.webserver.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import com.webserver.project.mapper.CommentMapper;
import com.webserver.project.mapper.UserMapper;
import com.webserver.project.model.Comment;
import com.webserver.project.model.User;

@Controller
@Slf4j
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private UserMapper userMapper;

    @PostMapping("/artist/{postId}")
    public String addArtistComment(@PathVariable Integer postId,
                                  @RequestParam String content,
                                  @RequestParam(required = false) String guestName,
                                  @RequestParam(required = false) String guestPw,
                                  HttpSession session,
                                  RedirectAttributes redirectAttributes) {

        log.info("=== 예술인 기록 댓글 작성 ===");
        log.info("Post ID: {}", postId);
        log.info("Content: {}", content);
        log.info("Guest Name: {}", guestName);
        log.info("Session User: {}", session.getAttribute("loginUser"));

        Comment comment = new Comment();
        comment.setPostType("artist");
        comment.setPostId(postId);
        comment.setContent(content);

        Integer userId = (Integer) session.getAttribute("userId");
        String username = (String) session.getAttribute("username");

        if (userId != null && username != null) {
            comment.setAuthorId(userId);
            comment.setGuestName(null);
            comment.setGuestPw(null);
        } else {
            if (guestName == null || guestName.trim().isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "이름을 입력해주세요.");
                return "redirect:/blog/" + postId;
            }
            if (guestPw == null || guestPw.trim().isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "비밀번호를 입력해주세요.");
                return "redirect:/blog/" + postId;
            }

            comment.setAuthorId(null);
            comment.setGuestName(guestName.trim());
            comment.setGuestPw(guestPw.trim());
        }

        try {
            commentMapper.insert(comment);
            redirectAttributes.addFlashAttribute("success", "댓글이 성공적으로 등록되었습니다.");
        } catch (Exception e) {
            log.error("댓글 작성 실패", e);
            redirectAttributes.addFlashAttribute("error", "댓글 등록 중 오류가 발생했습니다.");
        }

        return "redirect:/blog/" + postId;
    }

    @PostMapping("/community/{postId}")
    public String addCommunityComment(@PathVariable Integer postId,
                                     @RequestParam String content,
                                     @RequestParam(required = false) String guestName,
                                     @RequestParam(required = false) String guestPw,
                                     HttpSession session,
                                     RedirectAttributes redirectAttributes) {

        Comment comment = new Comment();
        comment.setPostType("community");
        comment.setPostId(postId);
        comment.setContent(content);

        Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null) {
            comment.setAuthorId(userId);
            comment.setGuestName(null);
            comment.setGuestPw(null);
        } else {
            if (guestName == null || guestName.trim().isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "이름을 입력해주세요.");
                return "redirect:/community/" + postId;
            }
            if (guestPw == null || guestPw.trim().isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "비밀번호를 입력해주세요.");
                return "redirect:/community/" + postId;
            }

            comment.setAuthorId(null);
            comment.setGuestName(guestName.trim());
            comment.setGuestPw(guestPw.trim());
        }

        try {
            commentMapper.insert(comment);
            redirectAttributes.addFlashAttribute("success", "댓글이 성공적으로 등록되었습니다.");
        } catch (Exception e) {
            log.error("댓글 작성 실패", e);
            redirectAttributes.addFlashAttribute("error", "댓글 등록 중 오류가 발생했습니다.");
        }

        return "redirect:/community/" + postId;
    }

    @PostMapping("/edit/{commentId}")
    public String editComment(@PathVariable Integer commentId,
                             @RequestParam String content,
                             @RequestParam(required = false) String guestPw,
                             HttpSession session,
                             RedirectAttributes redirectAttributes) {

        Comment comment = commentMapper.findById(commentId);
        if (comment == null) {
            redirectAttributes.addFlashAttribute("error", "댓글을 찾을 수 없습니다.");
            return "redirect:/";
        }

        if (!canModifyComment(comment, session, guestPw)) {
            redirectAttributes.addFlashAttribute("error", "댓글을 수정할 권한이 없습니다.");
            return getRedirectUrl(comment);
        }

        comment.setContent(content);
        try {
            commentMapper.update(comment);
            redirectAttributes.addFlashAttribute("success", "댓글이 수정되었습니다.");
        } catch (Exception e) {
            log.error("댓글 수정 실패", e);
            redirectAttributes.addFlashAttribute("error", "댓글 수정 중 오류가 발생했습니다.");
        }
        return getRedirectUrl(comment);
    }

    @PostMapping("/delete/{commentId}")
    public String deleteComment(@PathVariable Integer commentId,
                               @RequestParam(required = false) String guestPw,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {

        Comment comment = commentMapper.findById(commentId);
        if (comment == null) {
            redirectAttributes.addFlashAttribute("error", "댓글을 찾을 수 없습니다.");
            return "redirect:/";
        }

        if (!canModifyComment(comment, session, guestPw)) {
            redirectAttributes.addFlashAttribute("error", "댓글을 삭제할 권한이 없습니다.");
            return getRedirectUrl(comment);
        }

        try {
            commentMapper.delete(commentId);
            redirectAttributes.addFlashAttribute("success", "댓글이 삭제되었습니다.");
        } catch (Exception e) {
            log.error("댓글 삭제 실패", e);
            redirectAttributes.addFlashAttribute("error", "댓글 삭제 중 오류가 발생했습니다.");
        }

        return getRedirectUrl(comment);
    }

    private boolean canModifyComment(Comment comment, HttpSession session, String guestPw) {
        Integer userId = (Integer) session.getAttribute("userId");
        String role = (String) session.getAttribute("role");

        if ("admin".equals(role)) {
            return true;
        }

        if (comment.getAuthorId() != null) {
            return userId != null && userId.equals(comment.getAuthorId());
        }

        if (comment.getGuestPw() != null) {
            return guestPw != null && guestPw.equals(comment.getGuestPw());
        }

        return false;
    }

    private String getRedirectUrl(Comment comment) {
        if ("artist".equals(comment.getPostType())) {
            return "redirect:/blog/" + comment.getPostId();
        } else if ("community".equals(comment.getPostType())) {
            return "redirect:/community/" + comment.getPostId();
        }
        return "redirect:/";
    }
}
