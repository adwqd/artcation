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

  public List<Comment> listByPost(int postId) {
    return mapper.findByPost(postId);
  }
  public void add(Comment c) {
    mapper.insert(c);
  }
}
