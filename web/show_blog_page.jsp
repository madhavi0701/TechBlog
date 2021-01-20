<%-- 
    Document   : show_blog_page
    Created on : Jan 18, 2021, 10:41:24 PM
    Author     : admin
--%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page  errorPage="error_page.jsp" %>
<%@page import="com.tech.blog.entities.User"%>
<%
    User user = (User) session.getAttribute("current");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<%
    int postId=Integer.parseInt(request.getParameter("post_id"));
  PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);
    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
         <title><%= p.getTitle()%> || TechBlog by Madhavi </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            .post-date{
                font-style: italic;
                
            }
            .post-user-info{
                font-size: 20px;
            }
            .row-user{
                border:px solid #e2e2e2;
                padding-top: 15px;
            }
/*            body{
                background:url(img/bg1.jpg);
                background-size: cover;
                background-attachment: fixed;
            }*/
        </style>
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v9.0" nonce="bCSyKUyW"></script>
    </head>
    <body>
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-star-o"></span> TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"><span class="fa fa-buysellads"></span> Blogs <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-envelope"></span> Contact</a>
                    </li>
<!--                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programing Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>-->
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#postModal"><span class="fa fa-plus-square-o"></span> Do Post</a>
                    </li>


                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#profile-Modal" href="#!"><span class="fa fa-user"></span> <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a>
                    </li>
                </ul>

            </div>
        </nav>

        <!--end of navbar-->
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert text-center <%=m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>
        
        <div class="container">

            <div class="row my-4">

                <div class="col-md-8 offset-md-2">


                    <div class="card">

                        <div class="card-header primary-background text-white">

                            <h4 class="post-title"><%= p.getTitle()%></h4>


                        </div>

                        <div class="card-body">



                            <div class="row my-3 row-user">
                                <div class="col-md-8">
                                    <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>

                                    <p class="post-user-info"> <a href="#!"> <%= ud.getUserByUserId(p.getUserId()).getName()%></a> has posted : </p>
                                </div>

                                <div class="col-md-4">
                                    <p class="post-date"> <%=  DateFormat.getDateTimeInstance().format(p.getDate())%>  </p>
                                </div>
                            </div>


                            <p class="post-content"><%= p.getContent()%></p> 

                            <br>
                            <br>

                            <div class="post-code">
                                <pre><%= p.getCode()%></pre>
                            </div>

                        </div>
                        <div class="card-footer primary-background">


                            <%
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                            %>

                            <a href="#!" onclick="doLike(<%= p.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>
                            <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>



                        </div>
                            <div class="card-footer ">
                                <div class="fb-comments" data-href="http://localhost:9494/TechBlog/show_blog_page.jsp?post_id=<%=p.getPid()%>#!" data-width="" data-numposts="5"></div>
                            </div>



                    </div>


                </div>

            </div>

        </div>
        <!--profile modal-->
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid rounded-circle" style=" max-width: 140px">
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID</th>
                                            <td><%= user.getId()%></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%= user.getEmail()%></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%= user.getGender()%></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Status</th>
                                            <td><%= user.getAbout()%></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Registered On</th>
                                            <td><%= user.getDatetime().toString()%></td>


                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                            <!--profile edit-->
                            <div id="profile-edit" style="display: none">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <th scope="row">ID</th>
                                            <td><%= user.getId()%></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Name</th>
                                            <td><input type="text" class="form-control" name="name" value="<%= user.getName()%>"></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><input type="email" class="form-control" name="email" value="<%= user.getEmail()%>"></td>


                                        </tr>

                                        <tr>
                                            <th scope="row">Password</th>
                                            <td><input type="password" class="form-control" name="password" value="<%= user.getPass()%>"</td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%= user.getGender().toUpperCase()%></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Status</th>
                                            <td><textarea class="form-control" name="about" rows="3"><%= user.getAbout()%>
                                                </textarea></td>


                                        </tr>

                                        <tr>
                                            <th scope="row">New Profile</th>
                                            <td>
                                                <input type="file" name="image" class="form-control">
                                            </td>



                                        </tr>


                                    </table>
                                    <div class="continer">
                                        <button type="submit" class="btn btn-outline-secondary  ">Save</button>
                                    </div>
                                </form>
                            </div>              
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary primary-background btn-outline-light" id="edit-profile-btn">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end profile modal-->

        <!--post modal-->
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group">

                                <select name="cid" class="form-control" id="exampleFormControlSelect1">
                                    <option selected disabled>---Select Category---</option>
                                    <%
                                        d = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = d.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option  value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">

                                <input type="text" class="form-control" id="title" name="title" placeholder="Enter Blog title">
                            </div>
                            <div class="form-group">

                                <textarea class="form-control" name="content" id="content" rows="6" placeholder="Add Content"></textarea>
                            </div>
                            <div class="form-group">

                                <textarea class="form-control" name="code" id="code" rows="6" placeholder="Enter Code(if any)"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Select your pic..</label>
                                <br>
                                <input type="file" name="pic"  >
                            </div>
                            <div class="continer text-center">
                                <button type="submit" class="btn btn-outline-secondary  ">Post</button>
                            </div>

                        </form>

                    </div>
                </div>
            </div>

            <!--end post modal-->

            <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="js/myjs.js" type="text/javascript"></script>

            <!--edit profile js-->
            <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-btn').click(function () {
                                        //                    alert("clicked")

                                        if (editStatus == false)
                                        {
                                            $("#profile-details").hide()
                                            $("#profile-edit").show()
                                            editStatus = true;
                                            $(this).text("Back")
                                        } else
                                        {
                                            $("#profile-details").show()
                                            $("#profile-edit").hide()
                                            editStatus = false;
                                            $(this).text("Edit")
                                        }
                                    });
                                });
            </script>

            <!--add post js-->
            <script>
                $(document).ready(function (e) {
                    $("#add-post-form").on("submit", function (event) {
                        event.preventDefault();

                        let form = new FormData(this);
                        //                    requesting to serve
                        $.ajax({
                            url: "AddPostServlet",
                            type: 'POST',
                            data: form,
                            success: function (data, testStatus, jqXHR) {
                                console.log(data);
                                if (data.trim() === 'done')
                                {
                                    swal("Good job!", "Saved Successfully", "success");

                                } else
                                {
                                    swal("Error!", "Something went wrong try again...", "error");
                                }
                            },
                            error: function (jqXHR, testStatus, errorThrown) {
                                swal("Error!", "Something went wrong try again...", "error");
                            },
                            processData: false,
                            contentType: false
                        });
                    });
                });
            </script>

    </body>
</html>
