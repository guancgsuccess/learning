package com.rush.dao;

import com.rush.entity.LoginBean;
import com.rush.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * UserDAO继承基类
 */
@Repository
public interface UserDAO extends MyBatisBaseDao<User, Integer> {
    String selectPasswordByPhone(String userPhone);
    User selectUserByPhone(String userPhone);
    int updatePasswordByPhone(User user);
    List<User> selectAllUsers();
    User selectByPhoneAndPwd(LoginBean loginBean);
    String selectUserNameByUserId(Integer userId);
    int selectPhone(String phone);

   /* *//**
     * 查看该手机号码是否存在
     * @param phone 手机号码
     * @return 用户
     *//*
    User selectUserByPhone(String phone);*/

    /**
     * 查看该邮箱是否存在
     * @param email 邮箱
     * @return 用户
     */
    User selectUserByEmail(String email);

    /**
     * 根据邮箱和密码查询用户
     * @param email 邮箱
     * @param password 密码
     * @return 用户
     */
    User selectUserByEmailAndPwd(@Param("email") String email, @Param("password") String password);

    /**
     * 根据手机号和密码查询用户
     * @param phone 手机号码
     * @param password 密码
     * @return 用户
     */
    User selectUserByPhoneAndPwd(@Param("phone") String phone, @Param("password") String password);

    User selectUserByUserIdAndPwd(@Param("userId") Integer userId,@Param("password") String password);

    String selectUserNameByPrimaryKey(Integer userId);
}