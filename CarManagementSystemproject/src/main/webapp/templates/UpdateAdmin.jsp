<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    String email = request.getParameter("email");
    String fullname = request.getParameter("fullname");
    String contactno = request.getParameter("contactno");
    String member = request.getParameter("member");

    try {
        Connection con = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
        PreparedStatement pstmt = con.prepareStatement("UPDATE admin SET fullname = ?, contactno = ?, member = ? WHERE email = ?");
        pstmt.setString(1, fullname);
        pstmt.setString(2, contactno);
        pstmt.setString(3, member);
        pstmt.setString(4, email);

        int i = pstmt.executeUpdate();
        if (i > 0) {
            out.println("<script>alert('Admin details updated successfully!'); window.location.href = 'UsersList.jsp';</script>");
        } else {
            out.println("<script>alert('Failed to update admin details.'); window.location.href = 'EditAdmin.jsp?email=" + email + "';</script>");
        }
    } catch(Exception e) {
        out.println(e);
    }
%>
