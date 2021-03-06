package com.woniu.entity;

import java.io.Serializable;

public class Tree implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private boolean open=true;
	
    public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	/**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tree.tid
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    private Integer tid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tree.name
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tree.file
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    private String file;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tree.pid
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    private String pid;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tree.tid
     *
     * @return the value of tree.tid
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    public Integer getTid() {
        return tid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tree.tid
     *
     * @param tid the value for tree.tid
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    public void setTid(Integer tid) {
        this.tid = tid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tree.name
     *
     * @return the value of tree.name
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tree.name
     *
     * @param name the value for tree.name
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tree.file
     *
     * @return the value of tree.file
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    public String getFile() {
        return file;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tree.file
     *
     * @param file the value for tree.file
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    public void setFile(String file) {
        this.file = file;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tree.pid
     *
     * @return the value of tree.pid
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    public String getPid() {
        return pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tree.pid
     *
     * @param pid the value for tree.pid
     *
     * @mbggenerated Sat Aug 24 15:45:22 CST 2019
     */
    public void setPid(String pid) {
        this.pid = pid;
    }
}