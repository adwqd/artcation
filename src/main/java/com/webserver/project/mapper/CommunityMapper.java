package com.webserver.project.mapper;

import com.webserver.project.model.CommunityPost;
import java.util.List;
import org.apache.ibatis.annotations.*;

@Mapper
public interface CommunityMapper {
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
}
