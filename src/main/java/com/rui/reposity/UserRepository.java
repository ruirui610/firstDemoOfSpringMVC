package com.rui.reposity;

import com.rui.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by root on 16-8-7.
 */

public interface UserRepository extends JpaRepository<UserEntity,Integer>{
    @Modifying //说明该方法是修改操作
    @Transactional  //说明该方法是事务性操作
    //定义查询
    //@param注解用于提取参数
    @Query("update UserEntity us set us.nickname=:qnickname,us.firstname=:qfirstname,us.lastname=:qLastName,us.password=:qPassword where us.iduser=:qId")
    void updateUser(@Param("qnickname")String nickname,@Param("qfirstname")String firstname,
                           @Param("qLastName")String lastname,@Param("qPassword")String password,@Param("qId")Integer id);
}
