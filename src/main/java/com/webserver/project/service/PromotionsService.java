package com.webserver.project.service;

import com.webserver.project.mapper.PromotionsMapper;
import com.webserver.project.model.Promotions;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PromotionsService {
  private final PromotionsMapper mapper;

  // 활성화된 홍보 목록
  public List<Promotions> getActivePromotions() {
    return mapper.findActivePromotions();
  }

  // 전체 홍보 목록 (관리자용)
  public List<Promotions> list() {
    return mapper.findAll();
  }

  // 홍보 상세 조회
  public Promotions get(Integer id) {
    return mapper.findById(id);
  }

  // 홍보 작성
  public void add(Promotions promo) {
    // 필수 필드 검증
    if (promo.getTitle() == null || promo.getTitle().trim().isEmpty()) {
      throw new IllegalArgumentException("제목은 필수입니다.");
    }
    if (promo.getContent() == null || promo.getContent().trim().isEmpty()) {
      throw new IllegalArgumentException("내용은 필수입니다.");
    }

    // 기본값 설정
    if (promo.getActive() == null) {
      promo.setActive(true);
    }

    mapper.insert(promo);
  }

  // 홍보 수정
  public void update(Promotions promo) {
    if (promo.getPromoId() == null) {
      throw new IllegalArgumentException("홍보 ID가 필요합니다.");
    }
    mapper.update(promo);
  }

  // 홍보 삭제
  public void delete(Integer id) {
    mapper.delete(id);
  }

  // 홍보 활성화/비활성화
  public void toggleActive(Integer id) {
    Promotions promo = mapper.findById(id);
    if (promo != null) {
      mapper.updateActive(id, !promo.getActive());
    }
  }

  // 홍보 활성화
  public void activate(Integer id) {
    mapper.updateActive(id, true);
  }

  // 홍보 비활성화
  public void deactivate(Integer id) {
    mapper.updateActive(id, false);
  }
} 