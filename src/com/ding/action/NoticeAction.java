package com.ding.action;

import com.ding.entity.Notice;
import com.ding.service.NoticeService;
import com.ding.service.impl.NoticeServiceImpl;
import com.ding.utils.Time;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Administrator on 2019/9/14 0014.
 */
public class NoticeAction extends ActionSupport implements ModelDriven<Notice>{
    Notice notice=new Notice();
    Time time=new Time();

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    private NoticeService ns;

    public void setNs(NoticeService ns) {
        this.ns = ns;
    }

    public String list() throws Exception {
        HttpServletResponse response=ServletActionContext.getResponse();
        List<Notice> list= ns.getAll();
        Gson gson=new Gson();
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().print(gson.toJson(list));
        return null;
    }
    public String showById() throws Exception{


        int id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
        List<Notice> list=ns.getById(id);
        ActionContext.getContext().put("notice",list);
        return "toShow";
    }

    public String adminGetList() throws Exception{
        List<Notice> list=ns.adGetAll();
        ActionContext.getContext().put("articleList",list);
        return "adminGetList";
    }
    public String add() throws Exception{
        HttpServletRequest request=ServletActionContext.getRequest();
        String biaoti=request.getParameter("biaoti");
        String neirong=request.getParameter("neirong");
        notice.setBiaoti(biaoti);
        notice.setNeirong(neirong);
        notice.setTime(time.getDay());
        notice.setState(0);
        ns.save(notice);
        return null;
    }

    public String delete() throws Exception{
        HttpServletRequest request=ServletActionContext.getRequest();
        int id=Integer.parseInt(request.getParameter("id"));
        ns.delete(id);
        return null;
    }

    public String stop() throws Exception{
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpServletResponse response=ServletActionContext.getResponse();
        int id=Integer.parseInt(request.getParameter("id"));
        int i=ns.stop(id);
        response.getWriter().print(i);
        return null;
    }

    public String start() throws Exception{
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpServletResponse response=ServletActionContext.getResponse();
        int id=Integer.parseInt(request.getParameter("id"));
        int i=ns.start(id);
        response.getWriter().print(i);
        return null;
    }

    public String adminGetNoticeCount() throws Exception{
        HttpServletResponse response=ServletActionContext.getResponse();
        int count=ns.getCount();
        response.getWriter().print(count);
        return null;
    }

    public String adminToEditPage() throws Exception{
        Notice n=  ns.getNoticeById(notice.getId());
        ActionContext.getContext().put("article",n);
        return "goToUpdataPage";
    }

    public String edit() throws Exception{
        notice.setTime(time.getDay());
        notice.setState(0);
        ns.update(notice);
        return null;
    }

    @Override
    public Notice getModel() {
        return notice;
    }
}
