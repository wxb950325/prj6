package com.woniu.mapper;

import com.woniu.entity.ProdType;
import com.woniu.entity.ProdTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface ProdTypeMapper {
	void deleteBatch(Integer[] tids);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table prod_type
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int countByExample(ProdTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table prod_type
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int deleteByExample(ProdTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table prod_type
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int deleteByPrimaryKey(Integer tid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table prod_type
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insert(ProdType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table prod_type
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insertSelective(ProdType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table prod_type
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    List<ProdType> selectByExample(ProdTypeExample example,RowBounds rb);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table prod_type
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    ProdType selectByPrimaryKey(Integer tid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table prod_type
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExampleSelective(@Param("record") ProdType record, @Param("example") ProdTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table prod_type
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExample(@Param("record") ProdType record, @Param("example") ProdTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table prod_type
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByPrimaryKeySelective(ProdType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table prod_type
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByPrimaryKey(ProdType record);
}