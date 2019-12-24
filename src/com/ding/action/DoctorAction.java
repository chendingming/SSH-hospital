package com.ding.action;

import com.alibaba.fastjson.JSON;
import com.ding.entity.Doctor;
import com.ding.entity.Keshi;
import com.ding.entity.Order;
import com.ding.service.DoctorService;
import com.ding.service.KeshiService;
import com.ding.utils.PageBean;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;


import javax.print.Doc;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2019/9/7 0007.
 */
public class DoctorAction extends ActionSupport implements ModelDriven<Doctor>{

    //分页
    //当前页
    private int currentPage;
    //当前页显示的条数
    private int currentCount;
    //总条数
    private int totalCount;
    //总页数
    private int totalPage;

    private List<Doctor> doctorList;

    public List<Doctor> getDoctorList() {
        return doctorList;
    }

    public void setDoctorList(List<Doctor> doctorList) {
        this.doctorList = doctorList;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getCurrentCount() {
        return currentCount;
    }

    public void setCurrentCount(int currentCount) {
        this.currentCount = currentCount;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    private int keshiId;

    public int getKeshiId() {
        return keshiId;
    }

    public void setKeshiId(int keshiId) {
        this.keshiId = keshiId;
    }


    //科室
    private int keshi_id;
    private String keshi_name;
    private String keshi_del;

    public int getKeshi_id() {
        return keshi_id;
    }

    public void setKeshi_id(int keshi_id) {
        this.keshi_id = keshi_id;
    }

    public String getKeshi_name() {
        return keshi_name;
    }

    public void setKeshi_name(String keshi_name) {
        this.keshi_name = keshi_name;
    }

    public String getKeshi_del() {
        return keshi_del;
    }

    public void setKeshi_del(String keshi_del) {
        this.keshi_del = keshi_del;
    }

    private Doctor doctor=new Doctor();

    private DoctorService ds;
    private KeshiService ks;




//ajax 传值
    private int doctor_id;

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    //图片上传
    private File file;
    private String fileContentType;
    private String fileFileName;

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    //spring
    public void setKs(KeshiService ks) {
        this.ks = ks;
    }

    public void setDs(DoctorService ds) {
        this.ds = ds;
    }



    /*<!-- ------------------   动作   ------------------------>*/

    public String list() throws Exception {




        String currentPageStr = ServletActionContext.getRequest().getParameter("currentPage");
        if(currentPageStr==null) currentPageStr="1";
        int currentPage = Integer.parseInt(currentPageStr);
        int currentCount = 4;

        PageBean<Doctor> pageBean = null;

        pageBean=ds.findPageBean(currentPage,currentCount);

        List<Keshi> keshiList=ks.getAll();
        ActionContext.getContext().put("pageBean",pageBean);
        ActionContext.getContext().put("keshiList",keshiList);
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpSession session=request.getSession();
        request.setAttribute("user_name",session.getAttribute("user_name"));
        return "toList";
    }


//医生登录
    public String docLogin() throws Exception{
        Doctor d=ds.getDoctorByPassword(doctor);
        //2 将返回的User对象放入session域
        if(d.getDoctor_del()!=0){
            return "lock";
        }else{
            ActionContext.getContext().getSession().put("doctor", d);
            return "doc_login";
        }
    }

    public String listd() throws Exception {




        HttpServletRequest request=ServletActionContext.getRequest();
        int keshiId=Integer.parseInt(request.getParameter("keshiId"));
        List<Doctor> list = ds.getByKeshi(keshiId);

        List<Keshi> keshiList=ks.getAll();
        ActionContext.getContext().put("keshiList",keshiList);
        //ServletActionContext.getRequest().setAttribute("list", list);
        HttpSession session=request.getSession();
        request.setAttribute("user_name",session.getAttribute("user_name"));

        ActionContext.getContext().put("doctor", list);


        return "listd";
    }




    /*---------------------------管理员-------------------------------------------*/
    public String adminGetDoctorList() throws Exception {
        List<Doctor> list=ds.getAll();
        ActionContext.getContext().put("doctorlist",list);
        return "admingetdoc";
    }


    public String add() throws Exception{
        if (file!=null){
            String realPath=ServletActionContext.getServletContext().getRealPath("/doctorImage");
            File target=new File(realPath,fileFileName);
            FileUtils.copyFile(file,target);
        }
        doctor.setImage("/Hospital/doctorImage/"+fileFileName);
        doctor.setDoctor_del(0);
        doctor.setKeshi(ks.getById(doctor.getKeshiId()));
        ds.save(doctor);
        ActionContext.getContext().put("message","医生添加成功");
        return "success";
    }

    public String delete() throws Exception{
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpServletResponse response=ServletActionContext.getResponse();
        int doctor_id=Integer.parseInt(request.getParameter("doctor_id"));
        ds.delete(doctor_id);
        response.getWriter().print("success");
        return null;
    }

    public String start() throws Exception{
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpServletResponse response=ServletActionContext.getResponse();
        int doctor_id=Integer.parseInt(request.getParameter("doctor_id"));
        int i=ds.doctorStart(doctor_id,0);
        response.getWriter().print(i);
        return null;
    }

    public String stop() throws Exception{
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpServletResponse response=ServletActionContext.getResponse();
        int doctor_id=Integer.parseInt(request.getParameter("doctor_id"));
        int i=ds.doctorStop(doctor_id,1);
        response.getWriter().print(i);
        return null;
    }

    public String updatePw() throws Exception{
        int i=ds.changePw(doctor);
        HttpServletResponse response=ServletActionContext.getResponse();
        response.getWriter().print(i);
        return null;
    }

    public String adminGetDocCount() throws Exception{
        HttpServletResponse response=ServletActionContext.getResponse();
        int count=ds.getCount();
        response.getWriter().print(count);
        return null;
    }

    public String logout() throws Exception{
        ActionContext.getContext().getSession().remove("doctor");
        HttpServletResponse response=ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println("<script>alert('确定退出？');window.location.href='/Hospital/index.jsp';</script>");
        return null;
    }

    public String findByName() throws Exception{
        HttpServletResponse response=ServletActionContext.getResponse();
        Gson gson=new Gson();
        List<Doctor> list=ds.getByName(doctor.getDoctor_name());
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println(JSON.toJSONString(list));
        return null;
    }

    public String goToEditPage() throws Exception{
        Doctor doctor1=ds.getByDoctorId(doctor.getId());
        ActionContext.getContext().put("doctor",doctor1);
        return "goToUpdate";
    }

    public String update() throws Exception{
        if (file!=null){
            String realPath=ServletActionContext.getServletContext().getRealPath("/doctorImage");
            File target=new File(realPath,fileFileName);
            FileUtils.copyFile(file,target);
            doctor.setImage("/Hospital/doctorImage/"+fileFileName);

        }
        doctor.setDoctor_del(0);
        doctor.setKeshi(ks.getById(doctor.getKeshiId()));
        ds.update(doctor);
        ActionContext.getContext().put("message","医生更新成功");
        return "success";
    }

    public String changePw() throws Exception{
        Doctor doctor1= (Doctor) ActionContext.getContext().getSession().get("doctor");
        int i=ds.updatePw(doctor1.getId(),doctor.getDoctor_pw());

        HttpServletResponse response=ServletActionContext.getResponse();
        response.getWriter().print(i);
        return null;
    }

    @Override
    public Doctor getModel() {
        return doctor;
    }
}
