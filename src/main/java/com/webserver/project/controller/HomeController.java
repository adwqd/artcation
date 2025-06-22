package com.webserver.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import com.webserver.project.mapper.ArtistPostMapper;
import com.webserver.project.mapper.CommunityMapper;
import com.webserver.project.mapper.CommentMapper;
import com.webserver.project.mapper.PromotionsMapper;
import com.webserver.project.model.ArtistPost;

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
    public String blog(@RequestParam(defaultValue = "latest") String sort, 
                      @RequestParam(defaultValue = "1") int page,
                      @RequestParam(required = false) String search,
                      Model model, HttpSession session) {
        // 세션 정보 로깅
        log.info("=== Blog 페이지 접근 ===");
        log.info("Session ID: {}", session.getId());
        log.info("Login User: {}", session.getAttribute("loginUser"));
        log.info("Username: {}", session.getAttribute("username"));
        log.info("Display Name: {}", session.getAttribute("displayName"));
        log.info("Role: {}", session.getAttribute("role"));
        log.info("정렬 옵션: {}, 페이지: {}, 검색어: {}", sort, page, search);
        
        // 페이지네이션 설정
        int pageSize = 6; // 한 페이지당 6개
        int offset = (page - 1) * pageSize;
        
        // 검색어가 있는 경우와 없는 경우 처리
        int totalPosts;
        if (search != null && !search.trim().isEmpty()) {
            // 검색 결과 개수
            totalPosts = artistPostMapper.getSearchCount(search.trim());
            // 검색 결과 목록
            model.addAttribute("blogPosts", artistPostMapper.findBySearchWithSortAndPagination(search.trim(), sort, pageSize, offset));
        } else {
            // 전체 게시글 수
            totalPosts = artistPostMapper.getTotalCount();
            // 전체 목록
            model.addAttribute("blogPosts", artistPostMapper.findAllWithSortAndPagination(sort, pageSize, offset));
        }
        
        int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
        
        model.addAttribute("currentSort", sort);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalPosts", totalPosts);
        model.addAttribute("searchKeyword", search);
        
        return "blog";
    }



    @GetMapping("/blog/{id}")
    public String blogDetails(@PathVariable Integer id, Model model, HttpSession session) {
        // 예술인 기록 상세 보기
        ArtistPost post = artistPostMapper.findById(id);
        
        // 포스트가 존재하지 않는 경우 404 에러 발생
        if (post == null) {
            log.warn("존재하지 않는 블로그 포스트에 접근 시도: ID = {}", id);
            throw new ResponseStatusException(
                HttpStatus.NOT_FOUND, 
                "요청하신 페이지를 찾을 수 없습니다."
            );
        }
        
        // 조회수 증가
        artistPostMapper.increaseViewCount(id);
        model.addAttribute("post", post);
        
        // 댓글 목록과 개수
        var comments = commentMapper.findByArtistPost(id);
        model.addAttribute("comments", comments);
        model.addAttribute("commentCount", comments != null ? comments.size() : 0);
        
        // 해당 예술가의 최근 작품 목록 (현재 글 제외)
        var recentPostsByArtist = artistPostMapper.findRecentPostsByArtistExcludingCurrent(post.getArtistId(), id, 5);
        model.addAttribute("recentPosts", recentPostsByArtist);
        
        return "blog-details";
    }

    @GetMapping("/portfolio/{id}")
    public String portfolioDetails(@PathVariable Integer id, Model model) {
        // 포트폴리오는 예술인 기록을 활용
        ArtistPost post = artistPostMapper.findById(id);
        
        // 포스트가 존재하지 않는 경우 404 에러 발생
        if (post == null) {
            log.warn("존재하지 않는 포트폴리오에 접근 시도: ID = {}", id);
            throw new ResponseStatusException(
                HttpStatus.NOT_FOUND, 
                "요청하신 포트폴리오를 찾을 수 없습니다."
            );
        }
        
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