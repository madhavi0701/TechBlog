
package com.tech.blog.entities;

import java.sql.Timestamp;

public class User {
    private int id;
    private String name;
    private String email;
    private String pass;
    private String gender;
    private String about;
    private String profile;
    private Timestamp datetime;

    public User(int id, String name, String email, String pass, String gender, String about, Timestamp datetime) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.pass = pass;
        this.gender = gender;
        this.about = about;
        this.datetime = datetime;
    }

    public User() {
    }

    public User(String name, String email, String pass, String gender, String about) {
        this.name = name;
        this.email = email;
        this.pass = pass;
        this.gender = gender;
        this.about = about;
        
    }
    
//    getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
}
