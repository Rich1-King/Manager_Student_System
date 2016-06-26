package com.homework.model;

import javax.persistence.*;

/**
 * Created by rich1 on 6/20/16.
 */
@Entity
@Table(name="userCourse")
public class UserCourse{
    @Id
    private int id;
    private String studentId;
    private String course;
    private int courseId;

    public void setStudentId(String studentId)
    {
        this.studentId = studentId;
    }
    public void setId(int idd)
    {
        this.id = id;
    }
    public void setCourse(String course)
    {
        this.course = course;
    }
    public void setCourseId(int courseId) { this.courseId = courseId; }
    public String getStudentId()
    {
        return this.studentId;
    }
    public int getId()
    {
        return this.id;
    }
    public int getCourseId(){ return this.courseId; }
    public String getCourse()
    {
        return this.course;
    }

}
