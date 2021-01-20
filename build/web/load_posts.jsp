<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>


<%
    User user = (User) session.getAttribute("current");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%><div class="row">
    <%
        Thread.sleep(500);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));

        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();

        } else {
            posts = d.getPostByCatId(cid);
        }
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Posts in this Category..</h3>");
        }
        for (Post p : posts) {
    %>

    <div class="col-md-6 mt-2">
        <div class="card ">
            <div class="card-header " >
                <b class="post-title"><%= p.getTitle()%></b>
            </div>
            <div class="card-body">
                
                <%
                    String c = p.getContent();
                    if (c.length() > 100) {
                        c = c.substring(0, 100) + "...";
                    }
                %>
                <p class="post-content"><%= c%></p>
            </div>
        </div>
        <div class="card-footer primary-background text-center">
            <%
                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
            %>

            <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>

            <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
            <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>
        </div>
    </div>
    <%
        }
    %>
</div>