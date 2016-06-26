package com.homework.model;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by rich1 on 6/13/16.
 */

@Entity
@Table(name="student_information")
public class InformationModel{
    @Id
    private int id;
    private String name;
    private String studentId;
    private int age;
    private String sex;
    private String major;
    private String course;
    private String phone;
    private String address;
    private int power;

    public void setId(int id){ this.id = id; }

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

    public void setPower(int limit) { this.power = limit; }

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

    public int getId(){ return this.id; }

    public int getPower() { return power; }

}
