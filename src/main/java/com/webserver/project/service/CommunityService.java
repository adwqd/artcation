package com.webserver.project.service;

import com.webserver.project.mapper.CommunityMapper;
import com.webserver.project.model.CommunityPost;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CommunityService {
  private final CommunityMapper mapper;

  // 전체 커뮤니티 게시글 목록 (기본: 최신순)
  public List<CommunityPost> list() {
    return mapper.findAll();
  }

  // 정렬 옵션으로 커뮤니티 게시글 목록 조회
  public List<CommunityPost> listWithSort(String sort) {
    return mapper.findAllWithSort(sort);
  }

  // 특정 회원의 게시글 목록
  public List<CommunityPost> listByAuthor(Integer authorId) {
    return mapper.findByAuthorId(authorId);
  }

  // 최신 게시글 N개 조회
  public List<CommunityPost> getRecentPosts(int limit) {
    return mapper.findRecentPosts(limit);
  }

  // 게시글 상세 조회 (조회수 증가)
  public CommunityPost get(int id) {
    mapper.incrementView(id);
    return mapper.findById(id);
  }

  // 게시글 조회 (조회수 증가 없음)
  public CommunityPost getWithoutViewIncrement(int id) {
    return mapper.findById(id);
  }

  // 게시글 작성
  public void add(CommunityPost p) { 
    // 회원/비회원 검증
    if (p.getAuthorId() == null && (p.getGuestName() == null || p.getGuestName().isEmpty())) {
      throw new IllegalArgumentException("작성자 정보가 필요합니다.");
    }

    // 비회원의 경우 비밀번호 필수
    if (p.getAuthorId() == null && (p.getGuestPw() == null || p.getGuestPw().isEmpty())) {
      throw new IllegalArgumentException("비회원 글 작성시 비밀번호가 필요합니다.");
    }

    mapper.insert(p); 
  }

  // 게시글 수정
  public void update(CommunityPost p) { 
    mapper.update(p); 
  }

  // 게시글 삭제
  public void delete(int id) { 
    mapper.delete(id); 
  }

  // 비회원 게시글 비밀번호 확인
  public boolean validateGuestPassword(int postId, String inputPassword) {
    CommunityPost post = mapper.findById(postId);
    if (post == null || post.getAuthorId() != null) {
      return false; // 존재하지 않거나 회원 게시글
    }
    return post.getGuestPw() != null && post.getGuestPw().equals(inputPassword);
  }

  // 페이지네이션과 정렬을 지원하는 게시글 목록 조회
  public List<CommunityPost> listWithSortAndPagination(String sort, int limit, int offset) {
    return mapper.findAllWithSortAndPagination(sort, limit, offset);
  }

  // 전체 게시글 개수 조회
  public int getTotalCount() {
    return mapper.getTotalCount();
  }

  // 검색과 정렬, 페이지네이션을 지원하는 게시글 목록 조회
  public List<CommunityPost> searchWithSortAndPagination(String keyword, String sort, int limit, int offset) {
    return mapper.searchWithSortAndPagination(keyword, sort, limit, offset);
  }

  // 검색 결과 개수 조회
  public int getSearchCount(String keyword) {
    return mapper.getSearchCount(keyword);
  }
}
