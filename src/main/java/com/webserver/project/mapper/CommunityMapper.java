package com.webserver.project.mapper;

import com.webserver.project.model.CommunityPost;
import java.util.List;
import org.apache.ibatis.annotations.*;

@Mapper
public interface CommunityMapper {
  // 전체 커뮤니티 게시글 목록 (기본: 최신순)
  @Select("SELECT post_id, author_id, guest_name, guest_pw, title, content, view_count, created_at, updated_at, guest_name as authorName FROM CommunityPosts ORDER BY created_at DESC")
  @Results({
    @Result(property = "postId", column = "post_id"),
    @Result(property = "authorId", column = "author_id"),
    @Result(property = "guestName", column = "guest_name"),
    @Result(property = "guestPw", column = "guest_pw"),
    @Result(property = "title", column = "title"),
    @Result(property = "content", column = "content"),
    @Result(property = "viewCount", column = "view_count"),
    @Result(property = "createdAt", column = "created_at"),
    @Result(property = "updatedAt", column = "updated_at"),
    @Result(property = "authorName", column = "authorName")
  })
  List<CommunityPost> findAll();

  // 정렬 옵션으로 커뮤니티 게시글 목록 조회
  @Select("<script>" +
          "SELECT post_id, author_id, guest_name, guest_pw, title, content, view_count, created_at, updated_at, guest_name as authorName " +
          "FROM CommunityPosts " +
          "ORDER BY " +
          "<choose>" +
          "<when test='sort == \"oldest\"'>created_at ASC</when>" +
          "<when test='sort == \"views\"'>view_count DESC, created_at DESC</when>" +
          "<otherwise>created_at DESC</otherwise>" +
          "</choose>" +
          "</script>")
  @Results({
    @Result(property = "postId", column = "post_id"),
    @Result(property = "authorId", column = "author_id"),
    @Result(property = "guestName", column = "guest_name"),
    @Result(property = "guestPw", column = "guest_pw"),
    @Result(property = "title", column = "title"),
    @Result(property = "content", column = "content"),
    @Result(property = "viewCount", column = "view_count"),
    @Result(property = "createdAt", column = "created_at"),
    @Result(property = "updatedAt", column = "updated_at"),
    @Result(property = "authorName", column = "authorName")
  })
  List<CommunityPost> findAllWithSort(@Param("sort") String sort);

  @Select("SELECT post_id, author_id, guest_name, guest_pw, title, content, view_count, created_at, updated_at, guest_name as authorName FROM CommunityPosts WHERE post_id=#{id}")
  @Results({
    @Result(property = "postId", column = "post_id"),
    @Result(property = "authorId", column = "author_id"),
    @Result(property = "guestName", column = "guest_name"),
    @Result(property = "guestPw", column = "guest_pw"),
    @Result(property = "title", column = "title"),
    @Result(property = "content", column = "content"),
    @Result(property = "viewCount", column = "view_count"),
    @Result(property = "createdAt", column = "created_at"),
    @Result(property = "updatedAt", column = "updated_at"),
    @Result(property = "authorName", column = "authorName")
  })
  CommunityPost findById(int id);

  @Insert("INSERT INTO CommunityPosts(author_id,guest_name,guest_pw,title,content) " +
          "VALUES(#{authorId},#{guestName},#{guestPw},#{title},#{content})")
  @Options(useGeneratedKeys=true, keyProperty="postId")
  int insert(CommunityPost p);

  @Update("UPDATE CommunityPosts SET title=#{title},content=#{content},updated_at=CURRENT_TIMESTAMP " +
          "WHERE post_id=#{postId}")
  int update(CommunityPost p);

  @Delete("DELETE FROM CommunityPosts WHERE post_id=#{id}")
  int delete(int id);

  @Update("UPDATE CommunityPosts SET view_count=view_count+1 WHERE post_id=#{id}")
  void incrementView(int id);

  @Select("SELECT post_id, author_id, guest_name, guest_pw, title, content, view_count, created_at, updated_at, guest_name as authorName FROM CommunityPosts WHERE author_id=#{authorId} ORDER BY created_at DESC")
  @Results({
    @Result(property = "postId", column = "post_id"),
    @Result(property = "authorId", column = "author_id"),
    @Result(property = "guestName", column = "guest_name"),
    @Result(property = "guestPw", column = "guest_pw"),
    @Result(property = "title", column = "title"),
    @Result(property = "content", column = "content"),
    @Result(property = "viewCount", column = "view_count"),
    @Result(property = "createdAt", column = "created_at"),
    @Result(property = "updatedAt", column = "updated_at"),
    @Result(property = "authorName", column = "authorName")
  })
  List<CommunityPost> findByAuthorId(Integer authorId);

