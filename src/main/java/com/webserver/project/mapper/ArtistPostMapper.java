package com.webserver.project.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;

import com.webserver.project.model.ArtistPost;

@Mapper
public interface ArtistPostMapper {
    
    // 전체 예술인 게시글 목록
    @Select("SELECT ap.post_id as postId, ap.artist_id as artistId, ap.title, ap.content, " +
            "ap.image_url as imageUrl, ap.image_name as imageName, ap.view_count as viewCount, " +
            "ap.created_at as createdAt, ap.updated_at as updatedAt, u.display_name as displayName " +
            "FROM ArtistPosts ap JOIN Users u ON ap.artist_id = u.user_id " +
            "ORDER BY ap.created_at DESC")
    List<ArtistPost> findAll();
    
    // ID로 예술인 게시글 조회
    @Select("SELECT ap.post_id as postId, ap.artist_id as artistId, ap.title, ap.content, " +
            "ap.image_url as imageUrl, ap.image_name as imageName, ap.view_count as viewCount, " +
            "ap.created_at as createdAt, ap.updated_at as updatedAt, u.display_name as displayName " +
            "FROM ArtistPosts ap JOIN Users u ON ap.artist_id = u.user_id " +
            "WHERE ap.post_id = #{postId}")
    ArtistPost findById(Integer postId);
    
    // 예술인 ID로 게시글 목록 조회
    @Select("SELECT ap.post_id as postId, ap.artist_id as artistId, ap.title, ap.content, " +
            "ap.image_url as imageUrl, ap.image_name as imageName, ap.view_count as viewCount, " +
            "ap.created_at as createdAt, ap.updated_at as updatedAt, u.display_name as displayName " +
            "FROM ArtistPosts ap JOIN Users u ON ap.artist_id = u.user_id " +
            "WHERE ap.artist_id = #{artistId} ORDER BY ap.created_at DESC")
    List<ArtistPost> findByArtistId(Integer artistId);
    
    // 새 게시글 작성
    @Insert("INSERT INTO ArtistPosts (artist_id, title, content, image_url, image_name) " +
            "VALUES (#{artistId}, #{title}, #{content}, #{imageUrl}, #{imageName})")
    @Options(useGeneratedKeys = true, keyProperty = "postId")
    void insert(ArtistPost artistPost);
    
    // 게시글 수정
    @Update("UPDATE ArtistPosts SET title = #{title}, content = #{content}, " +
            "image_url = #{imageUrl}, image_name = #{imageName}, " +
            "updated_at = CURRENT_TIMESTAMP WHERE post_id = #{postId}")
    void update(ArtistPost artistPost);
    
    // 게시글 삭제
    @Delete("DELETE FROM ArtistPosts WHERE post_id = #{postId}")
    void delete(Integer postId);
    
    // 조회수 증가
    @Update("UPDATE ArtistPosts SET view_count = view_count + 1 WHERE post_id = #{postId}")
    void increaseViewCount(Integer postId);
    
    // 최신 게시글 N개 조회
    @Select("SELECT ap.post_id as postId, ap.artist_id as artistId, ap.title, ap.content, " +
            "ap.image_url as imageUrl, ap.image_name as imageName, ap.view_count as viewCount, " +
            "ap.created_at as createdAt, ap.updated_at as updatedAt, u.display_name as displayName " +
            "FROM ArtistPosts ap JOIN Users u ON ap.artist_id = u.user_id " +
            "ORDER BY ap.created_at DESC LIMIT #{limit}")
    List<ArtistPost> findRecentPosts(@Param("limit") int limit);
} 