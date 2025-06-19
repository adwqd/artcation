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

  public List<CommunityPost> list() {
    return mapper.findAll();
  }
  public CommunityPost get(int id) {
    mapper.incrementView(id);
    return mapper.findById(id);
  }
  public void add(CommunityPost p) { mapper.insert(p); }
  public void update(CommunityPost p) { mapper.update(p); }
  public void delete(int id) { mapper.delete(id); }
}
