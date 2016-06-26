package com.homework.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by rich1 on 6/19/16.
 */
@Entity
@Table(name = "user")
public class User{
    @Id
    private String studentId;
    private String password;

    public void setStudentId(String studentId)
    {
        this.studentId = studentId;
    }
    public String getStudentId()
    {
        return this.studentId;
    }
    public void setPassword(String password)
    {
        this.password = password;
    }
    public String getPassword()
    {
        return this.password;
    }


}
