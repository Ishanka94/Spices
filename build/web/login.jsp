<%@page import = "java.sql.*" %>

<%

String username = request.getParameter("uname");
String pwd = request.getParameter("pass");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spice", "root", "");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from members where uname = '"+ username +"' and pass='"+ pwd +"'");
if(rs.next()){
    session.setAttribute("userid", username);
    response.sendRedirect("main.jsp");
}else{
    out.println("Invalid password or username <a href='index.jsp'>Try again</a>");
}



%>