package com.webserver.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import com.webserver.project.mapper.ArtistPostMapper;
import com.webserver.project.mapper.CommunityMapper;
import com.webserver.project.mapper.CommentMapper;
import com.webserver.project.mapper.PromotionsMapper;
import com.webserver.project.model.ArtistPost;
import com.webserver.project.model.CommunityPost;

import java.util.Date;

@Controller
@Slf4j
public class HomeController {

    @Autowired
    private ArtistPostMapper artistPostMapper;
    
    @Autowired
    private CommunityMapper communityMapper;
    
    @Autowired
    private CommentMapper commentMapper;
    
    @Autowired
    private PromotionsMapper promotionsMapper;

    @GetMapping("/")
    public String home(Model model) {
        // 홈페이지용 데이터
        model.addAttribute("now", new Date());
        model.addAttribute("recentArtistPosts", artistPostMapper.findRecentPosts(3));
        model.addAttribute("recentCommunityPosts", communityMapper.findRecentPosts(3));
        model.addAttribute("activePromotions", promotionsMapper.findActivePromotions());
        return "index";
    }

    @GetMapping("/blog")
    public String blog(Model model, HttpSession session) {
        // 세션 정보 로깅
        log.info("=== Blog 페이지 접근 ===");
        log.info("Session ID: {}", session.getId());
        log.info("Login User: {}", session.getAttribute("loginUser"));
        log.info("Username: {}", session.getAttribute("username"));
        log.info("Display Name: {}", session.getAttribute("displayName"));
        log.info("Role: {}", session.getAttribute("role"));
        
        // 예술인 기록 목록 (블로그 역할)
        model.addAttribute("blogPosts", artistPostMapper.findAll());
        return "blog";
    }



    @GetMapping("/blog/{id}")
    public String blogDetails(@PathVariable Integer id, Model model) {
        // 예술인 기록 상세 보기
        ArtistPost post = artistPostMapper.findById(id);
        if (post != null) {
            artistPostMapper.increaseViewCount(id);
            model.addAttribute("post", post);
            
            // 댓글 목록과 개수
            var comments = commentMapper.findByArtistPost(id);
            model.addAttribute("comments", comments);
            model.addAttribute("commentCount", comments != null ? comments.size() : 0);
        }
        return "blog-details";
    }

    @GetMapping("/portfolio/{id}")
    public String portfolioDetails(@PathVariable Integer id, Model model) {
        // 포트폴리오는 예술인 기록을 활용
        ArtistPost post = artistPostMapper.findById(id);
        model.addAttribute("portfolio", post);
        return "portfolio-details";
    }

    @GetMapping("/service/{id}")
    public String serviceDetails(@PathVariable Integer id, Model model) {
        // 서비스 상세 (홍보글 활용 또는 정적 내용)
        model.addAttribute("serviceId", id);
        model.addAttribute("promotions", promotionsMapper.findActivePromotions());
        return "service-details";
    }

    @GetMapping("/starter")
    public String starterPage(Model model) {
        // 스타터 페이지
        model.addAttribute("pageTitle", "Starter Page");
        model.addAttribute("pageDescription", "This is a starter page for custom content.");
        return "starter-page";
    }
} 