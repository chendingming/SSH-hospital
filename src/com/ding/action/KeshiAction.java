package com.ding.action;

import com.ding.entity.Doctor;
import com.ding.entity.Keshi;
import com.ding.service.KeshiService;
import com.ding.service.impl.KeshiServiceImpl;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2019/9/10 0010.
 */
public class KeshiAction extends ActionSupport implements ModelDriven<Keshi> {
    private Keshi keshi=new Keshi();
    private KeshiService ks;

    public void setKs(KeshiService ks) {
        this.ks = ks;
    }

    public String list() throws Exception {



        List<Keshi> keshiList=ks.getAll();
        ActionContext.getContext().put("keshiList",keshiList);
        return "keshiList";
    }
    public String adminGetList() throws Exception {
        List<Keshi> keshiList=ks.getAll();
        for(int i=0;i<keshiList.size();i++){
            System.out.println(keshiList.get(i).toString());
        }
        System.out.println("end");
        Gson gson=new Gson();
        HttpServletResponse response=ServletActionContext.getResponse();
        String keshi=gson.toJson(keshiList);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println(keshi);
        return null;
    }

    public String getTel() throws Exception{
        List<Keshi> keshiList=ks.getAll();
        Gson gson=new Gson();
        HttpServletResponse response=ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println(gson.toJson(keshiList));
        return null;
    }

    public String adminGetInfo() throws Exception{
        List<Keshi> keshiList=ks.getAll();
        ActionContext.getContext().put("keshiList",keshiList);
        return "adminGetInfo";
    }


    public String add() throws Exception{
        keshi.setKeshi_del("no");
        keshi.setKeshi_doctorNum(0);
        ks.add(keshi);
        return null;
    }

    public String del() throws Exception{
        ks.del(keshi.getKeshi_id());
        return null;
    }

    public String goToUpdatePage()throws Exception{
        Keshi k=ks.getById(keshi.getKeshi_id());
        ActionContext.getContext().put("keshi",k);
        return "goToUpdate";
    }

    public String edit() throws Exception{
        ks.update(keshi);
        return null;
    }

    public String adminGetCount()throws Exception{
        HttpServletResponse response=ServletActionContext.getResponse();
        int i=ks.getCount();
        response.getWriter().print(i);
        return null;
    }

    @Override
    public Keshi getModel() {
        return keshi;
    }
}
