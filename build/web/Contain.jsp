<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function del() {
                if (!confirm("Confirm deletion?")) {
                    window.event.returnValue = false;
                }
            }
        </script>
        <title>Student Information Management System</title>
        <style type="text/css">
            body {
                /*background-color: #eee;*/
            }

            form h1 {
                display: inline-block;
                width: 820px;
            }

            .check {
                padding: 30px 30px;
            }

            form {
                display: inline;
            }

            .contain {
                width: 1000px;
                border-radius: 10px;
                border: 1px #bbb solid;
                background-color: #eee;
                padding-top: 20px;
            }

            button {
                margin-left: 10px;
            }

            .search {
                display: inline-block;
                margin-left: 500px;
            }

            .add {
                float: right;
                margin-right: 50px;
            }

            .pageNav {
                margin-left: 200px;
            }
        </style>
    </head>
    <body>
        <%@ page import="java.sql.PreparedStatement" %>
        <%
            request.setCharacterEncoding("UTF-8");
            String sqlQuery = "SELECT * FROM stumanagementbyweb.studentinfo";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stumanagementbyweb", "solaz", "solaz");
                PreparedStatement ps = con.prepareStatement(sqlQuery);
                ResultSet rs = ps.executeQuery();
        %>

        <div class="contain">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Date of Birth</th>
                        <th>Enrollment Date</th>
                        <th>Major</th>
                        <th>College</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <!-- ... -->
                <tbody>
                    <% while (rs.next()) {
  for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
    System.out.println(rs.getString(i));
  }
} { %>
                    <tr>
                        <td><%= rs.getString("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("gender") %></td>
                        <td><%= rs.getString("dateOfBirth") %></td>
                        <td><%= rs.getString("enrollmentDate") %></td>
                        <td><%= rs.getString("major") %></td>
                        <td><%= rs.getString("college") %></td>
                        <td>
                            <a href='AlertStudent.jsp?id=<%= rs.getString("id") %>'><button class='btn btn-primary'>Modify</button></a>
                            <a href='DaoDelete.jsp?id=<%= rs.getString("id") %>' onclick='javascript:return del();'><button class='btn btn-danger'>Delete</button></a>
                        </td>
                    </tr> 
                    <% } %>
                </tbody>
                <!-- ... -->

            </table>
        </div>

        <% 
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        %>
    </body>
</html>
