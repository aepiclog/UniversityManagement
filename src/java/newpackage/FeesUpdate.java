package newpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FeesUpdate extends HttpServlet {

    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
    private static final String DB_USERNAME = "arpita";
    private static final String DB_PASSWORD = "roy";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the input parameters from the previous page
        String id = request.getParameter("id");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String dept = request.getParameter("dept");
        String year = request.getParameter("year");
        String transaction_id = request.getParameter("transaction_id");
        String paid =("paid");

        // Get the current date and time
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
        Date currentDate = new Date();
        String formattedDate = dateFormat.format(currentDate);

        // Save the data into the Oracle database
        try {
            Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            // Prepare the SQL statement with placeholders for the input parameters
            String sql = "INSERT INTO fees (id,pdate,transaction_id,paid) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);

            // Set the values for the input parameters
            statement.setString(1, id);
            statement.setString(2, formattedDate );
            statement.setString(3, transaction_id );
            statement.setString(4, paid );

            // Execute the SQL statement
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                 response.sendRedirect("http://localhost:8080/MajorProject/StudentPages/payreciept.jsp");
                 request.getSession().setAttribute("id", id);
            } else {
                response.getWriter().println("retry again");
            }

            // Close the database connection and statement
            statement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
