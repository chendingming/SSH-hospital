package com.ding.action;

import com.ding.entity.Comment;
import com.ding.entity.Doctor;
import com.ding.service.CommentService;
import com.ding.service.DoctorService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2019/11/13 0013.
 */

public class CommentAction extends ActionSupport implements ModelDriven<Comment>{
    private Comment comment=new Comment();
    private CommentService commentService;
    private DoctorService doctorService;

    public void setDoctorService(DoctorService doctorService) {
        this.doctorService = doctorService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    public String add() throws Exception{
        comment.setDoctor(doctorService.getByDoctorId(comment.getDoctor_id()));
        commentService.add(comment);
        return null;
    }

    public String commentList() throws Exception{
        Doctor doctor= (Doctor) ActionContext.getContext().getSession().get("doctor");
        List<Comment> list=commentService.getComment(doctor.getId());
        ActionContext.getContext().put("commentList",list);
        return "docGetCom";
    }

    public String getAllCom() throws Exception{
        List<Comment> list=commentService.getAllCom();
        ActionContext.getContext().put("commentList",list);
        return "allCom";
    }

    public String delCom(){
        commentService.delete(comment.getId());
        return null;
    }

    public String getCount() throws IOException {
        Doctor doctor= (Doctor) ActionContext.getContext().getSession().get("doctor");
        List<Comment> list=commentService.getComment(doctor.getId());
        HttpServletResponse response = ServletActionContext.getResponse();
        response.getWriter().println(list.size());
        return null;
    }
    public String getByDoctorId() throws Exception{
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        List<Comment> list=commentService.getComment(comment.getDoctor_id());
        Gson gson=new Gson();
        response.getWriter().println(gson.toJson(list));
        return null;
    }

    @Override
    public Comment getModel() {
        return comment;
    }
}
