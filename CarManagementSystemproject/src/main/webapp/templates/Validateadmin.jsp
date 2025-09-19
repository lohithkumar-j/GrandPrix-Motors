<%@ page import="java.sql.*" %>
<%
String email = request.getParameter("email");
String pwd = request.getParameter("pwd");

try {
    Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
    System.out.println("Connection Established");

    String qry = "SELECT * FROM admin WHERE email=? AND password=?";
    PreparedStatement pstmt = con.prepareStatement(qry);
    pstmt.setString(1, email);
    pstmt.setString(2, pwd);
    
    ResultSet rs = pstmt.executeQuery();
    
    if (rs.next()) {
        // Login successful, redirect to home page
        response.sendRedirect("adminpage.html");
    } else {
        // Login failed, show error message
        out.println("<script>alert('Login failed. Please check your email and password.');</script>");
    }

    rs.close();
    pstmt.close();
    con.close();
} catch (Exception e) {
    // For debugging purposes: print the stack trace to the server log
    e.printStackTrace(System.err);
}
%>
