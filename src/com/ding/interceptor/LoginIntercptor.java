package com.ding.interceptor;

import com.ding.entity.Admin;
import com.ding.entity.Doctor;
import com.ding.entity.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import javax.print.Doc;
import java.util.Map;

/**
 * Created by Administrator on 2019/9/5 0005.
 */
public class LoginIntercptor extends MethodFilterInterceptor{

    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        Map<String,Object> session= ActionContext.getContext().getSession();
        Object object=session.get("user");
        Object object1=session.get("doctor");
        Object object2=session.get("admin");
        if(object==null&&object1==null&&object2==null) {
            return "toLogin";
        }else{
            return actionInvocation.invoke();
        }
    }
}
