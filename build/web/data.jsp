<%-- 
    Document   : data
    Created on : 20-Mar-2024, 6:39:30 pm
    Author     : Pavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
    <title>Submission Records</title>
    <style>
        .truncate {
    max-width: 250px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  table{
      text-align: center;
      align-items: center;
      background-color: #FFFDD0;
      margin-left: auto;
      margin-right: auto;
  }
  .th{
      font-size: 2em;
      
  }
        </style>
</head>
<body>
    <table border="2">
        <tr class="th" >
            <th>Sno</th>
            <th>Username</th>
            <th>Code Language</th>
            <th>Stdin</th>
            <th>Source Code</th>
            <th>Timestamp</th>
        </tr>
         <%
           
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TUFTask", "root", "pavanOO7@");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM code_submissions ORDER BY submission_timestamp");
            while(rs.next()) {
                out.println("<tr>");
                 out.println("<td>" + rs.getString("id") + "</td>");
                out.println("<td>" + rs.getString("username") + "</td>");
                out.println("<td>" + rs.getString("code_language") + "</td>");
                out.println("<td>" + rs.getString("stdin") + "</td>");
                out.println("<td class='truncate'>" + rs.getString("source_code") + "</td>");
                out.println("<td>" + rs.getTimestamp("submission_timestamp") + "</td>");
                out.println("</tr>");
            }
            rs.close();
            stmt.close();
            con.close();
        %>
    </table>
</body>
</html>
