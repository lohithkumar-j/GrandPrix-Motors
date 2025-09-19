<%@page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String pwd = request.getParameter("pwd");
String contact = request.getParameter("contactno");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");

    PreparedStatement pstmt = con.prepareStatement("INSERT INTO admin (fullname, email, password, contactno) VALUES (?, ?, ?, ?)");
    pstmt.setString(1, name);
    pstmt.setString(2, email);
    pstmt.setString(3, pwd);
    pstmt.setString(4, contact);
    
    pstmt.executeUpdate();

    con.close();
    
    response.sendRedirect("UsersList.jsp");
} catch (Exception e) {
    out.println(e);
}
%>
