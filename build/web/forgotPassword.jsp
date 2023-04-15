<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"> 
        <link rel="icon" href="logo.jpg">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    
    <style>
        *{
                box-sizing: border-box;
                margin:0px;
                padding:0px;
            }
            body{
                background-color:#e3e5fc;
            }
            .main{
                width:50%;
                min-height: 400px;
                display:flex;
                margin:0 auto;
                margin-top:7.5%;
                border-radius: 10px;
                align-items: center;
                justify-content: center;
                background-color: white;
            }
            .leftIndex,.rightIndex{
                width:50%;
                display: flex;
                flex-direction: column;
                padding:10px;
            }
            .leftIndex{
                padding-right: 0px;
            }
            .rightIndex{
                padding-left:0px; 
            }
            .bg{
                width:24%;
                padding-top:20px; 
                position:absolute;
            }
            .bgleft{
                height:400px;
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
            }
            .bgright{
                height:400px;
                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
            }
            .form_header{ 
                text-align:center;
                font-size:50px; 
                font-family:timesnewroman; 
                word-wrap:break-word;
            }
            .login__field { 
                position: relative; 
                margin:15px;
            }
            h3{
                margin-left:15px;
            }
            .login__icon { 
                position: absolute; 
                padding:0px 5px; 
                top: 12px;
                left: 10px;
                color:black; 
                width:50px; 
                height:50px; 
            }  
            .login__icon1 { 
                position: absolute; 
                padding:0px 5px; 
                top: 0px;
                left: 7px;
                color:black; 
                width:50px; 
                height:50px; 
            }  
            .login__input { 
                padding: 10px; 
                padding-left: 50px; 
                width: 90%;
                border-radius:10px;
                border:none;
                font-size:15pt; 
                height: 40px; 
            }  
            button{
                width:50%;
                margin: 0 auto;
            }
            h1{font-size:1.7em;}
            h3{font-size:1.17em;}
    </style>
    </head>
    <body>
        <%
        String status = request.getParameter("status");
        %>
        <section>
            <div class="main">
                <div class="leftIndex">
                    <div><img class="bgleft" src="bgimg.jpg" alt="no img" width="100%"/></div>
                </div>
                <div class="rightIndex">
                    <form id="myform" action="passwordReset" method="post"></form>
                    <div ><img class="bgright" src="bgright.jpeg" alt="no img" width="100%"/></div>
                    <div class="bg">
                        <h1 style="text-align: center;">Forgot Password</h1>
                        <br>
                        <%
                        if(status.equals("password")){
                        %>
                        <h3>Username : </h3>
                        <div class="login__field">
                            <i class = "login__icon fas fa-user"> </i> 
                            <input form="myform" value="" class="login__input" type="text" id="username" name="empid" placeholder="Username" required/>
                        </div>
                        <%
                        }
                        else{
                        %>
                        <h3>Date of Birth : </h3>
                        <div class="login__field">
                            <i class = "login__icon fas fa-calendar"> </i> 
                            <input form="myform" value="" class="login__input" type="date" id="username" name="dob" placeholder="Username" required/>
                        </div>
                        <%
                        }
                        %>
                        <h3>Registered Email ID : </h3>
                        <div class="login__field">
                            <i class = "login__icon1" style="font-size:25px;font-weight:700;">@</i> 
                            <input form="myform" value="" class="login__input" type="email" name="email" placeholder="Email ID" required/>
                        </div>
                        <div style="float:left;text-align:center; width:100%;" class="center">
                        <%
                            if(session.getAttribute("status")!=null && session.getAttribute("msg")!=null)
                            {
                                if(session.getAttribute("status").toString().equals("success"))
                                {
                                %>
                                <p style="color:green;"><%=session.getAttribute("msg").toString()%></p>
                                <%
                                }
                                else
                                {
                                %>
                                <p style="color:red;"><%=session.getAttribute("msg").toString()%></p>
                                <%
                                }
                                session.setAttribute("msg","");
                                session.setAttribute("status","");
                            }
                        %>
                        </div>
                        <br>
                        <div style="width:100%;display:flex;justify-content: center;align-items: center;">
                            <button style="width:40%;" type="button" class="btn btn-danger" onclick="location.href='index.jsp'">Back to Login</button>
                            <button style="width:40%;" form="myform" type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>                    
                </div>
            </div>
        </section>
        
        <script>
            function submit1()
            {
                document.forms[0].action = "index.jsp";
                document.forms[0].method = "post"; 
                document.forms[0].submit();
            }
        </script>
    </body>
</html>
