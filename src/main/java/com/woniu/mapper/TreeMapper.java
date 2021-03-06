package com.woniu.mapper;

import com.woniu.entity.Tree;
import com.woniu.entity.TreeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TreeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tree
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    int countByExample(TreeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tree
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    int deleteByExample(TreeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tree
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    int deleteByPrimaryKey(Integer tid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tree
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    int insert(Tree record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tree
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    int insertSelective(Tree record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tree
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    List<Tree> selectByExample(TreeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tree
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    Tree selectByPrimaryKey(Integer tid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tree
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    int updateByExampleSelective(@Param("record") Tree record, @Param("example") TreeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tree
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    int updateByExample(@Param("record") Tree record, @Param("example") TreeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tree
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    int updateByPrimaryKeySelective(Tree record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tree
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    int updateByPrimaryKey(Tree record);
}