<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
        String username = request.getParameter("username");
        String codeLanguage = request.getParameter("code_language");
        String stdin = request.getParameter("stdin");
        String sourceCode = request.getParameter("source_code");

   
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            out.println("Driver not found: " + e.getMessage());
            return;
        }

        String sql = "INSERT INTO code_submissions (username, code_language, stdin, source_code) VALUES (?, ?, ?, ?)";

    
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TUFTask", "root", "pavanOO7@");
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            // Set parameters and execute the update
            pstmt.setString(1, username);
            pstmt.setString(2, codeLanguage);
            pstmt.setString(3, stdin);
            pstmt.setString(4, sourceCode);
            int queary=pstmt.executeUpdate();
            
 
            response.sendRedirect("data.jsp");

        } catch(Exception E){
            out.println("please try again later"+E.getMessage());
            }
       %>
    </body>
</html>
