package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class footer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("    <style>\n");
      out.write("        \n");
      out.write("\n");
      out.write("/*=========================\n");
      out.write("  Icons\n");
      out.write(" ================= */\n");
      out.write("\n");
      out.write("/* footer social icons */\n");
      out.write("ul.social-network {\n");
      out.write("\tlist-style: none;\n");
      out.write("\tdisplay: inline;\n");
      out.write("\tmargin-left:0 !important;\n");
      out.write("\tpadding: 0;\n");
      out.write("}\n");
      out.write("ul.social-network li {\n");
      out.write("\tdisplay: inline;\n");
      out.write("\tmargin: 0 5px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("/* footer social icons */\n");
      out.write(".social-network a.icoRss:hover {\n");
      out.write("\tbackground-color: #F56505;\n");
      out.write("}\n");
      out.write(".social-network a.icoFacebook:hover {\n");
      out.write("\tbackground-color:#3B5998;\n");
      out.write("}\n");
      out.write(".social-network a.icoTwitter:hover {\n");
      out.write("\tbackground-color:#33ccff;\n");
      out.write("}\n");
      out.write(".social-network a.icoGoogle:hover {\n");
      out.write("\tbackground-color:#BD3518;\n");
      out.write("}\n");
      out.write(".social-network a.icoVimeo:hover {\n");
      out.write("\tbackground-color:#0590B8;\n");
      out.write("}\n");
      out.write(".social-network a.icoLinkedin:hover {\n");
      out.write("\tbackground-color:#007bb7;\n");
      out.write("}\n");
      out.write(".social-network a.icoRss:hover i, .social-network a.icoFacebook:hover i, .social-network a.icoTwitter:hover i,\n");
      out.write(".social-network a.icoGoogle:hover i, .social-network a.icoVimeo:hover i, .social-network a.icoLinkedin:hover i {\n");
      out.write("\tcolor:#fff;\n");
      out.write("}\n");
      out.write("a.socialIcon:hover, .socialHoverClass {\n");
      out.write("\tcolor:#44BCDD;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".social-circle li a {\n");
      out.write("\tdisplay:inline-block;\n");
      out.write("\tposition:relative;\n");
      out.write("\tmargin:0 auto 0 auto;\n");
      out.write("\t-moz-border-radius:50%;\n");
      out.write("\t-webkit-border-radius:50%;\n");
      out.write("\tborder-radius:50%;\n");
      out.write("\ttext-align:center;\n");
      out.write("\twidth: 50px;\n");
      out.write("\theight: 50px;\n");
      out.write("\tfont-size:20px;\n");
      out.write("}\n");
      out.write(".social-circle li i {\n");
      out.write("\tmargin:0;\n");
      out.write("\tline-height:50px;\n");
      out.write("\ttext-align: center;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".social-circle li a:hover i, .triggeredHover {\n");
      out.write("\t-moz-transform: rotate(360deg);\n");
      out.write("\t-webkit-transform: rotate(360deg);\n");
      out.write("\t-ms--transform: rotate(360deg);\n");
      out.write("\ttransform: rotate(360deg);\n");
      out.write("\t-webkit-transition: all 0.2s;\n");
      out.write("\t-moz-transition: all 0.2s;\n");
      out.write("\t-o-transition: all 0.2s;\n");
      out.write("\t-ms-transition: all 0.2s;\n");
      out.write("\ttransition: all 0.2s;\n");
      out.write("}\n");
      out.write(".social-circle i {\n");
      out.write("\tcolor: #fff;\n");
      out.write("\t-webkit-transition: all 0.8s;\n");
      out.write("\t-moz-transition: all 0.8s;\n");
      out.write("\t-o-transition: all 0.8s;\n");
      out.write("\t-ms-transition: all 0.8s;\n");
      out.write("\ttransition: all 0.8s;\n");
      out.write("}\n");
      out.write("\n");
      out.write("a {\n");
      out.write(" background-color: #D3D3D3;   \n");
      out.write("}\n");
      out.write("    </style>\n");
      out.write("    \n");
      out.write("\n");
      out.write("<!------ Include the above in your HEAD tag ---------->\n");
      out.write("\n");
      out.write("<!--Pulling Awesome Font -->\n");
      out.write("\n");
      out.write("  \n");
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"col-md-12\">\n");
      out.write("        <ul class=\"social-network social-circle\">\n");
      out.write("            <li><a href=\"#\" class=\"icoRss\" title=\"Rss\"><i class=\"fa fa-rss\"></i></a></li>\n");
      out.write("            <li><a href=\"#\" class=\"icoFacebook\" title=\"Facebook\"><i class=\"fa fa-facebook\"></i></a></li>\n");
      out.write("            <li><a href=\"#\" class=\"icoTwitter\" title=\"Twitter\"><i class=\"fa fa-twitter\"></i></a></li>\n");
      out.write("            <li><a href=\"#\" class=\"icoGoogle\" title=\"Google +\"><i class=\"fa fa-google-plus\"></i></a></li>\n");
      out.write("            <li><a href=\"#\" class=\"icoLinkedin\" title=\"Linkedin\"><i class=\"fa fa-linkedin\"></i></a></li>\n");
      out.write("        </ul>\t\t\t\t\n");
      out.write("    </div>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
