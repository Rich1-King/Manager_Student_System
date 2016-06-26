package com.homework.action;

import com.database.HibernateControl;
import com.homework.model.User;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static com.opensymphony.xwork2.Action.SUCCESS;

/**
 * Created by rich1 on 6/19/16.
 */
public class UserAction{

    private String studentId;
    private String password;
    private String tip;
    private boolean bool;

    public void setStudentId(String studentId)
    {
        this.studentId = studentId;
    }
    public String getStudentId()
    {
        return this.studentId;
    }
    public void setTip(String tip)
    {
        this.tip = tip;
    }
    public void setPassword(String password)
    {
        this.password = password;
    }
    public String getPassword()
    {
        return this.password;
    }
    public String getTip()
    {
        return this.tip;
    }

    private void setBool(boolean bool)
    {
        this.bool = bool;
    }
    public boolean getBool()
    {
        return this.bool;
    }

    public String execute()
    {
        HibernateControl hibernateControl = HibernateControl.getInstance();
        Session session = hibernateControl.getSession();
        try{
            User user = (User) session.get(User.class,getStudentId());

            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession httpSession = request.getSession();

            if (user.getPassword().equals(getPassword())){
                setBool(true);
                httpSession.setAttribute("studentId",getStudentId());
            }else{
                setBool(false);
            }

            hibernateControl.execute();
            hibernateControl.close();
            setTip("密码错误!");
        }
        catch (Exception e)
        {
           System.out.println("学生号或密码错误!");
            setTip("学生号或密码错误!");
        }
        return SUCCESS;
    }
}
