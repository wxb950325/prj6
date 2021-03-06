package com.woniu.entity;

import java.util.ArrayList;
import java.util.List;

public class StoreprodtypeExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public StoreprodtypeExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andSptidIsNull() {
            addCriterion("sptid is null");
            return (Criteria) this;
        }

        public Criteria andSptidIsNotNull() {
            addCriterion("sptid is not null");
            return (Criteria) this;
        }

        public Criteria andSptidEqualTo(Integer value) {
            addCriterion("sptid =", value, "sptid");
            return (Criteria) this;
        }

        public Criteria andSptidNotEqualTo(Integer value) {
            addCriterion("sptid <>", value, "sptid");
            return (Criteria) this;
        }

        public Criteria andSptidGreaterThan(Integer value) {
            addCriterion("sptid >", value, "sptid");
            return (Criteria) this;
        }

        public Criteria andSptidGreaterThanOrEqualTo(Integer value) {
            addCriterion("sptid >=", value, "sptid");
            return (Criteria) this;
        }

        public Criteria andSptidLessThan(Integer value) {
            addCriterion("sptid <", value, "sptid");
            return (Criteria) this;
        }

        public Criteria andSptidLessThanOrEqualTo(Integer value) {
            addCriterion("sptid <=", value, "sptid");
            return (Criteria) this;
        }

        public Criteria andSptidIn(List<Integer> values) {
            addCriterion("sptid in", values, "sptid");
            return (Criteria) this;
        }

        public Criteria andSptidNotIn(List<Integer> values) {
            addCriterion("sptid not in", values, "sptid");
            return (Criteria) this;
        }

        public Criteria andSptidBetween(Integer value1, Integer value2) {
            addCriterion("sptid between", value1, value2, "sptid");
            return (Criteria) this;
        }

        public Criteria andSptidNotBetween(Integer value1, Integer value2) {
            addCriterion("sptid not between", value1, value2, "sptid");
            return (Criteria) this;
        }

        public Criteria andSptnameIsNull() {
            addCriterion("sptname is null");
            return (Criteria) this;
        }

        public Criteria andSptnameIsNotNull() {
            addCriterion("sptname is not null");
            return (Criteria) this;
        }

        public Criteria andSptnameEqualTo(String value) {
            addCriterion("sptname =", value, "sptname");
            return (Criteria) this;
        }

        public Criteria andSptnameNotEqualTo(String value) {
            addCriterion("sptname <>", value, "sptname");
            return (Criteria) this;
        }

        public Criteria andSptnameGreaterThan(String value) {
            addCriterion("sptname >", value, "sptname");
            return (Criteria) this;
        }

        public Criteria andSptnameGreaterThanOrEqualTo(String value) {
            addCriterion("sptname >=", value, "sptname");
            return (Criteria) this;
        }

        public Criteria andSptnameLessThan(String value) {
            addCriterion("sptname <", value, "sptname");
            return (Criteria) this;
        }

        public Criteria andSptnameLessThanOrEqualTo(String value) {
            addCriterion("sptname <=", value, "sptname");
            return (Criteria) this;
        }

        public Criteria andSptnameLike(String value) {
            addCriterion("sptname like", value, "sptname");
            return (Criteria) this;
        }

        public Criteria andSptnameNotLike(String value) {
            addCriterion("sptname not like", value, "sptname");
            return (Criteria) this;
        }

        public Criteria andSptnameIn(List<String> values) {
            addCriterion("sptname in", values, "sptname");
            return (Criteria) this;
        }

        public Criteria andSptnameNotIn(List<String> values) {
            addCriterion("sptname not in", values, "sptname");
            return (Criteria) this;
        }

        public Criteria andSptnameBetween(String value1, String value2) {
            addCriterion("sptname between", value1, value2, "sptname");
            return (Criteria) this;
        }

        public Criteria andSptnameNotBetween(String value1, String value2) {
            addCriterion("sptname not between", value1, value2, "sptname");
            return (Criteria) this;
        }

        public Criteria andSidIsNull() {
            addCriterion("sid is null");
            return (Criteria) this;
        }

        public Criteria andSidIsNotNull() {
            addCriterion("sid is not null");
            return (Criteria) this;
        }

        public Criteria andSidEqualTo(Integer value) {
            addCriterion("sid =", value, "sid");
            return (Criteria) this;
        }

        public Criteria andSidNotEqualTo(Integer value) {
            addCriterion("sid <>", value, "sid");
            return (Criteria) this;
        }

        public Criteria andSidGreaterThan(Integer value) {
            addCriterion("sid >", value, "sid");
            return (Criteria) this;
        }

        public Criteria andSidGreaterThanOrEqualTo(Integer value) {
            addCriterion("sid >=", value, "sid");
            return (Criteria) this;
        }

        public Criteria andSidLessThan(Integer value) {
            addCriterion("sid <", value, "sid");
            return (Criteria) this;
        }

        public Criteria andSidLessThanOrEqualTo(Integer value) {
            addCriterion("sid <=", value, "sid");
            return (Criteria) this;
        }

        public Criteria andSidIn(List<Integer> values) {
            addCriterion("sid in", values, "sid");
            return (Criteria) this;
        }

        public Criteria andSidNotIn(List<Integer> values) {
            addCriterion("sid not in", values, "sid");
            return (Criteria) this;
        }

        public Criteria andSidBetween(Integer value1, Integer value2) {
            addCriterion("sid between", value1, value2, "sid");
            return (Criteria) this;
        }

        public Criteria andSidNotBetween(Integer value1, Integer value2) {
            addCriterion("sid not between", value1, value2, "sid");
            return (Criteria) this;
        }

        public Criteria andParentTidIsNull() {
            addCriterion("parent_tid is null");
            return (Criteria) this;
        }

        public Criteria andParentTidIsNotNull() {
            addCriterion("parent_tid is not null");
            return (Criteria) this;
        }

        public Criteria andParentTidEqualTo(Integer value) {
            addCriterion("parent_tid =", value, "parentTid");
            return (Criteria) this;
        }

        public Criteria andParentTidNotEqualTo(Integer value) {
            addCriterion("parent_tid <>", value, "parentTid");
            return (Criteria) this;
        }

        public Criteria andParentTidGreaterThan(Integer value) {
            addCriterion("parent_tid >", value, "parentTid");
            return (Criteria) this;
        }

        public Criteria andParentTidGreaterThanOrEqualTo(Integer value) {
            addCriterion("parent_tid >=", value, "parentTid");
            return (Criteria) this;
        }

        public Criteria andParentTidLessThan(Integer value) {
            addCriterion("parent_tid <", value, "parentTid");
            return (Criteria) this;
        }

        public Criteria andParentTidLessThanOrEqualTo(Integer value) {
            addCriterion("parent_tid <=", value, "parentTid");
            return (Criteria) this;
        }

        public Criteria andParentTidIn(List<Integer> values) {
            addCriterion("parent_tid in", values, "parentTid");
            return (Criteria) this;
        }

        public Criteria andParentTidNotIn(List<Integer> values) {
            addCriterion("parent_tid not in", values, "parentTid");
            return (Criteria) this;
        }

        public Criteria andParentTidBetween(Integer value1, Integer value2) {
            addCriterion("parent_tid between", value1, value2, "parentTid");
            return (Criteria) this;
        }

        public Criteria andParentTidNotBetween(Integer value1, Integer value2) {
            addCriterion("parent_tid not between", value1, value2, "parentTid");
            return (Criteria) this;
        }

        public Criteria andPhotoIsNull() {
            addCriterion("photo is null");
            return (Criteria) this;
        }

        public Criteria andPhotoIsNotNull() {
            addCriterion("photo is not null");
            return (Criteria) this;
        }

        public Criteria andPhotoEqualTo(String value) {
            addCriterion("photo =", value, "photo");
            return (Criteria) this;
        }

        public Criteria andPhotoNotEqualTo(String value) {
            addCriterion("photo <>", value, "photo");
            return (Criteria) this;
        }

        public Criteria andPhotoGreaterThan(String value) {
            addCriterion("photo >", value, "photo");
            return (Criteria) this;
        }

        public Criteria andPhotoGreaterThanOrEqualTo(String value) {
            addCriterion("photo >=", value, "photo");
            return (Criteria) this;
        }

        public Criteria andPhotoLessThan(String value) {
            addCriterion("photo <", value, "photo");
            return (Criteria) this;
        }

        public Criteria andPhotoLessThanOrEqualTo(String value) {
            addCriterion("photo <=", value, "photo");
            return (Criteria) this;
        }

        public Criteria andPhotoLike(String value) {
            addCriterion("photo like", value, "photo");
            return (Criteria) this;
        }

        public Criteria andPhotoNotLike(String value) {
            addCriterion("photo not like", value, "photo");
            return (Criteria) this;
        }

        public Criteria andPhotoIn(List<String> values) {
            addCriterion("photo in", values, "photo");
            return (Criteria) this;
        }

        public Criteria andPhotoNotIn(List<String> values) {
            addCriterion("photo not in", values, "photo");
            return (Criteria) this;
        }

        public Criteria andPhotoBetween(String value1, String value2) {
            addCriterion("photo between", value1, value2, "photo");
            return (Criteria) this;
        }

        public Criteria andPhotoNotBetween(String value1, String value2) {
            addCriterion("photo not between", value1, value2, "photo");
            return (Criteria) this;
        }

        public Criteria andIsdeleteIsNull() {
            addCriterion("isdelete is null");
            return (Criteria) this;
        }

        public Criteria andIsdeleteIsNotNull() {
            addCriterion("isdelete is not null");
            return (Criteria) this;
        }

        public Criteria andIsdeleteEqualTo(Integer value) {
            addCriterion("isdelete =", value, "isdelete");
            return (Criteria) this;
        }

        public Criteria andIsdeleteNotEqualTo(Integer value) {
            addCriterion("isdelete <>", value, "isdelete");
            return (Criteria) this;
        }

        public Criteria andIsdeleteGreaterThan(Integer value) {
            addCriterion("isdelete >", value, "isdelete");
            return (Criteria) this;
        }

        public Criteria andIsdeleteGreaterThanOrEqualTo(Integer value) {
            addCriterion("isdelete >=", value, "isdelete");
            return (Criteria) this;
        }

        public Criteria andIsdeleteLessThan(Integer value) {
            addCriterion("isdelete <", value, "isdelete");
            return (Criteria) this;
        }

        public Criteria andIsdeleteLessThanOrEqualTo(Integer value) {
            addCriterion("isdelete <=", value, "isdelete");
            return (Criteria) this;
        }

        public Criteria andIsdeleteIn(List<Integer> values) {
            addCriterion("isdelete in", values, "isdelete");
            return (Criteria) this;
        }

        public Criteria andIsdeleteNotIn(List<Integer> values) {
            addCriterion("isdelete not in", values, "isdelete");
            return (Criteria) this;
        }

        public Criteria andIsdeleteBetween(Integer value1, Integer value2) {
            addCriterion("isdelete between", value1, value2, "isdelete");
            return (Criteria) this;
        }

        public Criteria andIsdeleteNotBetween(Integer value1, Integer value2) {
            addCriterion("isdelete not between", value1, value2, "isdelete");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table storeprodtype
     *
     * @mbggenerated do_not_delete_during_merge Tue Aug 20 16:07:27 CST 2019
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table storeprodtype
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}