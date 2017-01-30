<%@page import="sun.rmi.log.LogInputStream"%>
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%
String usn=session.getAttribute("usn").toString();
String f1=request.getParameter("f1");
String f2=request.getParameter("f2");
String f3=request.getParameter("f3");
String f4=request.getParameter("f4");
String f5=request.getParameter("f5");
String f6=request.getParameter("f6");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SB","root","root");
PreparedStatement st = con.prepareStatement("insert into feed (experince,faciliti,standrads,sports,unions,usn,date,comments) values(?,?,?,?,?,?,now(),?)");
st.setString(1, f1);
st.setString(2, f2);
st.setString(3, f3);
st.setString(4, f4);
st.setString(5, f5);

st.setString(6, usn);

st.setString(7, f6);
boolean re=st.execute();
if(re)
       {
out.println("sucess");
}
else
    out.println("fail");


  


%>