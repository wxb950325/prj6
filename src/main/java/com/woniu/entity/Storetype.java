package com.woniu.entity;

public class Storetype {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column storetype.tid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Integer tid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column storetype.tname
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private String tname;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column storetype.parent_tid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Integer parentTid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column storetype.isdelete
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private Integer isdelete;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column storetype.note
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    private String note;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column storetype.tid
     *
     * @return the value of storetype.tid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Integer getTid() {
        return tid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column storetype.tid
     *
     * @param tid the value for storetype.tid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setTid(Integer tid) {
        this.tid = tid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column storetype.tname
     *
     * @return the value of storetype.tname
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public String getTname() {
        return tname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column storetype.tname
     *
     * @param tname the value for storetype.tname
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setTname(String tname) {
        this.tname = tname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column storetype.parent_tid
     *
     * @return the value of storetype.parent_tid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Integer getParentTid() {
        return parentTid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column storetype.parent_tid
     *
     * @param parentTid the value for storetype.parent_tid
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setParentTid(Integer parentTid) {
        this.parentTid = parentTid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column storetype.isdelete
     *
     * @return the value of storetype.isdelete
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public Integer getIsdelete() {
        return isdelete;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column storetype.isdelete
     *
     * @param isdelete the value for storetype.isdelete
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setIsdelete(Integer isdelete) {
        this.isdelete = isdelete;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column storetype.note
     *
     * @return the value of storetype.note
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public String getNote() {
        return note;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column storetype.note
     *
     * @param note the value for storetype.note
     *
     * @mbggenerated Tue Aug 20 16:07:27 CST 2019
     */
    public void setNote(String note) {
        this.note = note;
    }

	@Override
	public String toString() {
		return "Storetype [tid=" + tid + ", tname=" + tname + ", parentTid=" + parentTid + ", isdelete=" + isdelete
				+ ", note=" + note + "]";
	}
    
    
}