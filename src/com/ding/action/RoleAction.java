package com.ding.action;

import com.ding.entity.Role;
import com.ding.service.RoleService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/11/15 0015.
 */
public class RoleAction extends ActionSupport implements ModelDriven<Role> {
    Role role=new Role();
    RoleService roleService;

    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    public String add() throws Exception{
        roleService.add(role);
        return null;
    }

    public String list() throws Exception{
        List<Role> roles=roleService.getList();
        ActionContext.getContext().put("roleList",roles);
        return "roleList";
    }
    public String del() throws Exception{
        roleService.del(role.getId());
        return null;
    }

    public String selectRole() throws Exception{
        List<Role> roles=roleService.getList();
        HttpServletResponse response=ServletActionContext.getResponse();
        Gson gson=new Gson();
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().print(gson.toJson(roles));
        return null;
    }

    public String toUpdatePage() throws Exception{
        Role role1=roleService.getById(role.getId());
        ActionContext.getContext().put("role",role1);
        return "toUpdatePage";
    }

    public String update() throws Exception{
        roleService.update(role);
        return null;
    }

    @Override
    public Role getModel() {
        return role;
    }
}
