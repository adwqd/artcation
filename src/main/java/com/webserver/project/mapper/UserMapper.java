package com.webserver.project.mapper;

import com.webserver.project.model.User;
import java.util.List;
import org.apache.ibatis.annotations.*;

@Mapper
public interface UserMapper {
  @Select("SELECT user_id as userId, username, password, display_name as displayName, role, created_at as createdAt FROM Users WHERE username=#{username}")
  User findByUsername(String username);

  @Select("SELECT user_id as userId, username, password, display_name as displayName, role, created_at as createdAt FROM Users WHERE user_id=#{userId}")
  User findById(Integer userId);

  @Select("SELECT user_id as userId, username, password, display_name as displayName, role, created_at as createdAt FROM Users WHERE role='artist' ORDER BY created_at DESC")
  List<User> findAllArtists();

  @Select("SELECT user_id as userId, username, password, display_name as displayName, role, created_at as createdAt FROM Users ORDER BY created_at DESC")
  List<User> findAll();

  @Insert("INSERT INTO Users(username,password,display_name,role) " +
          "VALUES(#{username},#{password},#{displayName},#{role})")
  @Options(useGeneratedKeys=true, keyProperty="userId")
  int insert(User user);

  @Update("UPDATE Users SET password=#{password}, display_name=#{displayName}, role=#{role} " +
          "WHERE user_id=#{userId}")
  int update(User user);

  @Delete("DELETE FROM Users WHERE user_id=#{userId}")
  int delete(Integer userId);
}
