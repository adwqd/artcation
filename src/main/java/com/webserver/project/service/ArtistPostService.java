package com.webserver.project.service;

import com.webserver.project.mapper.ArtistPostMapper;
import com.webserver.project.model.ArtistPost;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ArtistPostService {
  private final ArtistPostMapper mapper;

  // 전체 예술인 기록 목록
  public List<ArtistPost> list() {
    return mapper.findAll();
  }

  // 특정 예술인의 기록 목록
  public List<ArtistPost> listByArtist(Integer artistId) {
    return mapper.findByArtistId(artistId);
  }

  // 최신 기록 N개 조회
  public List<ArtistPost> getRecentPosts(int limit) {
    return mapper.findRecentPosts(limit);
  }

  // 기록 상세 조회 (조회수 증가)
  public ArtistPost get(Integer id) {
    mapper.increaseViewCount(id);
    return mapper.findById(id);
  }

  // 기록 조회 (조회수 증가 없음)
  public ArtistPost getWithoutViewIncrement(Integer id) {
    return mapper.findById(id);
  }

  // 기록 작성
  public void add(ArtistPost post) {
    // 필수 필드 검증
    if (post.getArtistId() == null) {
      throw new IllegalArgumentException("예술인 ID가 필요합니다.");
    }
    if (post.getTitle() == null || post.getTitle().trim().isEmpty()) {
      throw new IllegalArgumentException("제목은 필수입니다.");
    }
    if (post.getContent() == null || post.getContent().trim().isEmpty()) {
      throw new IllegalArgumentException("내용은 필수입니다.");
    }

    mapper.insert(post);
  }

  // 기록 수정
  public void update(ArtistPost post) {
    if (post.getPostId() == null) {
      throw new IllegalArgumentException("게시글 ID가 필요합니다.");
    }
    mapper.update(post);
  }

  // 기록 삭제
  public void delete(Integer id) {
    mapper.delete(id);
  }

  // 작성자 권한 확인
  public boolean isAuthor(Integer postId, Integer artistId) {
    ArtistPost post = mapper.findById(postId);
    return post != null && post.getArtistId().equals(artistId);
  }
} 