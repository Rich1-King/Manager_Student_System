package com.homework.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by rich1 on 6/14/16.
 */
@Entity
@Table(name = "Course")
public class CourseModel{
    @Id
    private int id;

    private String course;
    private String classroom;
    private String time;
    private String teacher;
    private int people;

    public void setId(int id)
    {
        this.id = id;
    }
    public void setCourse(String course)
    {
        this.course = course;
    }
    public void setClassroom(String classroom)
    {
        this.classroom = classroom;
    }
    public void setTime(String time)
    {
        this.time = time;
    }
    public void setTeacher(String teacher)
    {
        this.teacher = teacher;
    }
    public void setPeople(int people) { this.people = people; }

    public int getId()
    {
        return this.id;
    }
    public String getCourse()
    {
        return this.course;
    }
    public String getClassroom(){ return this.classroom; }
    public String getTime(){ return this.time; }
    public String getTeacher(){ return this.teacher; }
    public int getPeople(){ return this.people; }

}
