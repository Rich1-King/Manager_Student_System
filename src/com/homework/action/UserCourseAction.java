package com.homework.action;

import com.database.HibernateControl;
import com.homework.model.CourseModel;
import com.homework.model.UserCourse;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;

/**
 * Created by rich1 on 6/20/16.
 */
public class UserCourseAction{
    private String nums;
    private String studentId;
    private int courseId;
    private String course;
    private String tip;

    public void setNums(String nums)
    {
        this.nums = nums;
    }
    public void setStudentId(String studentId)
    {
        this.studentId = studentId;
    }
    public void setCourseId(int courseId)
    {
        this.courseId = courseId;
    }
    public void setCourse(String course)
    {
        this.course = course;
    }
    public String getNums()
    {
        return this.nums;
    }
    public String getStudentId()
    {
        return this.studentId;
    }
    public int getCourseId()
    {
        return this.courseId;
    }
    public String getCourse()
    {
        return this.course;
    }
    public void setTip(String tip)
    {
        this.tip = tip;
    }
    public String getTip()
    {
        return this.tip;
    }

    public String execute()
    {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession httpSession = request.getSession();
        setStudentId(httpSession.getAttribute("studentId").toString());

        HibernateControl hibernateControl = HibernateControl.getInstance();
        Session session = hibernateControl.getSession();
        List cId = session.createQuery("select this.courseId from " +
                "UserCourse " +
            "this " +
                "where " +
                "this.studentId = " + getStudentId()).list();
        hibernateControl.execute();
        hibernateControl.close();

        if(cId != null)
        {
            for (Object o : cId)
            {
                session = hibernateControl.getSession();
                CourseModel course = (CourseModel) session.get(CourseModel.class,Integer
                    .parseInt(o.toString
                        ()));
                course.setPeople(course.getPeople()-1);
                session.saveOrUpdate(course);
                hibernateControl.execute();
                hibernateControl.close();
            }
        }

        session = hibernateControl.getSession();
        session.createQuery("delete UserCourse this where this.studentId" +
                " = " + getStudentId()).executeUpdate();
        hibernateControl.execute();
        hibernateControl.close();


        String[] strNums = getNums().split(",");

       for(String i : strNums)
       {
           try
           {
               session = hibernateControl.getSession();
               UserCourse userCourse = new UserCourse();
               CourseModel course = (CourseModel)session.get(CourseModel.class,
                       Integer.parseInt(i));
               userCourse.setStudentId(getStudentId());
               userCourse.setCourse(course.getCourse());
               userCourse.setCourseId(Integer.parseInt(i));
               session.saveOrUpdate(userCourse);
               hibernateControl.execute();
               hibernateControl.close();

               session = hibernateControl.getSession();
               course.setPeople(course.getPeople()+1);
               session.saveOrUpdate(course);
               hibernateControl.execute();
               hibernateControl.close();

           }
           catch (Exception e)
           {
               System.out.println("已经存在"+e);
           }

       }
        setTip("选课成功");

        return SUCCESS;
    }
}
