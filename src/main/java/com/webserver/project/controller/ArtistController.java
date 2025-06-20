package com.webserver.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webserver.project.mapper.ArtistPostMapper;
import com.webserver.project.mapper.UserMapper;
import com.webserver.project.model.ArtistPost;
import com.webserver.project.service.ArtistPostService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/artist")
public class ArtistController {

    @Autowired
    private ArtistPostMapper artistPostMapper;
    
    @Autowired
    private UserMapper userMapper;
    
    @Autowired
    private ArtistPostService artistPostService;

    // 예술인 목록
    @GetMapping("/list")
    public String artistList(Model model) {
        model.addAttribute("artists", userMapper.findAllArtists());
        return "artist/list";
    }

    // 특정 예술인의 작품 목록
    @GetMapping("/{artistId}/posts")
    public String artistPosts(@PathVariable Integer artistId, Model model) {
        model.addAttribute("artist", userMapper.findById(artistId));
        model.addAttribute("posts", artistPostMapper.findByArtistId(artistId));
        return "artist/posts";
    }

    // 예술인 기록 작성 폼
    @GetMapping("/write")
    public String writeForm(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        // 로그인 체크
        if (!isLoggedIn(session)) {
            session.setAttribute("redirectAfterLogin", "/artist/write");
            redirectAttributes.addFlashAttribute("message", "예술인 기록 작성을 위해 로그인해주세요.");
            return "redirect:/login";
        }
        
        // 예술인 또는 관리자 권한 체크
        if (!isArtistOrAdmin(session)) {
            redirectAttributes.addFlashAttribute("error", "예술인 기록 작성 권한이 없습니다.");
            return "redirect:/blog";
        }
        
        model.addAttribute("post", new ArtistPost());
        return "artist/write";
    }

    // 예술인 기록 작성 처리
    @PostMapping("/write")
    public String writePost(@ModelAttribute ArtistPost post, HttpSession session, RedirectAttributes redirectAttributes) {
        try {
            // 로그인 체크
            if (!isLoggedIn(session)) {
                redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
                return "redirect:/login";
            }
            
            // 예술인 또는 관리자 권한 체크
            if (!isArtistOrAdmin(session)) {
                redirectAttributes.addFlashAttribute("error", "예술인 기록 작성 권한이 없습니다.");
                return "redirect:/blog";
            }
            
            // 세션에서 로그인된 사용자 ID 가져오기
            Integer userId = (Integer) session.getAttribute("userId");
            post.setArtistId(userId);
            
            artistPostService.add(post);
            redirectAttributes.addFlashAttribute("message", "예술인 기록이 성공적으로 작성되었습니다.");
            return "redirect:/blog/" + post.getPostId();
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "기록 작성 중 오류가 발생했습니다: " + e.getMessage());
            return "redirect:/artist/write";
        }
    }

    // 예술인 기록 수정 폼
    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        try {
            // 로그인 체크
            if (!isLoggedIn(session)) {
                session.setAttribute("redirectAfterLogin", "/artist/edit/" + id);
                redirectAttributes.addFlashAttribute("message", "로그인이 필요합니다.");
                return "redirect:/login";
            }
            
            ArtistPost post = artistPostMapper.findById(id);
            if (post == null) {
                redirectAttributes.addFlashAttribute("error", "존재하지 않는 기록입니다.");
                return "redirect:/blog";
            }
            
            // 작성자 또는 관리자만 수정 가능
            Integer userId = (Integer) session.getAttribute("userId");
            String role = (String) session.getAttribute("role");
            
            if (!post.getArtistId().equals(userId) && !"admin".equals(role)) {
                redirectAttributes.addFlashAttribute("error", "수정 권한이 없습니다.");
                return "redirect:/blog/" + id;
            }
            
            model.addAttribute("post", post);
            return "artist/edit";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "기록 조회 중 오류가 발생했습니다: " + e.getMessage());
            return "redirect:/blog";
        }
    }

    // 예술인 기록 수정 처리
    @PostMapping("/edit/{id}")
    public String editPost(@PathVariable Integer id, @ModelAttribute ArtistPost post, HttpSession session, RedirectAttributes redirectAttributes) {
        try {
            // 로그인 체크
            if (!isLoggedIn(session)) {
                redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
                return "redirect:/login";
            }
            
            ArtistPost existingPost = artistPostMapper.findById(id);
            if (existingPost == null) {
                redirectAttributes.addFlashAttribute("error", "존재하지 않는 기록입니다.");
                return "redirect:/blog";
            }
            
            // 작성자 또는 관리자만 수정 가능
            Integer userId = (Integer) session.getAttribute("userId");
            String role = (String) session.getAttribute("role");
            
            if (!existingPost.getArtistId().equals(userId) && !"admin".equals(role)) {
                redirectAttributes.addFlashAttribute("error", "수정 권한이 없습니다.");
                return "redirect:/blog/" + id;
            }
            
            post.setPostId(id);
            post.setArtistId(existingPost.getArtistId()); // 원래 작성자 ID 유지
            artistPostService.update(post);
            
            redirectAttributes.addFlashAttribute("message", "예술인 기록이 성공적으로 수정되었습니다.");
            return "redirect:/blog/" + id;
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "기록 수정 중 오류가 발생했습니다: " + e.getMessage());
            return "redirect:/artist/edit/" + id;
        }
    }

    // 예술인 기록 삭제
    @PostMapping("/delete/{id}")
    public String deletePost(@PathVariable Integer id, HttpSession session, RedirectAttributes redirectAttributes) {
        try {
            // 로그인 체크
            if (!isLoggedIn(session)) {
                redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
                return "redirect:/login";
            }
            
            ArtistPost post = artistPostMapper.findById(id);
            if (post == null) {
                redirectAttributes.addFlashAttribute("error", "존재하지 않는 기록입니다.");
                return "redirect:/blog";
            }
            
            // 작성자 또는 관리자만 삭제 가능
            Integer userId = (Integer) session.getAttribute("userId");
            String role = (String) session.getAttribute("role");
            
            if (!post.getArtistId().equals(userId) && !"admin".equals(role)) {
                redirectAttributes.addFlashAttribute("error", "삭제 권한이 없습니다.");
                return "redirect:/blog/" + id;
            }
            
            artistPostService.delete(id);
            redirectAttributes.addFlashAttribute("message", "예술인 기록이 성공적으로 삭제되었습니다.");
            return "redirect:/blog";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "기록 삭제 중 오류가 발생했습니다: " + e.getMessage());
            return "redirect:/blog/" + id;
        }
    }
    
    // 유틸리티 메서드들
    private boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("loginUser") != null;
    }
    
    private boolean isArtistOrAdmin(HttpSession session) {
        String role = (String) session.getAttribute("role");
        return "artist".equals(role) || "admin".equals(role);
    }
} 