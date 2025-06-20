package com.webserver.project.service;

import com.webserver.project.mapper.CommentMapper;
import com.webserver.project.model.Comment;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentService {
  private final CommentMapper mapper;

  // 커뮤니티 게시글 댓글 조회
  public List<Comment> listByCommunityPost(int postId) {
    return mapper.findByPost(postId);
  }

  // 예술인 기록 댓글 조회
  public List<Comment> listByArtistPost(int postId) {
    return mapper.findByArtistPost(postId);
  }

  // 댓글 상세 조회
  public Comment getById(int commentId) {
    return mapper.findById(commentId);
  }

  // 댓글 작성
  public void add(Comment c) {
    // postType 설정 검증
    if (c.getPostType() == null || c.getPostType().isEmpty()) {
      throw new IllegalArgumentException("댓글 타입(post_type)을 설정해주세요.");
    }
    
    // 회원/비회원 검증
    if (c.getAuthorId() == null && (c.getGuestName() == null || c.getGuestName().isEmpty())) {
      throw new IllegalArgumentException("작성자 정보가 필요합니다.");
    }
    
    mapper.insert(c);
  }

  // 댓글 수정
  public void update(Comment c) {
    mapper.update(c);
  }

  // 댓글 삭제
  public void delete(int commentId) {
    mapper.delete(commentId);
  }

  // 댓글 좋아요 증가
  public void increaseLike(int commentId) {
    mapper.increaseLikeCount(commentId);
  }

  // 댓글 좋아요 감소
  public void decreaseLike(int commentId) {
    mapper.decreaseLikeCount(commentId);
  }
}
