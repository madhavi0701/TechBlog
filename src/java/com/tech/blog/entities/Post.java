
package com.tech.blog.entities;

import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class Post {
    private int pid;
    private String title;
    private String content;
    private String code;
    private String pic;
    private Timestamp date;
    private int catId;

    public Post(String title, String content, String code, Timestamp date, int catId, int userId) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.date = date;
        this.catId = catId;
        this.userId = userId;
    }
    private int userId;

    public Post(int pid, String title, String content, String code, String pic, Timestamp date, int catId,int userId) {
        this.pid = pid;
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.date = date;
        this.catId = catId;
        this.userId = userId;
    }

    public Post() {
    }

    public Post(String title, String content, String code, String pic, Timestamp date, int catId,int userId) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.date = date;
        this.catId = catId;
        this.userId = userId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }
    
}
