
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry Something went Wrong....</title>
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
        <div class="container text-center">
            <img src="img/browser.png" class="img-fluid">
            <h3 class="display-3">Sorry! Something Went Wrong...</h3>
            <%= exception
                    %>
                    <br>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3"> Home</a>
        </div>
    </body>
</html>
