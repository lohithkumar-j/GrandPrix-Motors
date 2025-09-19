<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    String email = request.getParameter("email");
    String fullname = "";
    String contactno = "";
    String member = "";

    try {
        Connection con = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM admin WHERE email = ?");
        pstmt.setString(1, email);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            fullname = rs.getString("fullname");
            contactno = rs.getString("contactno");
            member = rs.getString("member");
        }
    } catch(Exception e) {
        out.println(e);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .edit-container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"], input[type="email"], input[type="tel"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background: #4a90e2;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background: #357abd;
        }
    </style>
</head>
<body>
    <div class="edit-container">
        <h2>Edit Admin Details</h2>
        <form action="UpdateAdmin.jsp" method="post">
            <input type="hidden" name="email" value="<%=email%>">
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" value="<%=fullname%>" required>
            <label for="contactno">Contact No:</label>
            <input type="tel" id="contactno" name="contactno" value="<%=contactno%>" required>
            <label for="member">Member:</label>
            <input type="text" id="member" name="member" value="<%=member%>" required>
            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>
