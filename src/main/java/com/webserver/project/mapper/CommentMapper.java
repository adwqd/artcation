package com.webserver.project.mapper;

import com.webserver.project.model.Comment;
import java.util.List;
import org.apache.ibatis.annotations.*;

@Mapper
public interface CommentMapper {
  @Select("SELECT * FROM Comments WHERE post_type='community' AND post_id=#{postId} ORDER BY created_at")
  List<Comment> findByPost(int postId);

  @Insert("INSERT INTO Comments(post_type,post_id,author_id,guest_name,guest_pw,content) "
        + "VALUES('community',#{postId},#{authorId},#{guestName},#{guestPw},#{content})")
  @Options(useGeneratedKeys=true, keyProperty="commentId")
  int insert(Comment c);
}
