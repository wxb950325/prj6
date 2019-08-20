package com.woniu.mapper;

import com.woniu.entity.UserRoleExample;
import com.woniu.entity.UserRoleKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserRoleMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_role
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int countByExample(UserRoleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_role
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int deleteByExample(UserRoleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_role
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int deleteByPrimaryKey(UserRoleKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_role
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insert(UserRoleKey record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_role
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insertSelective(UserRoleKey record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_role
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    List<UserRoleKey> selectByExample(UserRoleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_role
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExampleSelective(@Param("record") UserRoleKey record, @Param("example") UserRoleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_role
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExample(@Param("record") UserRoleKey record, @Param("example") UserRoleExample example);
}