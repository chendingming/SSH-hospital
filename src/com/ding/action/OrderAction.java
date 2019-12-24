package com.ding.action;

import com.ding.entity.Doctor;
import com.ding.entity.Order;
import com.ding.entity.User;
import com.ding.service.DoctorService;
import com.ding.service.OrderService;
import com.ding.service.UserService;
import com.ding.service.impl.OrderServiceImpl;
import com.ding.service.impl.UserServiceImpl;
import com.ding.utils.NumberState;
import com.ding.utils.OrderSendMail;
import com.ding.utils.SendMail;
import com.ding.utils.Time;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.aspectj.weaver.ast.Or;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/9/19 0019.
 */
public class OrderAction extends ActionSupport implements ModelDriven<Order> {
    Order order=new Order();
    private OrderService os;
    private UserService us;
    private DoctorService doctorService;

    public void setDoctorService(DoctorService doctorService) {
        this.doctorService = doctorService;
    }

    public void setUs(UserService us) {
        this.us = us;
    }

    public void setOs(OrderService os) {
        this.os = os;
    }

    private String doctor_name;
    private String date;
    private int doctor_id;
    private String mon;

    public String getMon() {
        return mon;
    }

    public void setMon(String mon) {
        this.mon = mon;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctor_name = doctor_name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String add() throws Exception {
        int i=os.getTadayCount(order.getDate(),order.getDoctor_id());
        if(i>30){
            return "toFullPage";
        }else{
            User user= (User) ActionContext.getContext().getSession().get("user");
            order.setState(0);
            order.setDoctor(doctorService.getByDoctorId(order.getDoctor_id()));
            order.setUser(us.getUserById(order.getUser_id()));
            os.save(order);
            OrderSendMail sendMail=new OrderSendMail();
            sendMail.sendMail(user.getUser_email(),"医院预约系统提醒您，您已成功预约医生"+order.getDoctor_name()+"请在"+order.getDate()+" "+order.getTime()+"到本漳州市医院就诊");
            HttpServletRequest request=ServletActionContext.getRequest();
            HttpSession session=request.getSession();
            request.setAttribute("user_name",session.getAttribute("user_name"));
            return "toOrderList";
        }
    }

    public String index() throws Exception {
        ActionContext.getContext().put("doctor_name",order.getDoctor_name());
        ActionContext.getContext().put("doctor_id",order.getDoctor_id());
        ActionContext.getContext().put("date",order.getDate());
        ActionContext.getContext().put("time",order.getTime());
        ActionContext.getContext().put("number",order.getNumber());
        return "toOrder";
    }
    public String myOrder() throws Exception {


        User user= (User) ActionContext.getContext().getSession().get("user");
        List<Order> list=os.getByUserId(user.getUser_id());
        ActionContext.getContext().put("orderList",list);
        return "toMyOrder";
    }

    public String deleteOrder() throws Exception{
        os.delete(order.getOrder_id());
        return null;
    }

    public String orderSave()throws Exception{
        HttpServletRequest request=ServletActionContext.getRequest();
        int doctor_id=Integer.parseInt(request.getParameter("doctor_id"));
        Doctor doctor=doctorService.getByDoctorId(doctor_id);
        ActionContext.getContext().put("doctor",doctor);
        return "toAddOrder";
    }


    /*- ---------------Doctor get Info-----------------------*/

    public String doctorGet() throws Exception{
        Doctor doctor= (Doctor) ActionContext.getContext().getSession().get("doctor");
        List<Order> list=os.getByDoctor(doctor.getId());
        ActionContext.getContext().put("orderList",list);
        return "";
    }

    public String doctorGetByDay() throws Exception{
        Doctor doctor= (Doctor) ActionContext.getContext().getSession().get("doctor");
        Time time=new Time();
        String day=time.getDay();
        List<Order> list=os.getByDay(doctor.getId(),day);
        ActionContext.getContext().put("orderList",list);
        return "doctorGetByDay";
    }

    public String end() throws Exception{
        HttpServletResponse response = ServletActionContext.getResponse();
        int i=os.end(order.getOrder_id());
        response.getWriter().print(i);
        return null;
    }

    public String adminGetCount() throws Exception{
        HttpServletResponse response = ServletActionContext.getResponse();
        int i=os.getCount();
        response.getWriter().print(i);
        return null;
    }

    public String getTadayCount()throws Exception{
        Doctor doctor= (Doctor) ActionContext.getContext().getSession().get("doctor");
        Time time=new Time();
        String day=time.getDay();
        int i=os.getTadayCount(day,doctor.getId());
        HttpServletResponse response = ServletActionContext.getResponse();
        response.getWriter().print(i);
        return null;
    }

    public String getAnnual()throws Exception{
        List list=new LinkedList();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        Time time=new Time();
        Map<String,Integer> map1=os.getAnnual(time.getYear()-1);
        Map<String,Integer> map2=os.getAnnual(time.getYear(),time.getMonth());
        list.add(map1);
        list.add(map2);
        Gson gson=new Gson();
        response.getWriter().println(gson.toJson(list));
        return null;
    }

    public String goToSelectTime() throws Exception{
        HttpServletRequest request= ServletActionContext.getRequest();
        String mon=request.getParameter("mon");
        List<NumberState> numberStateList=os.getByDayAndDoctor(order.getDate(),order.getDoctor_id(),mon);
        System.out.println(numberStateList);
        ActionContext.getContext().put("mon",mon);
        ActionContext.getContext().put("doctor_name",order.getDoctor_name());
        ActionContext.getContext().put("date",order.getDate());
        ActionContext.getContext().put("doctor_id",order.getDoctor_id());
        ActionContext.getContext().put("numberStateList",numberStateList);
        return "goToSelectTime";
    }

    public String getByDoctor() throws Exception{
        Doctor doctor1= (Doctor) ActionContext.getContext().getSession().get("doctor");
        List<Order> orderList=os.getByDoctorId(doctor1.getId());
        ActionContext.getContext().put("orderList",orderList);
        return "toOrders";
    }


    @Override
    public Order getModel() {
        return order;
    }
}
