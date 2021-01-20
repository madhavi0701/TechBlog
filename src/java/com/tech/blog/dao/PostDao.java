
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getAllCategories()
    {
        ArrayList<Category> list=new ArrayList();
        try{
            String query ="select * from categories";
            Statement st=con.createStatement();
            ResultSet set=st.executeQuery(query);
            while(set.next())
            {
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Category c=new Category(cid, name, description);
                list.add(c);
                
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return list;
    }
    public boolean savePost(Post p)
    {
        boolean f=false;
        try{
            String q="insert into posts(title,content ,code,catId,userID) values(?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setString(1, p.getTitle());
            pstmt.setString(2, p.getContent());
            pstmt.setString(3, p.getCode());
           
            pstmt.setInt(4, p.getCatId());
            pstmt.setInt(5, p.getUserId());
            
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e){
            
        }
        return f;
    }
    //    get all the posts
    public List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");

            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("title");
                String pContent = set.getString("content");
                String pCode = set.getString("code");
                String pPic = set.getString("pic");
                Timestamp date = set.getTimestamp("date");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post post=new Post(pid,pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        //fetch all post by id
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts where catId=? order by pid desc");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("title");
                String pContent = set.getString("content");
                String pCode = set.getString("code");
                String pPic = set.getString("pic");
                Timestamp date = set.getTimestamp("date");

                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
     public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from posts where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("title");
                String pContent = set.getString("content");
                String pCode = set.getString("code");
                String pPic = set.getString("pic");
                Timestamp date = set.getTimestamp("date");
                int cid=set.getInt("catId");
                int userId = set.getInt("userId");
                post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

}
