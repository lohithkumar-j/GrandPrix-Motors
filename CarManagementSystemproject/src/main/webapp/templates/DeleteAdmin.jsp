<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("email");

try {
    Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");

    String qry = "DELETE FROM admin WHERE email=?";
    PreparedStatement pstmt = con.prepareStatement(qry);
    pstmt.setString(1, id);
    int rowsAffected = pstmt.executeUpdate();

    if (rowsAffected > 0) {
        out.println("<script>alert('Admin deleted successfully.');</script>");
    } else {
        out.println("<script>alert('Failed to delete admin.');</script>");
    }

    pstmt.close();
    con.close();
} catch (Exception e) {
    out.println("<script>alert('An error occurred. Please try again.');</script>");
    e.printStackTrace(System.err); // For debugging purposes
}

response.setHeader("Refresh", "0; URL=UsersList.jsp"); // Redirect back to the admin page
%>
