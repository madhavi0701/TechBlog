<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechBlog</title>


        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 84%, 75% 100%, 41% 93%, 0 100%);



            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-star-o"></span> TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#blogs"><span class="fa fa-buysellads"></span> Blogs <span class="sr-only">(current)</span></a>
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
                        <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span> Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span> Sign Up</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>

        <!--banner-->
        <div class="banner-background container-fluid p-0 m-0" style="padding-bottom: 30px">
            <div class="jumbotron primary-background text-white">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog</h3>
                    <p>A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms. Most programming languages consist of instructions for computers.</p>
                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-sign-in"></span> Start it's Free</a>
                    <a  href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle"></span> Login</a>
                </div>
            </div>


        </div>
        <div class="container" id="blogs">
            <div class="row mb-3 equal">
                <%
                    PostDao d = new PostDao(ConnectionProvider.getConnection());

                    List<Post> posts = posts = d.getAllPosts();;

                    if (posts.size() == 0) {
                        out.println("<h3 class='display-3 text-center'>No Posts in this Category..</h3>");
                    }
                    for (Post p : posts) {
                %>
                <div class="col-md-4 ">
                    <div class="card mb-3 card-block" >

                        <div class="card-body">
                            <h5 class="card-title"><%= p.getTitle()%></h5>

                            <%
                                String c = p.getContent();
                                if (c.length() > 100) {
                                    c = c.substring(0, 100) + "...";
                                }
                            %>
                            <p class="card-text"><%= c%></p>
                            <a href="login_page.jsp"  class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>

            </div>

        </div>


        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>


        <!--        <script>
                    $(document).ready(function(){
                        alert("document loaded")
                    })
                </script>-->
    </body>
</html>
