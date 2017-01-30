<%@page import="sun.rmi.log.LogInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import ="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%
String usr = request.getParameter("username");
String usn = request.getParameter("usn");
String college=request.getParameter("college");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SB","root","root");
Statement st = con.createStatement();
 ResultSet rs=st.executeQuery("select * from student where usn='"+usn+"'");
            if(rs.next())
            {
                if((rs.getString("sname").equalsIgnoreCase(usr))&&(rs.getString("college").equalsIgnoreCase(college)))
                {
                    session.setAttribute("usn", usn);
                    response.sendRedirect("feed.jsp?msg=sucsess");
                }
                else
                {
                    response.sendRedirect("index.html?mesg=username doesnt exits");
                }
            }
            else
            {
                int i=st.executeUpdate("insert into student values('"+usr+"','"+usn+"','"+college+"')");
                if(i>0)
                {
                      session.setAttribute("usn", usn);
                    response.sendRedirect("feed.jsp?msg=sucsess");
                }
            }


%>