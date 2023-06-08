<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
        <title>Insert title here</title>
        <style type="text/css">
            .form-control {
                width: 300px;
                height: 30px;
                float: right;
            }

            select {
                width: 210px;
                height: 30px;
            }

            .submit {
                margin-left: 100px;
                margin-right: 30px;
            }

            .contain {
                width: 1000px;
                border: 1px #bbb solid;
                background-color: #eee;
                padding-top: 20px;
                border-radius: 10px;
            }

            label {
                display: inline-block;
                width: 100px;
                margin-right: 10px;
            }

            form {
                margin-left: 300px;
            }
        </style>
    </head>

    <body>
        <%!
                String id;
                String sourceId;
                String name;
                String sex;
                String birthday;
                String schoolday;
                String college;
                String major;
        %>
        <%
	
                if((String)session.getAttribute("user")==null){
                        out.print("<script language='JavaScript'>alert('Please log in first！');window.location.href='index.html'</script>");
                }
	
                request.setCharacterEncoding("UTF-8");
                id = request.getParameter("id");
                String sqlid = "SELECT * FROM stumanagementbyweb.studentinfo where id='"+id+"'";
                sourceId = id;
                try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stumanagementbyweb","solaz","solaz");
                        Statement sql = con.createStatement();
                        ResultSet rs = sql.executeQuery(sqlid);
                        if(rs.next()){
                                name = rs.getString(2);
                                sex = rs.getString(3);
                                birthday = rs.getString(4);
                                schoolday = rs.getString(5);
                                college = rs.getString(7);
                                major = rs.getString(6);
				
                        }
                        rs.close();
                        sql.close();
                        con.close();
                }catch(Exception e){
                        e.printStackTrace();
                }
		
        %>
        <div class="contain">
            <form action="DaoAlertStudent.jsp?sourceId='<%=sourceId %>'" method="post">
                <div class="form-group form-inline">
                    <label for="id">Student ID:</label>
                    <input type="text" class="form-control" id="id" name="id" value='<%=id %>' required="required">
                </div>
                <div class="form-group form-inline">
                    <label for="name">name:</label>
                    <input type="text" class="form-control" id="name" name="name" maxlength="15" value='<%=name %>' required="required">
                </div>
                <div class="form-group form-inline">
                    <label for="sex">gender:</label>
                    <select name="sex" id="sex">
                        <%
                                if(sex.equals("male")){
                                        out.print("<option value='male'selected='selected'>male</option>");
                                        out.print("<option value='female'>female</option>");
                                }else{
                                        out.print("<option value='female'selected='selected'>female</option>");
                                        out.print("<option value='male'>male</option>");
                                }
                        %>
                    </select>
                </div>
                <div class="form-group form-inline">
                    <label for="birthday">date of birth:</label>
                    <input type="date" class="form-control" id="birthday" name="birthday" value='<%=birthday %>' required="required">
                </div>
                <div class="form-group form-inline">
                    <label for="schoolday">date of enrollment:</label>
                    <input type="date" class="form-control" id="schoolday" name="schoolday" value='<%=schoolday %>' required="required">
                </div>
                <div class="form-group form-inline">
                    <label for="college">department:</label>
                    <select name="college" id="college" class="college">
                        <option selected="selected" value='<%=college %>'><%=college %></option>
                    </select>
                </div>
                <div class="form-group form-inline">
                    <label for="major">major :</label>
                    <select name="major" id="major" class="major">
                        <option selected="selected" value='<%=major %>'><%=major %></option>
                    </select>
                </div>
                <div class="form-group form-inline">
                    <input type="submit" id="" name="" class="btn btn-primary submit" value='submit' /><input type="reset" class="btn btn-warning" value="reset" />
                </div>
            </form>
        </div>
    </body>
    <script type="text/javascript">
        var librarians = ['School of Mechanical and Electrical Engineering', 'School of Electronic Information', 'School of Business Administration', 'School of Financial Management', 'School of Automotive Engineering'];
        var choice = ['---Please Select---'];
        var electromeChanical = ['Numerical Control Technology', 'Mold Design and Manufacturing', 'Mechanical Manufacturing and Automation', 'Mechatronics Equipment Maintenance and Management', 'Industrial Robotics', 'Electrical Automation', 'Mechanical Design and Manufacturing'];
        var electronicInformation = ['Industrial Design', 'Art Design', 'Photovoltaic Engineering Technology', 'Photovoltaic Power Generation Technology and Application', 'Internet of Things Application Technology', 'Computer Application Technology', 'Communication Technology', 'Electronic Information Engineering Technology'];
        var businessCircles = ['Logistics Management', 'E-commerce', 'Marketing', 'International Trade Practice', 'Business Enterprise Management', 'Business Management'];
        var financialManagement = ['Accounting', 'Financial Management and Practice', 'Financial Management', 'Hotel Management', 'Tourism Management'];
        var automobileEngineering = ['Food Nutrition and Testing', 'Automotive Technology Service and Marketing', 'Automotive Inspection and Maintenance Technology'];

        var professional = new Array;
        professional[0] = choice;
        professional[1] = electromeChanical;
        professional[2] = financialManagement;
        professional[3] = businessCircles;
        professional[4] = electronicInformation;
        professional[5] = automobileEngineering;

        function add_option(select, option) {
            var target = document.getElementById(select);
            for (var i = option.length - 1; i >= 0; i--) {
                var add_option = document.createElement("option");
                add_option.text = option[i];
                target.add(add_option, null);
                target.lastChild.setAttribute("value", option[i]);
            }

        }
        add_option("college", librarians);

        document.getElementById("college").addEventListener("change", function () {

            var selevted_college = document.getElementById("college");
            var selected_major = document.getElementById("major");

            for (var i = selected_major.length - 1; i >= 0; i--) {
                selected_major.remove(i);
            }
            var selected = selevted_college.selectedIndex;
            if (selected === 0) {
                add_option("major", professional[0]);
            } else {
                add_option("major", professional[selected]);
            }
        });
    </script>

</html>