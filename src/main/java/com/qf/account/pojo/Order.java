package com.qf.account.pojo;

/**
 * Created by wujiaqin on 2018/10/18.
 */
/*
   `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `oqty` int(11) DEFAULT NULL COMMENT '订单数量',
  `uid` int(11) DEFAULT NULL COMMENT '买家id',
  `pid` int(11) DEFAULT NULL COMMENT '商品id',
  `ispaid` int(1) DEFAULT NULL COMMENT '0未支付1已支付',
*/
public class Order {

    private Integer oid;
    private Integer oqty;
    private Integer uid;
    private Integer pid;
    private Integer ispaid;

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getOqty() {
        return oqty;
    }

    public void setOqty(Integer oqty) {
        this.oqty = oqty;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getIspaid() {
        return ispaid;
    }

    public void setIspaid(Integer ispaid) {
        this.ispaid = ispaid;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oid=" + oid +
                ", oqty=" + oqty +
                ", uid=" + uid +
                ", pid=" + pid +
                ", ispaid=" + ispaid +
                '}';
    }
}
