package com.webserver.project.mapper;

import com.webserver.project.model.CommunityPost;
import java.util.List;
import org.apache.ibatis.annotations.*;

@Mapper
public interface CommunityMapper {
  @Select("SELECT * FROM CommunityPosts ORDER BY created_at DESC")
  List<CommunityPost> findAll();

  @Select("SELECT * FROM CommunityPosts WHERE post_id=#{id}")
  CommunityPost findById(int id);

  @Insert("INSERT INTO CommunityPosts(author_id,guest_name,guest_pw,title,content) "
        + "VALUES(#{authorId},#{guestName},#{guestPw},#{title},#{content})")
  @Options(useGeneratedKeys=true, keyProperty="postId")
  int insert(CommunityPost p);

  @Update("UPDATE CommunityPosts SET title=#{title},content=#{content} WHERE post_id=#{postId}")
  int update(CommunityPost p);

  @Delete("DELETE FROM CommunityPosts WHERE post_id=#{id}")
  int delete(int id);

  @Update("UPDATE CommunityPosts SET view_count=view_count+1 WHERE post_id=#{id}")
  void incrementView(int id);
}