  @Select("SELECT post_id, author_id, guest_name, guest_pw, title, content, view_count, created_at, updated_at, guest_name as authorName FROM CommunityPosts ORDER BY created_at DESC LIMIT #{limit}")
  @Results({
    @Result(property = "postId", column = "post_id"),
    @Result(property = "authorId", column = "author_id"),
    @Result(property = "guestName", column = "guest_name"),
    @Result(property = "guestPw", column = "guest_pw"),
    @Result(property = "title", column = "title"),
    @Result(property = "content", column = "content"),
    @Result(property = "viewCount", column = "view_count"),
    @Result(property = "createdAt", column = "created_at"),
    @Result(property = "updatedAt", column = "updated_at"),
    @Result(property = "authorName", column = "authorName")
  })
  List<CommunityPost> findRecentPosts(int limit);

  // 페이지네이션과 정렬을 지원하는 커뮤니티 게시글 목록 조회
  @Select("<script>" +
          "SELECT post_id, author_id, guest_name, guest_pw, title, content, view_count, created_at, updated_at, guest_name as authorName " +
          "FROM CommunityPosts " +
          "ORDER BY " +
          "<choose>" +
          "<when test='sort == \"oldest\"'>created_at ASC</when>" +
          "<when test='sort == \"views\"'>view_count DESC, created_at DESC</when>" +
          "<otherwise>created_at DESC</otherwise>" +
          "</choose>" +
          " LIMIT #{limit} OFFSET #{offset}" +
          "</script>")
  @Results({
    @Result(property = "postId", column = "post_id"),
    @Result(property = "authorId", column = "author_id"),
    @Result(property = "guestName", column = "guest_name"),
    @Result(property = "guestPw", column = "guest_pw"),
    @Result(property = "title", column = "title"),
    @Result(property = "content", column = "content"),
    @Result(property = "viewCount", column = "view_count"),
    @Result(property = "createdAt", column = "created_at"),
    @Result(property = "updatedAt", column = "updated_at"),
    @Result(property = "authorName", column = "authorName")
  })
  List<CommunityPost> findAllWithSortAndPagination(@Param("sort") String sort, @Param("limit") int limit, @Param("offset") int offset);

  // 전체 게시글 개수 조회
  @Select("SELECT COUNT(*) FROM CommunityPosts")
  int getTotalCount();

  // 검색과 정렬, 페이지네이션을 지원하는 커뮤니티 게시글 목록 조회
  @Select("<script>" +
          "SELECT post_id, author_id, guest_name, guest_pw, title, content, view_count, created_at, updated_at, guest_name as authorName " +
          "FROM CommunityPosts " +
          "WHERE (title LIKE CONCAT('%', #{keyword}, '%') OR guest_name LIKE CONCAT('%', #{keyword}, '%')) " +
          "ORDER BY " +
          "<choose>" +
          "<when test='sort == \"oldest\"'>created_at ASC</when>" +
          "<when test='sort == \"views\"'>view_count DESC, created_at DESC</when>" +
          "<otherwise>created_at DESC</otherwise>" +
          "</choose>" +
          " LIMIT #{limit} OFFSET #{offset}" +
          "</script>")
  @Results({
    @Result(property = "postId", column = "post_id"),
    @Result(property = "authorId", column = "author_id"),
    @Result(property = "guestName", column = "guest_name"),
    @Result(property = "guestPw", column = "guest_pw"),
    @Result(property = "title", column = "title"),
    @Result(property = "content", column = "content"),
    @Result(property = "viewCount", column = "view_count"),
    @Result(property = "createdAt", column = "created_at"),
    @Result(property = "updatedAt", column = "updated_at"),
    @Result(property = "authorName", column = "authorName")
  })
  List<CommunityPost> searchWithSortAndPagination(@Param("keyword") String keyword, @Param("sort") String sort, @Param("limit") int limit, @Param("offset") int offset);

  // 검색 결과 개수 조회
  @Select("SELECT COUNT(*) FROM CommunityPosts WHERE (title LIKE CONCAT('%', #{keyword}, '%') OR guest_name LIKE CONCAT('%', #{keyword}, '%'))")
  int getSearchCount(@Param("keyword") String keyword);
}
