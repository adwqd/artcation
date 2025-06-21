package com.webserver.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webserver.project.mapper.ArtistPostMapper;
import com.webserver.project.mapper.UserMapper;
import com.webserver.project.model.ArtistPost;
import com.webserver.project.model.User;
import com.webserver.project.service.ArtistPostService;
import com.webserver.project.config.FileUploadService;
import org.springframework.web.multipart.MultipartFile;

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
    
    @Autowired
    private FileUploadService fileUploadService;

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
        return "artist-write";
    }

    // 예술인 기록 작성 처리
    @PostMapping("/write")
    public String writePost(@ModelAttribute ArtistPost post, 
                           @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                           HttpSession session, RedirectAttributes redirectAttributes) {
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
            String username = (String) session.getAttribute("username");
            String displayName = (String) session.getAttribute("displayName");
            
            // 디버깅 로그
            System.out.println("=== 기록 작성 디버깅 ===");
            System.out.println("Session userId: " + userId);
            System.out.println("Session username: " + username);
            System.out.println("Session displayName: " + displayName);
            System.out.println("Post title: " + post.getTitle());
            System.out.println("Post content length: " + (post.getContent() != null ? post.getContent().length() : "null"));
            
            // userId가 null인 경우, username으로 사용자 정보를 다시 조회
            if (userId == null && username != null) {
                System.out.println("userId가 null이므로 username으로 사용자 정보 조회: " + username);
                User user = userMapper.findByUsername(username);
                if (user != null) {
                    userId = user.getUserId();
                    session.setAttribute("userId", userId);
                    session.setAttribute("displayName", user.getDisplayName());
                    System.out.println("사용자 정보 재설정 완료 - userId: " + userId + ", displayName: " + user.getDisplayName());
                }
            }
            
            if (userId == null) {
                System.out.println("ERROR: userId를 찾을 수 없음. 로그인 페이지로 리다이렉트");
                redirectAttributes.addFlashAttribute("error", "세션에서 사용자 ID를 찾을 수 없습니다. 다시 로그인해주세요.");
                return "redirect:/login";
            }
            
            post.setArtistId(userId);
            System.out.println("Post artistId after setting: " + post.getArtistId());
            
            // 이미지 파일 업로드 처리
            if (imageFile != null && !imageFile.isEmpty()) {
                try {
                    String imageUrl = fileUploadService.uploadImage(imageFile);
                    post.setImageUrl(imageUrl);
                    post.setImageName(imageFile.getOriginalFilename());
                    System.out.println("Image uploaded: " + imageUrl);
                } catch (Exception e) {
                    System.out.println("이미지 업로드 실패: " + e.getMessage());
                    redirectAttributes.addFlashAttribute("error", "이미지 업로드 실패: " + e.getMessage());
                    return "redirect:/artist-write";
                }
            }
            
            System.out.println("artistPostService.add 호출 시작");
            artistPostService.add(post);
            System.out.println("artistPostService.add 완료. postId: " + post.getPostId());
            
            redirectAttributes.addFlashAttribute("message", "예술인 기록이 성공적으로 작성되었습니다.");
            return "redirect:/blog/" + post.getPostId();
        } catch (Exception e) {
            System.out.println("기록 작성 오류: " + e.getMessage());
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "기록 작성 중 오류가 발생했습니다: " + e.getMessage());
            return "redirect:/artist-write";
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
            return "artist-edit";
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