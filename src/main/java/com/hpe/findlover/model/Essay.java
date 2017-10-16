package com.hpe.findlover.model;

import java.util.Date;
import javax.persistence.*;

public class Essay {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "writer_id")
    private Integer writerId;

    private String title;

    private String filename;

    @Column(name = "pub_time")
    private Date pubTime;

    /**
     * 0：下架，1：审核通过，2：待审核
     */
    private Integer status;

    @Column(name = "admin_id")
    private Integer adminId;

    @Column(name = "like_count")
    private Integer likeCount;

    @Column(name = "visit_count")
    private Integer visitCount;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return writer_id
     */
    public Integer getWriterId() {
        return writerId;
    }

    /**
     * @param writerId
     */
    public void setWriterId(Integer writerId) {
        this.writerId = writerId;
    }

    /**
     * @return title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return filename
     */
    public String getFilename() {
        return filename;
    }

    /**
     * @param filename
     */
    public void setFilename(String filename) {
        this.filename = filename;
    }

    /**
     * @return pub_time
     */
    public Date getPubTime() {
        return pubTime;
    }

    /**
     * @param pubTime
     */
    public void setPubTime(Date pubTime) {
        this.pubTime = pubTime;
    }

    /**
     * 获取0：下架，1：审核通过，2：待审核
     *
     * @return status - 0：下架，1：审核通过，2：待审核
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置0：下架，1：审核通过，2：待审核
     *
     * @param status 0：下架，1：审核通过，2：待审核
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * @return admin_id
     */
    public Integer getAdminId() {
        return adminId;
    }

    /**
     * @param adminId
     */
    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    /**
     * @return like_count
     */
    public Integer getLikeCount() {
        return likeCount;
    }

    /**
     * @param likeCount
     */
    public void setLikeCount(Integer likeCount) {
        this.likeCount = likeCount;
    }

    /**
     * @return visit_count
     */
    public Integer getVisitCount() {
        return visitCount;
    }

    /**
     * @param visitCount
     */
    public void setVisitCount(Integer visitCount) {
        this.visitCount = visitCount;
    }
}