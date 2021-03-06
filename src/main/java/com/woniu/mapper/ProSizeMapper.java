package com.woniu.mapper;

import com.woniu.entity.ProSize;
import com.woniu.entity.ProSizeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProSizeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_size
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int countByExample(ProSizeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_size
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int deleteByExample(ProSizeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_size
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insert(ProSize record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_size
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insertSelective(ProSize record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_size
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    List<ProSize> selectByExample(ProSizeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_size
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExampleSelective(@Param("record") ProSize record, @Param("example") ProSizeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_size
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExample(@Param("record") ProSize record, @Param("example") ProSizeExample example);
}