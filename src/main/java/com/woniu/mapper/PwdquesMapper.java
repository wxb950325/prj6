package com.woniu.mapper;

import com.woniu.entity.Pwdques;
import com.woniu.entity.PwdquesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PwdquesMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int countByExample(PwdquesExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int deleteByExample(PwdquesExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int deleteByPrimaryKey(Integer pwdquesid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insert(Pwdques record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insertSelective(Pwdques record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    List<Pwdques> selectByExampleWithBLOBs(PwdquesExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    List<Pwdques> selectByExample(PwdquesExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    Pwdques selectByPrimaryKey(Integer pwdquesid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExampleSelective(@Param("record") Pwdques record, @Param("example") PwdquesExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExampleWithBLOBs(@Param("record") Pwdques record, @Param("example") PwdquesExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExample(@Param("record") Pwdques record, @Param("example") PwdquesExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByPrimaryKeySelective(Pwdques record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByPrimaryKeyWithBLOBs(Pwdques record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pwdques
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByPrimaryKey(Pwdques record);
}