package com.woniu.mapper;

import com.woniu.entity.ProHistory;
import com.woniu.entity.ProHistoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProHistoryMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int countByExample(ProHistoryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int deleteByExample(ProHistoryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int deleteByPrimaryKey(Integer proHisid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insert(ProHistory record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insertSelective(ProHistory record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    List<ProHistory> selectByExampleWithBLOBs(ProHistoryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    List<ProHistory> selectByExample(ProHistoryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    ProHistory selectByPrimaryKey(Integer proHisid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExampleSelective(@Param("record") ProHistory record, @Param("example") ProHistoryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExampleWithBLOBs(@Param("record") ProHistory record, @Param("example") ProHistoryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExample(@Param("record") ProHistory record, @Param("example") ProHistoryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByPrimaryKeySelective(ProHistory record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByPrimaryKeyWithBLOBs(ProHistory record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pro_history
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByPrimaryKey(ProHistory record);
}