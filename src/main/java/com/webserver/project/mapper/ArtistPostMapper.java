package com.webserver.project.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;

import com.webserver.project.model.ArtistPost;

@Mapper
public interface ArtistPostMapper {
    
    // 전체 예술인 게시글 목록 (기본: 최신순)
    @Select("SELECT ap.post_id as postId, ap.artist_id as artistId, ap.title, ap.content, " +
            "ap.image_url as imageUrl, ap.image_name as imageName, ap.view_count as viewCount, " +
            "ap.created_at as createdAt, ap.updated_at as updatedAt, u.display_name as displayName " +
            "FROM ArtistPosts ap JOIN Users u ON ap.artist_id = u.user_id " +
            "ORDER BY ap.created_at DESC")
    List<ArtistPost> findAll();
    
    // 정렬 옵션으로 예술인 게시글 목록 조회
    @Select("<script>" +
            "SELECT ap.post_id as postId, ap.artist_id as artistId, ap.title, ap.content, " +
            "ap.image_url as imageUrl, ap.image_name as imageName, ap.view_count as viewCount, " +
            "ap.created_at as createdAt, ap.updated_at as updatedAt, u.display_name as displayName " +
            "FROM ArtistPosts ap JOIN Users u ON ap.artist_id = u.user_id " +
            "ORDER BY " +
            "<choose>" +
            "<when test='sort == \"oldest\"'>ap.created_at ASC</when>" +
            "<when test='sort == \"views\"'>ap.view_count DESC, ap.created_at DESC</when>" +
            "<otherwise>ap.created_at DESC</otherwise>" +
            "</choose>" +
            "</script>")
    List<ArtistPost> findAllWithSort(@Param("sort") String sort);
    
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
    
    // 페이지네이션과 정렬을 지원하는 게시글 목록 조회
    @Select("<script>" +
            "SELECT ap.post_id as postId, ap.artist_id as artistId, ap.title, ap.content, " +
            "ap.image_url as imageUrl, ap.image_name as imageName, ap.view_count as viewCount, " +
            "ap.created_at as createdAt, ap.updated_at as updatedAt, u.display_name as displayName " +
            "FROM ArtistPosts ap JOIN Users u ON ap.artist_id = u.user_id " +
            "ORDER BY " +
            "<choose>" +
            "<when test='sort == \"oldest\"'>ap.created_at ASC</when>" +
            "<when test='sort == \"views\"'>ap.view_count DESC, ap.created_at DESC</when>" +
            "<otherwise>ap.created_at DESC</otherwise>" +
            "</choose>" +
            " LIMIT #{limit} OFFSET #{offset}" +
            "</script>")
    List<ArtistPost> findAllWithSortAndPagination(@Param("sort") String sort, @Param("limit") int limit, @Param("offset") int offset);
    
    // 전체 게시글 개수 조회
    @Select("SELECT COUNT(*) FROM ArtistPosts")
    int getTotalCount();
    
    // 특정 예술가의 최근 게시글 조회 (현재 글 제외)
    @Select("SELECT ap.post_id as postId, ap.artist_id as artistId, ap.title, ap.content, " +
            "ap.image_url as imageUrl, ap.image_name as imageName, ap.view_count as viewCount, " +
            "ap.created_at as createdAt, ap.updated_at as updatedAt, u.display_name as displayName " +
            "FROM ArtistPosts ap JOIN Users u ON ap.artist_id = u.user_id " +
            "WHERE ap.artist_id = #{artistId} AND ap.post_id != #{currentPostId} " +
            "ORDER BY ap.created_at DESC LIMIT #{limit}")
    List<ArtistPost> findRecentPostsByArtistExcludingCurrent(@Param("artistId") Integer artistId, 
                                                            @Param("currentPostId") Integer currentPostId, 
                                                            @Param("limit") int limit);
    
    // 검색 결과 조회 (페이지네이션과 정렬 지원) - 제목과 예술인명만 검색
    @Select("<script>" +
            "SELECT ap.post_id as postId, ap.artist_id as artistId, ap.title, ap.content, " +
            "ap.image_url as imageUrl, ap.image_name as imageName, ap.view_count as viewCount, " +
            "ap.created_at as createdAt, ap.updated_at as updatedAt, u.display_name as displayName " +
            "FROM ArtistPosts ap JOIN Users u ON ap.artist_id = u.user_id " +
            "WHERE (ap.title LIKE CONCAT('%', #{search}, '%') OR u.display_name LIKE CONCAT('%', #{search}, '%')) " +
            "ORDER BY " +
            "<choose>" +
            "<when test='sort == \"oldest\"'>ap.created_at ASC</when>" +
            "<when test='sort == \"views\"'>ap.view_count DESC, ap.created_at DESC</when>" +
            "<otherwise>ap.created_at DESC</otherwise>" +
            "</choose>" +
            " LIMIT #{limit} OFFSET #{offset}" +
            "</script>")
    List<ArtistPost> findBySearchWithSortAndPagination(@Param("search") String search, @Param("sort") String sort, @Param("limit") int limit, @Param("offset") int offset);
    
    // 검색 결과 개수 조회 - 제목과 예술인명만 검색
    @Select("SELECT COUNT(*) FROM ArtistPosts ap JOIN Users u ON ap.artist_id = u.user_id " +
            "WHERE (ap.title LIKE CONCAT('%', #{search}, '%') OR u.display_name LIKE CONCAT('%', #{search}, '%'))")
    int getSearchCount(@Param("search") String search);
} 