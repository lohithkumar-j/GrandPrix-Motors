package com.model;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getCompanies")
public class CompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/epproject";
        String username = "root";
        String password = "Kavyasri@142005";
        
        // SQL query to fetch company names
        String sql = "SELECT companyname FROM company";

        try (
            Connection conn = DriverManager.getConnection(url, username, password);
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            PrintWriter out = response.getWriter();
        ) {
            // Prepare JSON array for company names
            JSONArray companyNames = new JSONArray();
            while (rs.next()) {
                companyNames.put(rs.getString("company_name"));
            }
            // Output JSON array
            out.print(companyNames.toString());
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().print("Error fetching companies");
        }
    }
}
