package com.webserver.project.mapper;

import com.webserver.project.model.Comment;
import java.util.List;

import org.apache.ibatis.annotations.*;

@Mapper
public interface CommentMapper {
  @Select("SELECT c.comment_id as commentId, c.post_type as postType, c.post_id as postId, " +
          "c.author_id as authorId, c.guest_name as guestName, c.guest_pw as guestPw, " +
          "c.content, c.like_count as likeCount, c.created_at as createdAt, " +
          "CASE WHEN c.author_id IS NOT NULL THEN u.display_name ELSE c.guest_name END as authorName " +
          "FROM Comments c " +
          "LEFT JOIN Users u ON c.author_id = u.user_id " +
          "WHERE c.post_type='community' AND c.post_id=#{postId} " +
          "ORDER BY c.created_at")
  List<Comment> findByPost(int postId);

  @Select("SELECT c.comment_id as commentId, c.post_type as postType, c.post_id as postId, " +
          "c.author_id as authorId, c.guest_name as guestName, c.guest_pw as guestPw, " +
          "c.content, c.like_count as likeCount, c.created_at as createdAt, " +
          "CASE WHEN c.author_id IS NOT NULL THEN u.display_name ELSE c.guest_name END as authorName " +
          "FROM Comments c " +
          "LEFT JOIN Users u ON c.author_id = u.user_id " +
          "WHERE c.post_type='artist' AND c.post_id=#{postId} " +
          "ORDER BY c.created_at")
  List<Comment> findByArtistPost(int postId);

  @Select("SELECT comment_id as commentId, post_type as postType, post_id as postId, " +
          "author_id as authorId, guest_name as guestName, guest_pw as guestPw, " +
          "content, like_count as likeCount, created_at as createdAt " +
          "FROM Comments WHERE comment_id=#{commentId}")
  Comment findById(int commentId);

  @Insert("INSERT INTO Comments(post_type,post_id,author_id,guest_name,guest_pw,content) " +
          "VALUES(#{postType},#{postId},#{authorId},#{guestName},#{guestPw},#{content})")
  @Options(useGeneratedKeys=true, keyProperty="commentId")
  int insert(Comment c);

  @Update("UPDATE Comments SET content=#{content} WHERE comment_id=#{commentId}")
  int update(Comment c);

  @Delete("DELETE FROM Comments WHERE comment_id=#{commentId}")
  int delete(int commentId);

  @Update("UPDATE Comments SET like_count = like_count + 1 WHERE comment_id=#{commentId}")
  void increaseLikeCount(int commentId);

  @Update("UPDATE Comments SET like_count = like_count - 1 WHERE comment_id=#{commentId}")
  void decreaseLikeCount(int commentId);
}
