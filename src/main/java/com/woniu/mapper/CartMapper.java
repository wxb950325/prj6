package com.woniu.mapper;

import com.woniu.entity.Cart;
import com.woniu.entity.CartExample;
import com.woniu.entity.Product;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CartMapper {
	
	List<Cart> findAll();
	
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cart
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int countByExample(CartExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cart
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int deleteByExample(CartExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cart
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int deleteByPrimaryKey(Integer cid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cart
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insert(Cart record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cart
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int insertSelective(Cart record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cart
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    List<Cart> selectByExample(CartExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cart
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    Cart selectByPrimaryKey(Integer cid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cart
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExampleSelective(@Param("record") Cart record, @Param("example") CartExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cart
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByExample(@Param("record") Cart record, @Param("example") CartExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cart
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByPrimaryKeySelective(Cart record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cart
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    int updateByPrimaryKey(Cart record);
}