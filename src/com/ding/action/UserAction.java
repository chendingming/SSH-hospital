package com.ding.action;

import com.ding.entity.User;
import com.ding.service.UserService;
import com.ding.utils.SendMail;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2019/9/4 0004.
 */
public class UserAction extends ActionSupport implements ModelDriven<User>{

    private User user = new User();

    private UserService us ;

    public void setUs(UserService us) {
        this.us = us;
    }

    public String login() throws Exception {
        //1 调用Service执行登陆逻辑
        User u = us.getUserByPassword(user);
        //2 将返回的User对象放入session域
        ActionContext.getContext().getSession().put("user", u);
        //3 重定向到项目首页
        return "toHome";
    }



    public String add() throws Exception{

        us.save(user);
        return "toLogin";
    }

    public String logOut() throws Exception{
        ActionContext.getContext().getSession().remove("user");
        return "logOut";
    }

    public String adminGetCount()throws Exception{
        HttpServletResponse response = ServletActionContext.getResponse();
        int i=us.getCount();
        response.getWriter().print(i);
        return null;
    }

    public String findPassword() throws Exception{
        HttpServletResponse response=ServletActionContext.getResponse();
        String email=user.getUser_email();
        SendMail sendMail=new SendMail();
        User u=us.getByEmail(email);
        response.setContentType("text/html;charset=utf-8");
        if(u!=null){
            sendMail.sendMail(email,"医院预约系统提醒您，您的密码为："+u.getUser_pw());
            response.getWriter().print("<script>alert('恭喜，找回密码成功');window.location.href='login.jsp'</script>");
        }else {
            response.getWriter().println("<script>alert('该邮箱尚未注册！请重新输入');window.location.href='findPassword.jsp'</script>");
        }
        return null;
    }

    public String update() throws Exception{
        HttpServletResponse response=ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        us.update(user);
        response.getWriter().println("<script>alert('修改成功');window.location.href='UserAction_logOut'</script>");
        return null;
    }


    @Override
    public User getModel() {
        return user;
    }
}
