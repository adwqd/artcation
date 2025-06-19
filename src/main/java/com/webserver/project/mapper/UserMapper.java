package com.webserver.project.mapper;

import com.webserver.project.model.User;
import org.apache.ibatis.annotations.*;

@Mapper
public interface UserMapper {
  @Select("SELECT * FROM Users WHERE username=#{username}")
  User findByUsername(String username);

  @Insert("INSERT INTO Users(username,password,display_name,role) "
        + "VALUES(#{username},#{password},#{displayName},#{role})")
  @Options(useGeneratedKeys=true, keyProperty="userId")
  int insert(User user);
}
