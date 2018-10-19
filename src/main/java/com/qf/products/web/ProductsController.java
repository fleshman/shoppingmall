package com.qf.products.web;

import com.alibaba.fastjson.JSONObject;
import com.qf.products.pojo.Products;
import com.qf.products.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@Controller

public class ProductsController {

    @Autowired
    private ProductsService ser;

    @RequestMapping("/totable")
    public String run1() {
        return "products";
    }

    @RequestMapping("/toindex")
    public String run2() {
        return "index";
    }


    //分页查询
    @ResponseBody
    @RequestMapping(value = "/jsonObject", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Object dataJson(@RequestBody JSONObject jsonObject) throws Exception {
        jsonObject = ser.findJSON(jsonObject);
        return jsonObject;
    }

    //添加商品

       @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public String  doPut(Products products,@RequestParam MultipartFile img, HttpServletRequest request) throws Exception {
        String savepath = request.getServletContext().getRealPath("picture/"+img.getOriginalFilename());
//        File file = new File("F:/shoppingmall1/src/main/webapp/picture/"+img.getOriginalFilename());

        img.transferTo(new File(savepath));
        String imgpath=("picture/"+img.getOriginalFilename());
        products.setPimgs(imgpath);

        ser.save(products);
        return  "redirect:/totable";
    }

    //修改
    @ResponseBody
    @RequestMapping(value = "/update",method = RequestMethod.PUT)
    public String  dopost(Products products) throws Exception {
        /*String savepath = request.getServletContext().getRealPath("picture/"+img.getOriginalFilename());
        File file = new File("F:/shoppingmall1/src/main/webapp/picture/"+img.getOriginalFilename());

        img.transferTo(file);
        String imgpath=("picture/"+img.getOriginalFilename());
        products.setPimgs(imgpath);
*/
        ser.modify(products);
        return  "success";
    }


    @ResponseBody
    @RequestMapping(value = "/delete/{pid}" ,method = RequestMethod.DELETE)
    public  String delete(@PathVariable("pid") int pid) throws Exception {
        System.out.println(pid);
        Products products =new Products();
        products.setPid(pid);
        ser.remove(products);
        return "success";
    }
    
    //查询所有的商品
    @RequestMapping("/allproducts")
    public  String  alllist(Model model) throws Exception {
        List<Products> list = ser.findAllProducts();
        model.addAttribute("products", list);
        return "allproducts";
    }

    //通过pid查询单个商品
    @RequestMapping("/goproduct")
    public  String  findProduct(Products products,Model model)throws  Exception{
        System.out.println(products.getPid());
        Products pro = ser.findByPid(products);
        model.addAttribute("product", pro);
        return "product";
    }
}