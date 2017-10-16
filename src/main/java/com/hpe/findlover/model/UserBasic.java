package com.hpe.findlover.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "user_basic")
public class UserBasic {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String email;

    private String password;

    private String nickname;

    private String tel;

    private String sex;

    private Date birthday;

    private String photo;

    @Column(name = "marry_status")
    private String marryStatus;

    private Integer height;

    private String sexual;

    private String education;

    private String workplace;

    private Double salary;

    @Column(name = "live_condition")
    private Integer liveCondition;

    /**
     * 个人资料可见性（0：所有用户不可见，1：所有用户可见，2：仅我关注的人可见）
     */
    private Integer authority;

    /**
     * 账户状态（0：锁定，1：激活，2：未激活）
     */
    private Integer status;

    /**
     * 用户激活码
     */
    private String code;

    @Column(name = "reg_time")
    private Date regTime;

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
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return nickname
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * @param nickname
     */
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    /**
     * @return tel
     */
    public String getTel() {
        return tel;
    }

    /**
     * @param tel
     */
    public void setTel(String tel) {
        this.tel = tel;
    }

    /**
     * @return sex
     */
    public String getSex() {
        return sex;
    }

    /**
     * @param sex
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * @return birthday
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * @param birthday
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * @return photo
     */
    public String getPhoto() {
        return photo;
    }

    /**
     * @param photo
     */
    public void setPhoto(String photo) {
        this.photo = photo;
    }

    /**
     * @return marry_status
     */
    public String getMarryStatus() {
        return marryStatus;
    }

    /**
     * @param marryStatus
     */
    public void setMarryStatus(String marryStatus) {
        this.marryStatus = marryStatus;
    }

    /**
     * @return height
     */
    public Integer getHeight() {
        return height;
    }

    /**
     * @param height
     */
    public void setHeight(Integer height) {
        this.height = height;
    }

    /**
     * @return sexual
     */
    public String getSexual() {
        return sexual;
    }

    /**
     * @param sexual
     */
    public void setSexual(String sexual) {
        this.sexual = sexual;
    }

    /**
     * @return education
     */
    public String getEducation() {
        return education;
    }

    /**
     * @param education
     */
    public void setEducation(String education) {
        this.education = education;
    }

    /**
     * @return workplace
     */
    public String getWorkplace() {
        return workplace;
    }

    /**
     * @param workplace
     */
    public void setWorkplace(String workplace) {
        this.workplace = workplace;
    }

    /**
     * @return salary
     */
    public Double getSalary() {
        return salary;
    }

    /**
     * @param salary
     */
    public void setSalary(Double salary) {
        this.salary = salary;
    }

    /**
     * @return live_condition
     */
    public Integer getLiveCondition() {
        return liveCondition;
    }

    /**
     * @param liveCondition
     */
    public void setLiveCondition(Integer liveCondition) {
        this.liveCondition = liveCondition;
    }

    /**
     * 获取个人资料可见性（0：所有用户不可见，1：所有用户可见，2：仅我关注的人可见）
     *
     * @return authority - 个人资料可见性（0：所有用户不可见，1：所有用户可见，2：仅我关注的人可见）
     */
    public Integer getAuthority() {
        return authority;
    }

    /**
     * 设置个人资料可见性（0：所有用户不可见，1：所有用户可见，2：仅我关注的人可见）
     *
     * @param authority 个人资料可见性（0：所有用户不可见，1：所有用户可见，2：仅我关注的人可见）
     */
    public void setAuthority(Integer authority) {
        this.authority = authority;
    }

    /**
     * 获取账户状态（0：锁定，1：激活，2：未激活）
     *
     * @return status - 账户状态（0：锁定，1：激活，2：未激活）
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置账户状态（0：锁定，1：激活，2：未激活）
     *
     * @param status 账户状态（0：锁定，1：激活，2：未激活）
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取用户激活码
     *
     * @return code - 用户激活码
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置用户激活码
     *
     * @param code 用户激活码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * @return reg_time
     */
    public Date getRegTime() {
        return regTime;
    }

    /**
     * @param regTime
     */
    public void setRegTime(Date regTime) {
        this.regTime = regTime;
    }

    @Override
    public String toString() {
        return "UserBasic{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", tel='" + tel + '\'' +
                ", sex='" + sex + '\'' +
                ", birthday=" + birthday +
                ", photo='" + photo + '\'' +
                ", marryStatus='" + marryStatus + '\'' +
                ", height=" + height +
                ", sexual='" + sexual + '\'' +
                ", education='" + education + '\'' +
                ", workplace='" + workplace + '\'' +
                ", salary=" + salary +
                ", liveCondition=" + liveCondition +
                ", authority=" + authority +
                ", status=" + status +
                ", code='" + code + '\'' +
                ", regTime=" + regTime +
                '}';
    }
}