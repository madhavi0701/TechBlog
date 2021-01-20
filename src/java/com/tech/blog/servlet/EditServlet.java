package com.tech.blog.servlet;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "EditServlet", urlPatterns = {"/EditServlet"})
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

//            fetch data
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String pass = request.getParameter("password");
            String about = request.getParameter("about");
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();
            
//              get user form session
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("current");
            user.setEmail(email);
            user.setName(name);
            user.setPass(pass);
            user.setAbout(about);
            String oldFile = user.getProfile();
            if(imageName.equals(""))
            {
                imageName=oldFile;
            }
            user.setProfile(imageName);

            //update database
            UserDao u = new UserDao(ConnectionProvider.getConnection());
            boolean ans = u.updateUser(user);
            if (ans) {
                String pathOld = request.getRealPath("/") + "pics" + File.separator + oldFile;
                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
                if (!oldFile.equals("default.png") && !imageName.equals(oldFile)) {
                    Helper.deleteFile(pathOld);
                }
                if (Helper.saveFile(part.getInputStream(), path)) {
                    Message msg = new Message("Profile Details Updated", "success", "alert-success");

                    s.setAttribute("msg", msg);
                } else {
                    Message msg = new Message("Something Went wrong", "error", "alert-danger");

                    s.setAttribute("msg", msg);
                }

            } else {
                Message msg = new Message("Something Went wrong", "error", "alert-danger");

                s.setAttribute("msg", msg);
            }

            response.sendRedirect("profile.jsp");

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
