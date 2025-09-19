<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Car Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
        }
       .navbar {
            background-color: #4a90e2;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        .logo {
            font-size: 35px;
            font-family: Arial;
        }

        .menu ul {
            display: flex;
            list-style-type: none;
        }

        .menu ul li {
            margin-left: 20px;
        }

        .menu ul li a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .menu ul li a:hover {
            color: #ff7200;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 20px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form-container h2 {
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
            text-align: left;
            width: 100%;
        }

        .form-container input, 
        .form-container select, 
        .form-container textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

  button {
            padding: 5px 10px;
            color: #fff;
            background-color: #4a90e2;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #357abd;
        }

        .footer {
            background-color: #333;
            color: #f2f2f2;
            text-align: center;
            padding: 10px;
            width: 100%;
        }

        .footer p {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
        }

        .footer a {
            color: #4a90e2;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer a:hover {
            color: #fff;
        }
    </style>
</head>
<body>
   <!-- Navbar -->
    <div class="navbar">
        <div class="logo">CarMatePro</div>
        <div class="menu">
            <ul>
                <li><a href="CarList.html">Car List</a></li>
                <li><a href="index.html">Logout</a></li>
            </ul>
        </div>
    </div>

    <div class="form-container">
    
        <h2>Add Car Information</h2>
        <form action="AddCarServlet" method="post" enctype="multipart/form-data">
            <label for="companyName">Company Name</label>
            <select name="companyName" id="companyName" required>
                <option value="">Select a company</option>
                <% 
                try {
                    Connection con = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");

                    String qry = "SELECT name FROM company";
                    PreparedStatement pstmt = con.prepareStatement(qry);
                    ResultSet rs = pstmt.executeQuery();

                    while (rs.next()) {
                        String companyName = rs.getString("name");
                %>
                        <option value="<%=companyName%>"><%=companyName%></option>
                <% 
                    }
                    rs.close();
                    pstmt.close();
                    con.close();
                } catch(Exception e) {
                    out.println(e);
                } 
                %>
            </select>

            <label for="carName">Car Name</label>
            <input type="text" id="carName" name="carName" required>

            <label for="price">Price</label>
            <input type="text" id="price" name="price" required>

            <label for="carImage">Car Image</label>
            <input type="file" id="carImage" name="carImage" required>

            <label for="otherDetails">Other Details</label>
            <textarea id="otherDetails" name="otherDetails" rows="4"></textarea>

            <div class="button-group">
                    <button type="submit">Submit</button>
                    <button type="reset">Reset</button>
                </div>
        </form>
    </div>

    <div class="footer">
        <p>CarMatePro © 2024. All rights reserved.</p>
    </div>
</body>
</html>