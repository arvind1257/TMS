<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sun.misc.*"%>
<%@page import="Secret.*" %>
<!DOCTYPE html>
<html>
    <head>
        <%
            response.setHeader("Pragma","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setHeader("Expires","0");
            response.setDateHeader("Expires",-1);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"> 
        <link rel="icon" href="logo.jpg">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <title>PDMS</title>
        <style>
            *{
                box-sizing: border-box;
                padding:0px;
                margin:0px;
            }
            body{
                background-color:#e3e5fc;
            }
            .main-header{
                top:0;
                left:0;
                width:100%;
                z-index: 1;
                padding:10px;
                display:flex;
                position: fixed;
                align-items: center;
                box-shadow: 0 0 3px gray;
                background-color: white;
                justify-content: space-between;
            }
            .header-title h2{
                text-shadow:0 0 3px gray;
            }
            .header-icon{
                font-size:25px;
            }
            .header-search input{
                font-size:15px;
                padding:7px;
                padding-left:35px;
                border:1px solid black;
                border-radius: 20px;
            }
            .header-setting{
                display:flex;
                align-items:center;
                justify-content:center;
            }
            .bell{
                font-size:25px;
            }
            .search{
                position: relative;
                font-size:20px;
                left:30px;
            }
            section{
                top:100px;
                position:relative;
            }
            .main-course{
                width:80%;
                margin:0 auto;
                padding:20px;
                margin-top:20px;
                border-radius: 20px;
                background-color: white;
            }
            .tablestyle {
                width:60%; 
                margin-left:auto;
                margin-right:auto;
            }
            .tablestyle th{
                font-size: 25px;
                font-weight: 600;
                text-align: right;
            }
            .tablestyle th,.tablestyle td{
                padding:15px;
            }
            .left-padding{
                padding-left:30px;
            }
            .tablestyle input,.tablestyle select{
                width:80%;
                font-size:20px;
            }
        </style>
    </head>
    </head>
    <body>
        <%
    try{    
        Connection con = (Connection)session.getAttribute("connection");
        Statement stm = con.createStatement();
        ResultSet rs = null;
        Secret secret = new Secret();
        String uid = (String)session.getAttribute("uid");
        String uname = (String)session.getAttribute("uname");
        String udesi = (String)session.getAttribute("udesi");
        %>
        <header>
            <div class="main-header">
                <div style="display:flex;align-items:center;">
                    <div class="header-title" style="display:flex;justify-content:flex-start;align-items: center;">
                        <img src="logo.jpg" width="50" height="50" alt="no img"/>
                        <h2>Task Management System</h2>
                    </div>&emsp;&emsp;
                    <div class="header-icon"><i class="fa fa-home tablinks" onclick="location.href = 'team_dashboard.jsp'"></i></div>
                </div>
                <div class="header-setting">
                    
                    <div class="btn-group">
                        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            <%=uname%>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                            <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <section>
            <div class="main-course">
                <h1 align="center">New User</h1>
                <hr>
                <form name="form2" id="form2" method="post" action="editdetails.jsp" onsubmit="">
                    <input type="hidden" name="status" value="newuser"/>
                </form>
                <table class="tablestyle" cellspacing="10" cellpadding="5">
                    <tr>
                        <th style="width:25%;">First Name  </th>
                        <td class="left-padding" style="width:40%;">
                            <input form="form2" type="text" name="fname" required/>
                        </td>
                    </tr>
                    <tr>
                        <th>Last Name  </th>
                        <td class="left-padding"><input form="form2" type="text" name="lname" required/></td>
                    </tr>
                    <tr>
                        <th>Date of Birth  </th>
                        <td class="left-padding"><input form="form2" type="date" name="dob" required/></td>
                    </tr>
                    <tr>
                        <th>EMP ID  </th>
                        <td class="left-padding"><input form="form2" type="text" name="empid" required/></td>
                    </tr>
                    <tr>
                        <th>Email ID  </th>
                        <td class="left-padding"><input form="form2" type="email" name="email" required/></td>
                    </tr>
                    <tr>
                        <th>Phone No  </th>
                        <td class="left-padding"><input form="form2" type="text" name="phone" required/></td>
                    </tr>
                    <tr>
                        <th>Role </th>
                        <td class="left-padding">
                            <select form="form2" name="role" required>
                                <option>Select the role</option>
                                <option value="Admin">Admin</option>
                                <option value="Member">Team Member</option>
                                <option value="Project Manager">Project Manager</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <div class="tab">
                                <button id="default" class="btn btn-danger tablinks1" onclick="location.href='team_dashboard.jsp'">Back</button>
                            </div>
                        </td>
                        <td align="center">
                            <div class="tab">
                                <button form="form2" class="btn btn-success">Save</button>
                            </div>
                        </td>`
                    </tr>
                </table>
            </div>
        </section>
        <script></script>
                        
    <%
    }
    catch(Exception e){
    %>
    <%
    }
    %>  
    </body>
</html>
