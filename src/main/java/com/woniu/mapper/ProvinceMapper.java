package com.woniu.mapper;

import com.woniu.entity.Province;
import com.woniu.entity.ProvinceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProvinceMapper {
	
	String selectByName(String pname);
	
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table province
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int countByExample(ProvinceExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table province
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int deleteByExample(ProvinceExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table province
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int deleteByPrimaryKey(String pid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table province
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insert(Province record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table province
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insertSelective(Province record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table province
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    List<Province> selectByExample(ProvinceExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table province
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    Province selectByPrimaryKey(String pid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table province
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExampleSelective(@Param("record") Province record, @Param("example") ProvinceExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table province
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExample(@Param("record") Province record, @Param("example") ProvinceExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table province
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByPrimaryKeySelective(Province record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table province
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByPrimaryKey(Province record);
}