package com.woniu.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Product {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.pid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Integer pid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.p_name
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private String pName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.tid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Integer tid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.sid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Integer sid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.stock
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Integer stock;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.photo
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private String photo;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.bid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Integer bid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.p_describe
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private String pDescribe;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.p_size
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private String pSize;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.total_sales
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Integer totalSales;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.p_origin
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private String pOrigin;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.p_weight
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private BigDecimal pWeight;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.opening_price
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private BigDecimal openingPrice;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.selling_price
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private BigDecimal sellingPrice;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.assessor_id
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Integer assessorId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.isAudit
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Integer isaudit;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.audittime
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Date audittime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.p_status
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Integer pStatus;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.pinyin
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private String pinyin;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.keyword
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private String keyword;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.isdelete
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Integer isdelete;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.p_details
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private String pDetails;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.pid
     *
     * @return the value of product.pid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Integer getPid() {
        return pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.pid
     *
     * @param pid the value for product.pid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setPid(Integer pid) {
        this.pid = pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.p_name
     *
     * @return the value of product.p_name
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public String getpName() {
        return pName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.p_name
     *
     * @param pName the value for product.p_name
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setpName(String pName) {
        this.pName = pName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.tid
     *
     * @return the value of product.tid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Integer getTid() {
        return tid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.tid
     *
     * @param tid the value for product.tid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setTid(Integer tid) {
        this.tid = tid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.sid
     *
     * @return the value of product.sid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Integer getSid() {
        return sid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.sid
     *
     * @param sid the value for product.sid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setSid(Integer sid) {
        this.sid = sid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.stock
     *
     * @return the value of product.stock
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Integer getStock() {
        return stock;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.stock
     *
     * @param stock the value for product.stock
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setStock(Integer stock) {
        this.stock = stock;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.photo
     *
     * @return the value of product.photo
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public String getPhoto() {
        return photo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.photo
     *
     * @param photo the value for product.photo
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setPhoto(String photo) {
        this.photo = photo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.bid
     *
     * @return the value of product.bid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Integer getBid() {
        return bid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.bid
     *
     * @param bid the value for product.bid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setBid(Integer bid) {
        this.bid = bid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.p_describe
     *
     * @return the value of product.p_describe
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public String getpDescribe() {
        return pDescribe;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.p_describe
     *
     * @param pDescribe the value for product.p_describe
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setpDescribe(String pDescribe) {
        this.pDescribe = pDescribe;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.p_size
     *
     * @return the value of product.p_size
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public String getpSize() {
        return pSize;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.p_size
     *
     * @param pSize the value for product.p_size
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setpSize(String pSize) {
        this.pSize = pSize;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.total_sales
     *
     * @return the value of product.total_sales
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Integer getTotalSales() {
        return totalSales;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.total_sales
     *
     * @param totalSales the value for product.total_sales
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setTotalSales(Integer totalSales) {
        this.totalSales = totalSales;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.p_origin
     *
     * @return the value of product.p_origin
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public String getpOrigin() {
        return pOrigin;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.p_origin
     *
     * @param pOrigin the value for product.p_origin
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setpOrigin(String pOrigin) {
        this.pOrigin = pOrigin;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.p_weight
     *
     * @return the value of product.p_weight
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public BigDecimal getpWeight() {
        return pWeight;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.p_weight
     *
     * @param pWeight the value for product.p_weight
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setpWeight(BigDecimal pWeight) {
        this.pWeight = pWeight;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.opening_price
     *
     * @return the value of product.opening_price
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public BigDecimal getOpeningPrice() {
        return openingPrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.opening_price
     *
     * @param openingPrice the value for product.opening_price
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setOpeningPrice(BigDecimal openingPrice) {
        this.openingPrice = openingPrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.selling_price
     *
     * @return the value of product.selling_price
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public BigDecimal getSellingPrice() {
        return sellingPrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.selling_price
     *
     * @param sellingPrice the value for product.selling_price
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setSellingPrice(BigDecimal sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.assessor_id
     *
     * @return the value of product.assessor_id
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Integer getAssessorId() {
        return assessorId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.assessor_id
     *
     * @param assessorId the value for product.assessor_id
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setAssessorId(Integer assessorId) {
        this.assessorId = assessorId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.isAudit
     *
     * @return the value of product.isAudit
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Integer getIsaudit() {
        return isaudit;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.isAudit
     *
     * @param isaudit the value for product.isAudit
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setIsaudit(Integer isaudit) {
        this.isaudit = isaudit;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.audittime
     *
     * @return the value of product.audittime
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Date getAudittime() {
        return audittime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.audittime
     *
     * @param audittime the value for product.audittime
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setAudittime(Date audittime) {
        this.audittime = audittime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.p_status
     *
     * @return the value of product.p_status
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Integer getpStatus() {
        return pStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.p_status
     *
     * @param pStatus the value for product.p_status
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setpStatus(Integer pStatus) {
        this.pStatus = pStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.pinyin
     *
     * @return the value of product.pinyin
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public String getPinyin() {
        return pinyin;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.pinyin
     *
     * @param pinyin the value for product.pinyin
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.keyword
     *
     * @return the value of product.keyword
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public String getKeyword() {
        return keyword;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.keyword
     *
     * @param keyword the value for product.keyword
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.isdelete
     *
     * @return the value of product.isdelete
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Integer getIsdelete() {
        return isdelete;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.isdelete
     *
     * @param isdelete the value for product.isdelete
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setIsdelete(Integer isdelete) {
        this.isdelete = isdelete;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.p_details
     *
     * @return the value of product.p_details
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public String getpDetails() {
        return pDetails;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.p_details
     *
     * @param pDetails the value for product.p_details
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setpDetails(String pDetails) {
        this.pDetails = pDetails;
    }
}