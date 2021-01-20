
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("current");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 100%, 84% 91%, 24% 100%, 0 85%);
            }
            /*            body{
                            background:url(img/bg2.jpg);
                            background-size: cover;
                            background-attachment: fixed;
                        }*/
        </style>

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
                        <a class="nav-link" href="#post-container"><span class="fa fa-buysellads"></span> Blogs <span class="sr-only">(current)</span></a>
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

        <!--main body-->
        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)"  class=" c-link list-group-item list-group-item-action active primary-background">
                                All Posts
                            </a>
                            <!--categories-->

                            <%                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>


                            <%                                        }
                            %>
                        </div>

                    </div>

                    <!--second col-->
                    <div class="col-md-8" >
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>

                </div>

            </div>

        </main>


        <!--end main body of the page-->
        
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
                                        PostDao p = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = p.getAllCategories();
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

<!--                            <div class="form-group">
                                <label>Select your pic..</label>
                                <br>
                                <input type="file" name="pic"  >
                            </div>-->
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

            <!--loading post using ajax-->
            <script>
                function getPosts(catId, temp) {
                    $("#loader").show();
                    $("#post-container").hide()
                    $(".c-link").removeClass('active')
                    $(".c-link").removeClass('primary-background')
                    $.ajax({
                        url: "load_posts.jsp",
                        data: {cid: catId},
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#loader").hide();
                            $("#post-container").show();
                            $('#post-container').html(data)
                            $(temp).addClass('active')
                            $(temp).addClass('primary-background ')
                        }
                    })
                }
                $(document).ready(function (e) {
                    let allPostRef = $('.c-link')[0]
                    getPosts(0, allPostRef)
                })
            </script>

    </body>
</html>
