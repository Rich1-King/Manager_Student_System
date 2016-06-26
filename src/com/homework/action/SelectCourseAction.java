package com.homework.action;

import com.database.HibernateControl;
import com.homework.model.CourseModel;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;

/**
 * Created by rich1 on 6/15/16.
 */
public class SelectCourseAction{

    private List id;
    private List course;
    private List classroom;
    private List time;
    private List teacher;

    public void setId(List id)
    {
        this.id = id;
    }
    public void setCourse(List course)
    {
        this.course = course;
    }
    public void setClassroom(List classroom)
    {
        this.classroom = classroom;
    }
    public void setTime(List time)
    {
        this.time = time;
    }
    public void setTeacher(List teacher)
    {
        this.teacher = teacher;
    }

    public List getId()
    {
        return this.id;
    }
    public List getCourse()
    {
        return this.course;
    }
    public List getClassroom(){ return this.classroom; }
    public List getTime(){ return this.time; }
    public List getTeacher(){ return this.teacher; }

    public String execute()
    {

        List listId = new ArrayList();
        List listCourse = new ArrayList();
        List listClassroom = new ArrayList();
        List listTime = new ArrayList();
        List listTeacher = new ArrayList();

        HibernateControl hibernateControl = HibernateControl.getInstance();
        Session session = hibernateControl.getSession();
        List list =  session.createQuery("select model from CourseModel model")
                .list();
        hibernateControl.execute();
        hibernateControl.close();

        for(Object obj : list)
        {

            CourseModel course = (CourseModel) obj;
            listId.add(course.getId());
            listCourse.add(course.getCourse());
            listClassroom.add(course.getClassroom());
            listTime.add(course.getTime());
            listTeacher.add(course.getTeacher());
        }
        setId(listId);
        setCourse(listCourse);
        setClassroom(listClassroom);
        setTeacher(listTeacher);
        setTime(listTime);

        return SUCCESS;
    }

    public String getUserCourse()
    {
        List listCourse = new ArrayList();
        List listClassroom = new ArrayList();
        List listTime = new ArrayList();
        List listTeacher = new ArrayList();

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession httpSession = request.getSession();
        String studentId = httpSession.getAttribute("studentId").toString();

        HibernateControl hibernateControl = HibernateControl.getInstance();
        Session session = hibernateControl.getSession();
        setId(session.createQuery("select this.courseId from UserCourse this" +
                " " +
                "where " +
                 "studentId" +
                " = " + studentId).list());
        hibernateControl.execute();
        hibernateControl.close();
        for(Object i : getId())
        {
            session = hibernateControl.getSession();
            CourseModel course = (CourseModel) session.get(CourseModel.class,
                    Integer
                .parseInt(i
                .toString()));
            hibernateControl.execute();
            hibernateControl.close();

            listCourse.add(course.getCourse());
            listClassroom.add(course.getClassroom());
            listTime.add(course.getTime());
            listTeacher.add(course.getTeacher());
        }
        setCourse(listCourse);
        setClassroom(listClassroom);
        setTeacher(listTeacher);
        setTime(listTime);
        return SUCCESS;
    }
}
