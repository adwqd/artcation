package com.webserver.project.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;

import com.webserver.project.model.Promotions;

@Mapper
public interface PromotionsMapper {
    
    // 활성화된 홍보 목록
    @Select("SELECT * FROM Promotions WHERE active = TRUE ORDER BY created_at DESC")
    List<Promotions> findActivePromotions();
    
    // 전체 홍보 목록
    @Select("SELECT * FROM Promotions ORDER BY created_at DESC")
    List<Promotions> findAll();
    
    // ID로 홍보 조회
    @Select("SELECT * FROM Promotions WHERE promo_id = #{promoId}")
    Promotions findById(Integer promoId);
    
    // 새 홍보 작성
    @Insert("INSERT INTO Promotions (title, content, link_url, active) " +
            "VALUES (#{title}, #{content}, #{linkUrl}, #{active})")
    @Options(useGeneratedKeys = true, keyProperty = "promoId")
    void insert(Promotions promotions);
    
    // 홍보 수정
    @Update("UPDATE Promotions SET title = #{title}, content = #{content}, " +
            "link_url = #{linkUrl}, active = #{active} WHERE promo_id = #{promoId}")
    void update(Promotions promotions);
    
    // 홍보 삭제
    @Delete("DELETE FROM Promotions WHERE promo_id = #{promoId}")
    void delete(Integer promoId);
    
    // 홍보 활성화/비활성화
    @Update("UPDATE Promotions SET active = #{active} WHERE promo_id = #{promoId}")
    void updateActive(@Param("promoId") Integer promoId, @Param("active") Boolean active);
} 