package com.qf.account.pojo;
//        idint(11) NOT NULL用户编号
//        usernamevarchar(12) NULL用户名
//        passwordvarchar(12) NULL密码
//        issellerint(1) NULL0表示买家1表示卖家
//        emailvarchar(50) NULL邮箱
//        nicknamevarchar(50) NULL昵称
//        phone
public class User {
    private Integer id;
    private String username;
    private String password;
    private Integer isSeller;
    private String email;
    private String nickanme;
    private String phone;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getIsSeller() {
        return isSeller;
    }

    public void setIsSeller(Integer isSeller) {
        this.isSeller = isSeller;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickanme() {
        return nickanme;
    }

    public void setNickanme(String nickanme) {
        this.nickanme = nickanme;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
