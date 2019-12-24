package com.ding.action;

import com.ding.entity.Admin;
import com.ding.service.AdminService;
import com.ding.service.RoleService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/10/23 0023.
 */
public class AdminAction extends ActionSupport implements ModelDriven<Admin>{
    private Admin admin=new Admin();
    private AdminService as;
    private RoleService roleService;

    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    public void setAs(AdminService as) {

        this.as = as;
    }
    public String adminLogin() throws Exception {
        Admin ad=as.findByNameAndPw(admin);
        if(ad==null){
            HttpServletResponse response= ServletActionContext.getResponse();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("<script>alert('用户名或密码错误');window.location.href='/Hospital/login.jsp';</script>");
            return null;
        }else{
            if(ad.getState()!=0){
                return "lock";
            }else{
                ActionContext.getContext().getSession().put("admin",ad);
                return "adminLogin";
            }
        }
    }

    public String list() throws Exception{
        List<Admin> adminList = as.getList();
        ActionContext.getContext().put("adminList",adminList);
        return "adminList";
    }

    public String stop() throws Exception{
        int i= as.stop(admin.getUserId());
        return null;
    }

    public String start() throws Exception{
        int i=as.start(admin.getUserId());
        return null;
    }

    public String goToUpdate() throws Exception{
        Admin admin1=as.getAdminById(admin.getUserId());
        ActionContext.getContext().put("admin",admin1);
        return "toUpdatePage";
    }

    public String add() throws Exception{
        admin.setRole(roleService.getById(admin.getRole_id()));
        as.add(admin);
        return null;
    }

    public String del() throws Exception{
        as.deleteById(admin.getUserId());
        return null;
    }

    public String update() throws Exception{
        admin.setRole(roleService.getById(admin.getRole_id()));
        as.update(admin);
        return null;
    }

    public String updatePw() throws Exception{
        Admin ad= (Admin) ActionContext.getContext().getSession().get("admin");
        admin.setUserId(ad.getUserId());
        as.updatePw(admin);
        return null;
    }

    public String logout() throws Exception{
        ActionContext.getContext().getSession().remove("admin");
        HttpServletResponse response=ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println("<script>alert('确定退出？');window.location.href='/Hospital/index.jsp';</script>");
        return null;
    }

    @Override
    public Admin getModel() {
        return admin;
    }
}
