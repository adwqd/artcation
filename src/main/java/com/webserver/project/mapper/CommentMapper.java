package com.webserver.project.mapper;

import com.webserver.project.model.Comment;
import java.util.List;

import org.apache.ibatis.annotations.*;

@Mapper
public interface CommentMapper {
  @Select("SELECT * FROM Comments WHERE post_type='community' AND post_id=#{postId} ORDER BY created_at")
  List<Comment> findByPost(int postId);

  @Select("SELECT * FROM Comments WHERE post_type='artist' AND post_id=#{postId} ORDER BY created_at")
  List<Comment> findByArtistPost(int postId);

  @Select("SELECT * FROM Comments WHERE comment_id=#{commentId}")
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
