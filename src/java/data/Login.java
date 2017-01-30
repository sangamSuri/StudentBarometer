/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eswar
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session=request.getSession(true);
            String sname=request.getParameter("username");
            String usn=request.getParameter("usn");
            String college=request.getParameter("college");
           Connection con  =DatabaseConnection.getCon();
            Statement st = con.createStatement();
            ResultSet rs=st.executeQuery("select * from student where usn='"+usn+"'");
            if(rs.next())
            {
                if((rs.getString(sname).equalsIgnoreCase(sname))&&(rs.getString("college").equalsIgnoreCase(college)))
                {
                    session.setAttribute("usn", usn);
                    response.sendRedirect("fedd.jsp?msg=sucsess");
                }
                else
                {
                    response.sendRedirect("index.html?mesg=username doesnt exits");
                }
            }
            else
            {
                int i=st.executeUpdate("insert into student values('"+sname+"','"+usn+"','"+college+"')");
                if(i>0)
                {
                      session.setAttribute("usn", usn);
                    response.sendRedirect("fedd.jsp?msg=sucsess");
                }
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
