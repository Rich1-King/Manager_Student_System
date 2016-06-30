package com.homework.action;

import com.database.HibernateControl;
import com.homework.model.InformationModel;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;

/**
 * Created by rich1 on 6/13/16.
 */
public class InformationAction{

    private String name;
    private String studentId;
    private int age;
    private String sex;
    private String major;
    private String course;
    private String phone;
    private String address;
    private String tip;

    public void setName(String name){
        this.name = name;
    }

    public void setStudentId(String studentId){
        this.studentId = studentId;
    }

    public void setAge(int age){
        this.age = age;
    }

    public void setSex(String sex){
        this.sex = sex;
    }

    public void setMajor(String major){
        this.major = major;
    }

    public void setCourse(String course){
        this.course = course;
    }

    public void setPhone(String phone){
        this.phone = phone;
    }

    public void setAddress(String address){
        this.address = address;
    }

    public void setTip(String tip) { this.tip =
            tip; }

    public String getName(){
        return name;
    }

    public String getStudentId(){
        return studentId;
    }

    public int getAge(){
        return age;
    }

    public String getSex(){
        return sex;
    }

    public String getMajor(){
        return major;
    }

    public String getCourse(){
        return course;
    }

    public String getPhone(){
        return phone;
    }

    public String getAddress(){
        return address;
    }

    public String getTip() { return this.tip; }



    public String execute() throws ClassNotFoundException{
        HibernateControl hibernateControl = HibernateControl.getInstance();
        Session sess = hibernateControl.getSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        List users = sess.createQuery("select model from " +
                "InformationModel model where studentId = " + session
                .getAttribute("studentId"))
                .list();
        hibernateControl.execute();
        hibernateControl.close();

        for(Object o : users)
        {
            InformationModel user = (InformationModel)o;
            setName(user.getName());
            setCourse(user.getCourse());
            setSex(user.getSex());
            setAge(user.getAge());
            setAddress(user.getAddress());
            setMajor(user.getMajor());
            setPhone(user.getPhone());
            setStudentId(user.getStudentId());
        }
        return SUCCESS;
    }

    public String saveInf() throws UnsupportedEncodingException
    {
        System.out.println("第一次提交");
        HibernateControl hibernateControl = HibernateControl.getInstance();
        Session session = hibernateControl.getSession();
        InformationModel model = (InformationModel)session.get
           (InformationModel.class,1);

        model.setName(getName());
        model.setStudentId(getStudentId());
        model.setCourse(getCourse());
        model.setPhone(getPhone());
        model.setAge(getAge());
        model.setSex(getSex());
        model.setAddress(getAddress());
        model.setMajor(getMajor());

        session.update(model);
        hibernateControl.execute();
        hibernateControl.close();

        setTip("保存成功");
        return SUCCESS;
    }

}
