package com.qf.products.pojo;

import org.springframework.web.multipart.MultipartFile;

public class Products {

   /**
    pidint(11) NOT NULL商品id
    ptitlevarchar(50) NULL商品标题
    pimgsvarchar(50) NULL商品图片
    ppricedouble NULL商品价格
    pqtyint(11) NULL商品数量
    pdesctext NULL商品描述
    uidint(11) NULL卖家id
    cidint(11) N
     */
   private  Integer pid;
   private  String ptitle;
   private  String pimgs;
   private  Double  pprice;
   private  Integer pqty;
   private  String  pdesc;
   private Integer uid;
   private Integer cid;


    public Products() {
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPimgs() {
        return pimgs;
    }

    public void setPimgs(String pimgs) {
        this.pimgs = pimgs;
    }

    public Double getPprice() {
        return pprice;
    }

    public void setPprice(Double pprice) {
        this.pprice = pprice;
    }

    public Integer getPqty() {
        return pqty;
    }

    public void setPqty(Integer pqty) {
        this.pqty = pqty;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }
}
