<%@page import = "java.sql.*" %>

<%

String fname = request.getParameter("fname");
String email = request.getParameter("email");
String uname = request.getParameter("uname");
String password = request.getParameter("pass");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spice", "root", "");
Statement st = con.createStatement();
int i = st.executeUpdate("insert into members(name, email, uname, pass) values ('" + fname + "', '" + email + "', '" + uname +"', '" + password + "')");
if(i > 0){
    out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    //response.sendRedirect("welcome.jsp");
}else{
    response.sendRedirect("index.jsp");
}
%>