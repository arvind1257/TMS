<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.misc.*"%>
<%@page import="Secret.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="drop_drag.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script><link rel="stylesheet" href="popover.css">
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
            .main-tab{
                display: flex;
                justify-content: space-evenly;
            }

            .tab1{
                background-color: white;
                border:2px solid green;
                justify-content: center;
                align-items: center;
                border-radius:20px;
                min-height: 100px;
                cursor: pointer;
                padding:10px;
                display:flex;
            }
            .main-course{
                width:80%;
                margin:0 auto;
                padding:20px;
                margin-top:20px;
                border-radius: 20px;
                background-color: white;
            }
            .left{
                border-radius: 0px;
                border-top-left-radius:10px;
                border-bottom-left-radius:10px;
                border-right-width: 0px;
            }
            .center{
                border-radius: 0px;
                border-right-width: 0px;
            }
            .right{
                border-radius: 0px;
                border-top-right-radius:10px;
                border-bottom-right-radius:10px; 
            }
            .menu-tab{
                justify-content: flex-start;
                display:flex;
                align-items:center;
            }
            .menu-tab button{
                font-size:20px;
            }
            .tablinks1{
                background-color: white;
                font-weight: 500;
            }
            <!-- old CSS --> 
            .img_style{
                width:35px;
                float:left;
                height:35px;
                margin-right: 10px;
            }
            .menu{
                width:29%;
                top:12%;
                position:fixed;
                float:left;
                padding:10px;
                height:570px;
                background-color: #7c00d4;
            }

            .tabcontent{
                width:64%;
                top:12%;
                left:33%;
                float:right;
                padding:10px;
                height:570px;
                position: fixed;
                overflow-y:scroll; 
                overflow-x:hidden;
                word-break: break-word;
                background-color: #7c00d4;
            }
            .history{
                text-align:center;
                border:none;
                border-top:1px solid black; 
                border-top-style: double;
                border-bottom:1px solid black;
                border-bottom-style: double;

            }
            .tab button{
                text-align:center; 
                padding:20px;
                margin:10px;
            }
            .chat{
                width:100%;
                height:480px;
                margin-top:20px;
                margin-left:auto;
                margin-right:auto;
                text-align:center;
                border-radius: 20px;
                background-color:white;
            }
            /* .btn{
                height:35px; 
                width:40px;
                border:none; 
                background-color:#0050b3; 
                border-top-right-radius:10px;
                border-bottom-right-radius:10px; 
            }
            .btn:HOVER {
                box-shadow: 0px 0px 3px 1px grey;
            } */
            .chatinput{
                margin-top:4px; 
                font-size:15pt; 
                resize:none; 
                width:80%; 
                height:35px; 
                border-top-left-radius:10px;
                border-bottom-left-radius:10px;
            }
            .tableview{
                height:380px; 
                overflow-y:scroll;
            }
            .tableview td{
                word-break:break-word; 
            }
            .tab11{
                width:auto;
                height:auto;
                padding:5px;
                border-radius:10px; 
                background-color: lightblue;
            }
            .tab2 {
                overflow: hidden;
                width:100%;
                margin-left:auto;
                margin-right:auto;
                border:2px solid #62278b;
                border-bottom: none;
                border-top-right-radius:10px;
                border-top-left-radius:10px;
                background-color: #7c00d4;
            }
            .tab2 button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
                font-size: 17px;
                font-weight:bolder;
            }
            .tab2 button:hover {
                background-color: #62278b;
            }
            .tab2 button.active {
                background-color: #62278b;
            }
            /*.tabcontent2 {
              display: none;
              background-color: #7c00d4;
              border:2px solid #62278b;
              border-bottom-right-radius:10px;
              border-bottom-left-radius:10px;
              padding: 6px 12px;
              height:500px;
            }*/
            .tabcontent10 {
                display: none;
                background-color: #7c00d4;
                border:2px solid #62278b;
                border-bottom-right-radius:10px;
                border-bottom-left-radius:10px;
                padding: 6px 12px;
                height:285px;
            }
            .tabcontent11 {
                display: none;
                background-color: #7c00d4;
                border:2px solid #62278b;
                border-bottom-right-radius:10px;
                border-bottom-left-radius:10px;
                padding: 6px 12px;
                height:285px;
            }
            .tabcontent12 {
                display: none;
                background-color: #7c00d4;
                border:2px solid #62278b;
                border-bottom-right-radius:10px;
                border-bottom-left-radius:10px;
                padding: 6px 12px;
                height:285px;
            }
            .tabcontent13 {
                display: none;
                background-color: #7c00d4;
                border:2px solid #62278b;
                border-bottom-right-radius:10px;
                border-bottom-left-radius:10px;
                padding: 6px 12px;
                height:285px;
            }
            .tabcontent14 {
                display: none;
                background-color: #7c00d4;
                border:2px solid #62278b;
                border-bottom-right-radius:10px;
                border-bottom-left-radius:10px;
                padding: 6px 12px;
                height:285px;
            }
            /*.tabcontent3 {
                display: none;
                width:100%;
                margin-left:auto;
                margin-right:auto;
                background-color: #7c00d4;
                border:2px solid #62278b;
                border-bottom-right-radius:10px;
                border-bottom-left-radius:10px;
                padding: 6px 12px;
                height:545px;
              }
            */
            label {
                cursor: pointer;
            }

            #imgInp,#imgInp0,#imgInp1,#imgInp2,#imgInp3 {
                opacity: 0;
                position: absolute;
                z-index: -1;
            }

            .button1 button{
                word-break: break-word;
                border-radius: 10px;    
                padding:6px;
                margin:5px;
                width:25%;
                cursor:pointer;

            } 
            .text{
                word-break: break-word;
                font-size: 18px;
                font-weight: bolder;
            }
            .popup {
                position: relative;
                display: inline-block;
                cursor: pointer;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
            }

            .popup .popuptext {
                visibility: hidden;
                width: 160px;
                background-color: #555;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 8px 5px;
                position: absolute;
                z-index: 1;
                top: 125%;
                left: 50%;
                margin-left: -80px;
            }

            .popup .popuptext::after {
                content: "";
                position: absolute;
                bottom: 100%;
                left: 50%;
                margin-left: -5px;
                border-width: 5px;
                border-style: solid;
                border-color: #555 transparent transparent transparent;
            }

            .popup .show {
                visibility: visible;
                -webkit-animation: fadeIn 1s;
                animation: fadeIn 1s;
            }
            .tab3{
                width:50%;
                text-align:center;
                border-radius: 10px;
                background-color:white;
                box-shadow: 0 0 3px gray;

            }
            @-webkit-keyframes fadeIn {
                from {opacity: 0;} 
                to {opacity: 1;}
            }
            a{
                color:purple;
            }
            @keyframes fadeIn {
                from {opacity: 0;}
                to {opacity:1 ;}
            } 
            .table-bordered {
                border-top-right-radius: 15px;
                border-top-left-radius: 15px;
            }
            .tablestyle{
                border-collapse: initial;
                border-radius: 20px;
                border:1px groove gray;
                margin-left:auto; 
                margin-right:auto;
                border-color:#b8daff;
            }
            .tablestyle th,.tablestyle td{
                border-collapse: collapse;
                border-color:#b8daff;
            }

            .tablestyle th{
                border-color:white;
            }
        </style>
    </head>
    <body>
        <%
        try{
            Connection con = (Connection)session.getAttribute("connection");
            Statement stm = con.createStatement();
            ResultSet rs = null;
            Statement stm1 = con.createStatement();
            ResultSet rs1 = null;
            Statement stm2 = con.createStatement();
            ResultSet rs2 = null;
            Secret secret = new Secret();
            String uid = (String)session.getAttribute("uid");
            String uname = (String)session.getAttribute("uname");
            String udesi = (String)session.getAttribute("udesi");
            String pid = request.getParameter("pid");
            String[] roles = new String[10];
            String[] role_count = new String[10];
            int count = 0;
            int count2 = 0;
            String Emoji[] = {"1F600","1F601","1F602","1F603","1F604","1F605","1F606","1F607","1F608","1F609","1F60A","1F60B","1F60C","1F60D","1F60E","1F60F","1F610","1F611","1F612","1F613","1F614","1F615","1F616","1F616","1F618","1F618","1F619","1F610","1F61A","1F61B","1F61C","1F61D","1F61E","1F61F","1F620","1F621","1F622","1F623","1F624","1F625","1F626","1F627","1F628","1F629","1F62A","1F62B","1F62C","1F62D","1F62E","1F62F","1F630","1F631","1F632","1F633","1F634","1F635","1F636","1F637","1F641","1F642","1F643","1F644","1F910","1F911","1F912","1F913","1F914","1F915","1F920","1F921","1F922","1F923","1F924","1F925","1F926","1F927","1F928","1F929","1F92A","1F92B","1F92C","1F92D","1F92E","1F92F","1F9D0"};
            String role = "";
            String[] names = new String[10];
            if(request.getParameter("no")==null){
        %><input id="click" value="-1"/><%
            }
            else{
        %><input id="click" value="<%=request.getParameter("no")%>"><%
            }
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
            <div class="main-tab">
                <button id="default1" class="btn btn-outline-success tablinks1" style="border-radius:20px;font-size:25px;" onclick="opentab1(event, 'file');">UPLOAD/VIEW <br>FILES</button>
                <button id="default11" class="btn btn-outline-success tablinks1" style="border-radius:20px;font-size:25px;" onclick="opentab1(event, 'chat')">CHAT BOX</button>
            </div>
            <div id="file" class="main-course tabcontent1" style="min-height:60vh;overflow-y:auto;">
                <div class="menu-tab">
                    <%
                    rs=stm.executeQuery("select * from plist where pid='"+pid+"' and m_id='"+uid+"'");  
                    while(rs.next())
                    {
                        roles[count]=rs.getString("roles");
                        if(rs.getString("roles").equals("Requirements Gathering")) names[count]="SRS";
                        else if(rs.getString("roles").equals("Design")) names[count]="SDS";
                        else if(rs.getString("roles").equals("Implementation")) names[count]="SOURCE CODE";
                        else if(rs.getString("roles").equals("Testing")) names[count]="TEST REPORT";
                        rs1=stm1.executeQuery("select count(m_id) from plist where pid='"+pid+"' group by roles having roles='"+rs.getString("roles")+"'");
                        while(rs1.next())
                        {
                            if(Integer.parseInt(rs1.getString(1))>1)
                            {
                                role_count[count2]=rs.getString("roles");
                                count2++;
                            }
                        }
                        count++;
                    }     
                    if(udesi.equals("pm_id"))
                    {
                    %>
                    <button id="default" class="btn btn-outline-primary left tablinks2" onclick='opentab2(event, "Project Manager")'>SDP</button>
                    <button class="btn btn-outline-primary right tablinks2" onclick="opentab2(event, 'approval')">APPROVAL</button>
                    <%
                }
                else{
                    for(int i=0;i<count;i++){   
                        if(count==1){%>
                    <button id="default" style="display:none;" class="btn btn-outline-primary left tablinks2" onclick="opentab2(event, '<%=roles[i]%>')"><%=names[i]%></button>
                    <%
                            }else if(i==0){%>
                    <button id="default" class="btn btn-outline-primary left tablinks2" onclick="opentab2(event, '<%=roles[i]%>')"><%=names[i]%></button>
                    <%
                    }else if(i==count-1){
                    %>
                    <button class="btn btn-outline-primary right tablinks2" onclick="opentab2(event, '<%=roles[i]%>')"><%=names[i]%></button>
                    <%
                    }else{
                    %>
                    <button class="btn btn-outline-primary center tablinks2" onclick="opentab2(event, '<%=roles[i]%>')"><%=names[i]%></button>
                    <%
                    }
                }
            }
                    %>
                </div>
                <div class="tabcontent2" id="approval" style="margin-top: 30px;">
                    <h2><span class="history">APPROVAL for DOCUMENTS</span></h2>
                    <br>
                    <%
                    int f=0;    
                    rs=stm.executeQuery("select distinct(roles),dstatus from plist where pid='"+pid+"' and dstatus='WAITING'");
                    if(rs.next())
                    {
                    do
                    {
                        f++;
                        String role1="";
                        if(rs.getString("roles").equals("Requirements Gathering") && rs.getString("dstatus").equals("WAITING"))  role1="SRS Document has been Uploaded";
                        else if(rs.getString("roles").equals("Design") && rs.getString("dstatus").equals("WAITING")) role1="SDS Document has been Uploaded";
                        else if(rs.getString("roles").equals("Implementation") && rs.getString("dstatus").equals("WAITING")) role1="SOURCE CODE has been Uploaded";
                        else if(rs.getString("roles").equals("Testing") && rs.getString("dstatus").equals("WAITING")) role1="TEST REPORT has been Uploaded";
                        %>
                    <div class="tab3">
                        <form name='form5<%=f%>' id='form5<%=f%>' method='post' action='updatechat.jsp'/>
                        <input form="form5<%=f%>" type='hidden' name="pid" value="<%=pid%>"/>
                        <input form="form5<%=f%>" type="hidden" name="role2" value="<%=rs.getString("roles")%>"/>
                        <input form="form5<%=f%>" type="hidden" id="status" name="status" value=""/>
                        </form>
                        <p class="text"><br><%=role1%>. Kindly Verify and Approve it.</p>
                        <div class="button1">
                            <button class="btn btn-success" onclick="update5('<%=f%>', 'COMPLETED')">APPROVE</button>
                            <button class="btn btn-danger" onclick="update5('<%=f%>', 'NOT COMPLETED')">CANCEL</button>
                        </div>
                        <br>
                    </div>
                    <%
                    }while(rs.next());
                    }
                    else
                    {
                    %>
                    <p class="text">No Pending Approvals.</p>
                    <%
                    }
                    %>
                </div>
                <%
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date d = new Date();
                Date d1 = sdf.parse(sdf.format(d)); //current date
                Date d2 = new Date(); // start date
                Date d3 = new Date(); // end date
                rs=stm.executeQuery("select * from plist inner join pdetails on plist.pid=pdetails.pid where plist.pid='"+pid+"' and ( m_id='"+uid+"' or pm_id='"+uid+"')");   
                int count1 = 0;
                while(rs.next())
                {
                    String id = "";
                    if(udesi=="pm_id"){
                        d2 = sdf.parse(rs.getString("ps_date"));
                        d3 = sdf.parse(rs.getString("pe_date"));
                        id="Project Manager";
                    }
                    else if(rs.getString("roles").equals("Requirements Gathering"))
                    {
                        d2 = sdf.parse(rs.getString("rs_date"));
                        d3 = sdf.parse(rs.getString("re_date"));
                        id=rs.getString("roles");
                    }
                    else if(rs.getString("roles").equals("Design"))
                    {
                        d2 = sdf.parse(rs.getString("ds_date"));
                        d3 = sdf.parse(rs.getString("de_date"));
                        id=rs.getString("roles");
                    }
                    else if(rs.getString("roles").equals("Implementation"))
                    {
                        d2 = sdf.parse(rs.getString("is_date"));
                        d3 = sdf.parse(rs.getString("ie_date"));
                        id=rs.getString("roles");
                    }
                    else if(rs.getString("roles").equals("Testing"))
                    {
                        d2 = sdf.parse(rs.getString("ts_date"));
                        d3 = sdf.parse(rs.getString("te_date"));
                        id=rs.getString("roles");
                    }
                    
                %>
                <br>
                <div id="<%=id%>" class="tabcontent2">
                    <div style="display:flex;">
                        <h5>Status : </h5>
                        <h5 style="font-weight:300">&ensp;&ensp;
                            <%
                            if(udesi!="pm_id"){    
                            if(((d1.getTime() - d2.getTime())/ (1000 * 60 * 60 * 24))<0)
                            {
                            %>
                            Time not Started
                            <%
                            }
                            else if(((d3.getTime() - d1.getTime())/(1000 * 60 * 60 * 24))>=0 && rs.getString("dstatus").equals("NOT COMPLETED"))
                            {
                            %>
                            Remaining <%=((d3.getTime() - d1.getTime())/ (1000 * 60 * 60 * 24))%> days
                            <%
                            }
                            else if(((d3.getTime() - d1.getTime())/(1000 * 60 * 60 * 24))>=0 && rs.getString("dstatus").equals("WAITING"))
                            {
                            %>
                            Waiting for Approval...
                            <%
                            }    
                            else
                            {
                                if(rs.getString("dstatus").equals("COMPLETED"))
                                {
                            %>
                            Work Completed
                            <%
                            }
                            else
                            {
                            %>
                            Time Over</span>
                            <%
                            }
                            }
                            }
                            else{
                            if(((d1.getTime() - d2.getTime())/ (1000 * 60 * 60 * 24))<0)
                            {
                            %>
                            Time not Started
                            <%
                            }
                            else if(((d3.getTime() - d1.getTime())/(1000 * 60 * 60 * 24))>=0 && rs.getString("SDP")==null)
                            {
                            %>
                            Remaining <%=((d3.getTime() - d1.getTime())/ (1000 * 60 * 60 * 24))%> days
                            <%
                            }   
                            else
                            {
                                if(rs.getString("SDP")!=null)
                                {
                            %>
                            Work Completed
                            <%
                            }
                            else
                            {
                            %>
                            Time Over</span>
                            <%
                            }
                            }    
                            }
                            %>
                        </h5>
                    </div>
                    <br>
                    <div style="display:flex;justify-content:space-evenly;align-items:flex-start;">
                        <div style="width:50%;">
                            <h2><span class="history">Document List</span></h2>
                            <br>
                            <table class="table table-bordered tablestyle"  cellspacing="0">
                                <tr class="table-primary">
                                    <th style="border-top-left-radius:20px;">Document</th>
                                    <th>Action</th>
                                    <th style="border-top-right-radius:20px;">Date</th>
                                </tr>
                                <tr>
                                    <td>SDP</td>
                                    <%
                                    if(rs.getString("SDP")!=null)
                                    {
                                    %>
                                    <td align="center">
                                        <a style='color:green;' href="<%=secret.decode(rs.getString("SDP"))%>"><i class='fa fa-download'></i></a>&emsp;&emsp; 
                                        <a style='color:red;' onclick="delete1('<%=pid%>','SDP','')"><i class="fa fa-trash"></i></a><br>
                                    </td>
                                    <td align="center"><%=rs.getString("DATE_SDP")%></td>
                                    <%
                                    }
                                    else
                                    {
                                    %>
                                    <td>NOT UPLOADED</td>
                                    <td align="center">-</td>
                                    <%
                                    }
                                    %>
                                </tr>
                                <tr>
                                    <td>SRS</td>
                                    <%
                                    if(rs.getString("SRS")!=null)
                                    {
                                    %>
                                    <td align="center">
                                        <a style='color:green;' href="<%=secret.decode(rs.getString("SRS"))%>"><i class='fa fa-download'></i></a>&emsp;&emsp; 
                                        <a style='color:red;' onclick="delete1('<%=pid%>','SRS','Requirements Gathering')"><i class="fa fa-trash"></i></a><br>
                                    </td>
                                    <td align="center"><%=rs.getString("DATE_SRS")%></td>
                                    <%
                                    }
                                    else
                                    {
                                    %>
                                    <td>NOT UPLOADED</td>
                                    <td align="center">-</td>
                                    <%
                                    }
                                    %>
                                </tr>
                                <tr>
                                    <td>SDS</td>
                                    <%
                                    if(rs.getString("SDS")!=null)
                                    {
                                    %>
                                    <td align="center">
                                        <a style='color:green;' href="<%=secret.decode(rs.getString("SDS"))%>"><i class='fa fa-download'></i></a>&emsp;&emsp; 
                                        <a style='color:red;' onclick="delete1('<%=pid%>','SDS','Design')"><i class="fa fa-trash"></i></a><br>
                                    </td>
                                    <td align="center"><%=rs.getString("DATE_SDS")%></td>
                                    <%
                                    }
                                    else
                                    {
                                    %>
                                    <td>NOT UPLOADED</td>
                                    <td align="center">-</td>
                                    <%
                                    }
                                    %>
                                </tr>
                                <tr>
                                    <td>SOURCE<br>CODE</td>
                                        <%
                                        if(rs.getString("IMP")!=null)
                                        {
                                        %>
                                    <td align="center">
                                        <a style='color:green;' href="<%=secret.decode(rs.getString("IMP"))%>"><i class='fa fa-download'></i></a>&emsp;&emsp; 
                                        <a style='color:red;' onclick="delete1('<%=pid%>','IMP','Implementation')"><i class="fa fa-trash"></i></a><br>
                                    </td>
                                    <td align="center"><%=rs.getString("DATE_IMP")%></td>
                                    <%
                                    }
                                    else
                                    {
                                    %>
                                    <td>NOT UPLOADED</td>
                                    <td align="center">-</td>
                                    <%
                                    }
                                    %>
                                </tr>
                                <tr>
                                    <td style="border-bottom-left-radius:20px;">TEST<br>REPORT</td>
                                        <%
                                        if(rs.getString("TREPORT")!=null)
                                        {
                                        %>
                                    <td align="center">
                                        <a style='color:green;' href="<%=secret.decode(rs.getString("TREPORT"))%>"><i class='fa fa-download'></i></a>&emsp;&emsp; 
                                        <a style='color:red;' onclick="delete1('<%=pid%>','TREPORT','Testing')"><i class="fa fa-trash"></i></a><br>
                                    </td>
                                    <td align="center" style="border-bottom-right-radius:20px;"><%=rs.getString("DATE_TREPORT")%></td>
                                    <%
                                    }
                                    else
                                    {
                                    %>
                                    <td>NOT UPLOADED</td>
                                    <td align="center" style="border-bottom-right-radius:20px;">-</td>
                                    <%
                                    }
                                    %>
                                </tr>
                            </table>
                        </div>
                        <div style="width:40%;">
                            <form id="form3<%=count1%>" action="FileUploadServlet" method="post" enctype="multipart/form-data">
                                <input form="form3<%=count1%>" type="hidden" name="pid1" value="<%=pid%>"/>
                                <input form="form3<%=count1%>" type="hidden" name="count1" value="<%=count1%>"/>
                                <input form="form3<%=count1%>" type="hidden" name="role" value="<%=id%>"/>
                            </form>
                            <form id="form4<%=count1%>" name="form4<%=count1%>" method="post" action="updatechat.jsp">
                                <input form="form4<%=count1%>" type="hidden" name="pid" value="<%=pid%>"/>
                                <input form="form4<%=count1%>" type="hidden" name="role1" value="<%=id%>"/>
                            </form>   
                            <%
                            if(((d1.getTime() - d2.getTime())/ (1000 * 60 * 60 * 24))<0) {}
                            else if(((d3.getTime() - d1.getTime())/(1000 * 60 * 60 * 24))>=0 && rs.getString("dstatus").equals("NOT COMPLETED"))
                            {
                            %>
                            <h2 align="center"><span class="history">Upload Document</span></h2>
                            <br>
                            <div class="drop-zone" style="margin-left:auto;margin-right:auto;">
                                <span class="drop-zone__prompt">Drop file here or click to upload</span>
                                <input form='form3<%=count1%>' type="file" name="myFile" class="drop-zone__input">
                            </div>
                            <br>
                            <div style="display:flex;justify-content: center;align-items: center;">
                                <button class="btn btn-success" form="form3<%=count1%>"><i class="fa fa-upload" >&ensp;</i>UPLOAD</button>&emsp;&emsp;
                            
                            <%
                            if(udesi!="pm_id"){
                            %>
                                <button class="btn btn-primary" form="form4<%=count1%>">COMPLETE</button>
                            <%
                            }
                            %>
                            </div>
                            <%
                            }
                            %> 
                        </div>
                    </div>
                </div>
                <%
                    count1++;
                }
                %>
            </div>   
            <div id="chat" class="main-course tabcontent1">
                <div class="menu-tab">
                    <%
                    if(udesi.equals("pm_id"))
                    {
                    %>
                    <button id="default20" class="btn btn-outline-primary left tablinks3" onclick="opentab3(event, 'tchat')">Team Chat</button>
                    <button class="btn btn-outline-primary right tablinks3" onclick="opentab3(event, 'settings')">SETTINGS</button>
                    <%
                    }
                    else{
                        if(count2==0){
                    %>
                    <button id="default20" style="display:none;" class="btn btn-outline-primary left tablinks3" onclick="opentab3(event, 'tchat')">Team Chat</button>
                    <%
                }
                else{
                    %>
                    <button id="default20" class="btn btn-outline-primary left tablinks3" onclick="opentab3(event, 'tchat')">Team Chat</button>
                    <%
                    for(int i=0;i<count2;i++){
                            if(count2==1 || i==count2-1){
                    %>
                    <button id="default2<%=i+1%>" class="btn btn-outline-primary right tablinks3" onclick="opentab3(event, '<%=role_count[i]%>1')"><%=role_count[i]%></button>
                    <%
                    }else{
                    %>
                    <button id="default2<%=i+1%>" class="btn btn-outline-primary center tablinks3" onclick="opentab3(event, '<%=role_count[i]%>1')"><%=role_count[i]%></button>
                    <%
                    }
                }
            }
        }
                    %>   
                </div>
                <div style="margin-top:30px;" class="tabcontent3" id="settings">
                    <div style="display: flex;justify-content: flex-start;align-items: center;">
                        <h2><span class="history">Project Scheduling</span></h2>&emsp;&emsp;&emsp;
                        <div class="tab">
                            <button class="btn btn-primary" style="padding:8px;width:140%;" form="form6">UPDATE</button>
                        </div>
                    </div>
                    <br>
                    <form name="form6" id="form6" method="post" action="updatechat.jsp">
                        <input form="form6" type="hidden" name="pid" value="<%=pid%>"/>
                    </form>
                    <table style="width:100%;" class="tablestyle" cellspacing="10">
                        <%
                        rs=stm.executeQuery("select * from pdetails where pid='"+pid+"'");
                        while(rs.next())
                        {
                        %>
                        <tr>
                            <td><h4>Start Date</h4></td>
                            <td><input form="form6" type="date" id="sdate" value="<%=rs.getString("start_date")%>" name="sdate" class="selectstyle" onchange="checkdate()"/></td>
                            <td><h4>End Date</h4></td>
                            <td><input form="form6" type="date" id="edate" value="<%=rs.getString("end_date")%>" name="edate" class="selectstyle" onchange="checkdate()"/></td>
                        </tr>
                        <tr>
                            <td><h4>Project Plan<br>Start Date</h4></td>
                            <td><input form="form6" type="date" id="psdate" value="<%=rs.getString("ps_date")%>" name="psdate" class="selectstyle" onchange="checkdate1()"/></td>
                            <td><h4>Project Plan<br>End Date</h4></td>
                            <td><input form="form6" type="date" id="pedate" value="<%=rs.getString("pe_date")%>" name="pedate" class="selectstyle" onchange="checkdate1()"/></td>
                        </tr>
                        <tr>
                            <td><h4>Requirements<br>Start Date</h4></td>
                            <td><input form="form6" type="date" id="rsdate" value="<%=rs.getString("rs_date")%>" name="rsdate" class="selectstyle" onchange="checkdate1()"/></td>
                            <td><h4>Requirements<br>End Date</h4></td>
                            <td><input form="form6" type="date" id="redate" value="<%=rs.getString("re_date")%>" name="redate" class="selectstyle" onchange="checkdate1()"/></td>
                        </tr>
                        <tr>
                            <td><h4>Design<br>Start Date</h4></td>
                            <td><input form="form6" type="date" id="dsdate" value="<%=rs.getString("ds_date")%>" name="dsdate" class="selectstyle" onchange="checkdate1()"/></td>
                            <td><h4>Design<br>End Date</h4></td>
                            <td><input form="form6" type="date" id="dedate" value="<%=rs.getString("de_date")%>" name="dedate" class="selectstyle" onchange="checkdate1()"/></td>
                        </tr>
                        <tr>
                            <td><h4>Implementation<br>Start Date</h4></td>
                            <td><input form="form6" type="date" id="isdate" value="<%=rs.getString("is_date")%>" name="isdate" class="selectstyle" onchange="checkdate1()"/></td>
                            <td><h4>Implementation<br>End Date</h4></td>
                            <td><input form="form6" type="date" id="iedate" value="<%=rs.getString("ie_date")%>" name="iedate" class="selectstyle" onchange="checkdate1()"/></td>
                        </tr>
                        <tr>
                            <td><h4>Testing<br>Start Date</h4></td>
                            <td><input form="form6" type="date" id="tsdate" value="<%=rs.getString("ts_date")%>" name="tsdate" class="selectstyle" onchange="checkdate1()"/></td>
                            <td><h4>Testing<br>End Date</h4></td>
                            <td><input form="form6" type="date" id="tedate" value="<%=rs.getString("te_date")%>" name="tedate" class="selectstyle" onchange="checkdate1()"/></td>
                        </tr>
                        <%
                        }
                        %>
                    </table>


                </div>
                <%
                for(int i=0;i<=count2;i++){
                    String id = "";
                    if(i==0){
                        id="tchat";
                    }
                    else{
                        id=role_count[i-1]+"1";
                    }
                    
                %>
                <div style="margin-top:15px;" id="<%=id%>" class="tabcontent3">
                    <form name="form1<%=i%>" id="form1<%=i%>" method="post" action="updatechat.jsp">
                        <%
                        if(id=="tchat"){
                        %>
                        <input form="form1<%=i%>" type="hidden" name="status" value="pchat"/>
                        <%    
                        }
                        else{
                        %>
                        <input form="form1<%=i%>" type="hidden" name="status" value="pchat1"/>
                        <%
                        }%>
                        <input form="form1<%=i%>" type="hidden" name="pid" value="<%=pid%>"/>
                        <input form="form1<%=i%>" type="hidden" name="uid" value="<%=uid%>"/>
                        <input form="form1<%=i%>" type="hidden" name="roles" value="<%=roles[i]%>"/>
                        <input form="form1<%=i%>" type="hidden" name="date1" value=""/>
                        <input form="form1<%=i%>" type="hidden" name="time1" value=""/>
                        <input form="form1<%=i%>" type="hidden" name="no" value="<%=i%>"/>
                    </form>
                    <form name="form2<%=i%>" id="form2<%=i%>" method="post" action="projectview.jsp">
                        <input form="form2<%=i%>" type="hidden" name="pid" value="<%=pid%>"/>
                        <input form="form2<%=i%>" type="hidden" name="no" value="<%=i%>"/>
                    </form>
                    <div class="chat">
                        <br>
                        <div style="margin:3px;" class="input">
                            <table style="width:100%; border-collapse: collapse;">
                                <tr>
                                    <td style="width:10%;">
                                        <button form="form2<%=i%>" style="border:none; background-color:white;"><img title="Refresh" src="refresh.png" width="70%" height="40px" alt="no img"/></button>
                                    </td>
                                    <td align="right" style="width:70%;">
                                        <textarea id="input" form="form1<%=i%>" style="padding-right:35px;" class="chatinput" rows="2" cols="50" placeholder="Text Here" type="text" name="message"></textarea>
                                        
                                    </td>
                                    <td align="center" style="width:5%;">
                                        <div class="popup">
                                            <label for="imgInp<%=i%>">
                                                
                                                <img src="attachment.jpg" style="margin-top:6px;" width="35px" height="35px"/>
                                            </label>
                                            <input form="form1<%=i%>" accept="image/*" type='file' name="chatphoto" id="imgInp<%=i%>" />
                                            <span class="popuptext" id="myPopup<%=i%>">
                                                <img id="blah<%=i%>" src="#" alt="your image" width="150px" height="100px"/>
                                            </span>
                                        </div>
                                    </td>
                                    <td align="left" style="width:15%;">
                                        <div style="margin-bottom: 0px;">
                                            <button type="button" style="margin-bottom:3px;" class="btn right btn-primary" onclick="update<%=i%>()">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
                                                <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
                                                </svg>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr>
                        <div class="tableview">
                            <table style="width:100%;border-collapse: initial;" cellspacing="20" > 
                                <%
                                SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy"); 
                                String sql11 = " ";
                                if(id!="tchat"){
                                    sql11="select distinct(date1) from pchat1 where pid='"+secret.encode((String)pid)+"' and roles='"+roles[i]+"' ORDER BY date1 DESC";
                                }
                                else{
                                    sql11="select distinct(date1) from pchat where pid='"+secret.encode((String)pid)+"' ORDER BY date1 DESC";
                                }
                                rs1=stm1.executeQuery(sql11);
                                while(rs1.next())
                                {
                                    Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("date1"));   
                                %>
                                <tr>
                                    <td style="width:40%; text-align:left; " id="demo"></td>
                                    <td style="width:20%; text-align:center; "><%=formatter.format(date1)%></td>
                                    <td style="width:40%; text-align:right; "></td>
                                </tr>
                                <%
                                if(id!="tchat"){
                                    sql11="select * from pchat1 inner join empl on uid=empid where pid='"+secret.encode((String)pid)+"' and roles='"+roles[i]+"' and date1='"+rs1.getString("date1")+"' ORDER BY time1 DESC;";
                                }
                                else{
                                    sql11="select * from pchat inner join empl on uid=empid where pid='"+secret.encode((String)pid)+"' and date1='"+rs1.getString("date1")+"' ORDER BY time1 DESC;";
                                }
                                rs=stm.executeQuery(sql11);
                                while(rs.next())
                                {
                                if(rs.getString("uid").equals(uid))
                                {
                                %>
                                <tr>
                                    <td style="width:40%; text-align:left; "></td>
                                    <td style="width:20%; text-align:center; "></td>
                                    <td style="width:40%; text-align:right; ">
                                        <div class="tab11">
                                            <div class="sender"><b><u>You</u></b></div>
                                                        <%
                                                            if (rs.getString("photo") != null && rs.getString("filetype").indexOf("image") != -1) {
                                                        %>
                                            <div class="msg"><a href="<%=rs.getString("photo")%>" target="_blank"><img src="<%=rs.getString("photo")%>" width="150px" height="100px"/></a></div>
                                            <%
                                                        }
                                                    else if(rs.getString("photo")!=null && rs.getString("filetype").indexOf("image")==-1){
                                                    %>
                                            <div class="msg"><a href="<%=rs.getString("photo")%>" target="_blank"><img src="document.jpg" width="150px" height="100px"/></a></div>
                                                    <%
                                                    }
                                                    %>
                                            <div class="msg"><%=secret.decode(rs.getString("message"))%></div>
                                            <div style="font-size:7pt;text-align: left;"><%=rs.getString("time1")%></div>
                                        </div>
                                    </td>
                                </tr>
                                <%
                                }
                                else
                                {
                                %>
                                <tr>
                                    <td style="width:40%; text-align:left; ">
                                        <div class="tab11">
                                            <div class="sender"><b><u><%=rs.getString("fname")%></u></b></div>
                                                        <%
                                                            if (rs.getString("photo") != null && rs.getString("filetype").indexOf("image") != -1) {
                                                        %>
                                            <div class="msg"><a href="<%=rs.getString("photo")%>" target="_blank"><img src="<%=rs.getString("photo")%>" width="150px" height="100px"/></a></div>
                                            <%
                                                        }
                                                    else if(rs.getString("photo")!=null && rs.getString("filetype").indexOf("image")==-1){
                                                    %>
                                            <div class="msg"><a href="<%=rs.getString("photo")%>" target="_blank"><img src="document.jpg" width="150px" height="100px"/></a></div>
                                                    <%
                                                    }
                                                    %>
                                            <div class="msg"><%=secret.decode(rs.getString("message"))%></div>
                                            <div style="font-size:7pt;text-align: right;"><%=rs.getString("time1")%></div>
                                        </div>
                                    </td>
                                    <td style="width:20%; text-align:center; "></td>
                                    <td style="width:40%; text-align:right; "></td>
                                </tr>
                                <%
                                }
                                }
                                }
                                %>
                            </table>
                        </div>
                    </div>
                </div>
                <%
                }
                %>
            </div>
        </section>

        <%
        }
        catch(Exception e)
        {
        %>
        <%=e.getMessage()%>
        <%
    }
        %>
        <script src="drop_drag.js"></script>
        <script>
                                                if (document.getElementById("imgInp"))
                                                {
                                                    imgInp.onchange = evt => {
                                                        const [file] = imgInp.files;
                                                        if (file) {
                                                            blah.src = URL.createObjectURL(file);
                                                            blah.style.display = "block";
                                                            myPopup.classList.toggle("show");
                                                        }
                                                    };
                                                }
                                                if (document.getElementById("imgInp0"))
                                                {
                                                    imgInp0.onchange = evt => {
                                                        const [file] = imgInp0.files;
                                                        if (file) {
                                                            blah0.src = URL.createObjectURL(file);
                                                            blah0.style.display = "block";
                                                            myPopup0.classList.toggle("show");
                                                        }
                                                    };
                                                }
                                                if (document.getElementById("imgInp1"))
                                                {
                                                    imgInp1.onchange = evt => {
                                                        const [file] = imgInp1.files;
                                                        if (file) {
                                                            blah1.src = URL.createObjectURL(file);
                                                            blah1.style.display = "block";
                                                            myPopup1.classList.toggle("show");
                                                        }
                                                    };
                                                }
                                                if (document.getElementById("imgInp2"))
                                                {
                                                    imgInp2.onchange = evt => {
                                                        const [file] = imgInp2.files;
                                                        if (file) {
                                                            blah2.src = URL.createObjectURL(file);
                                                            blah2.style.display = "block";
                                                            myPopup2.classList.toggle("show");
                                                        }
                                                    };
                                                }
                                                if (document.getElementById("imgInp3"))
                                                {
                                                    imgInp3.onchange = evt => {
                                                        const [file] = imgInp3.files;
                                                        if (file) {
                                                            blah3.src = URL.createObjectURL(file);
                                                            blah3.style.display = "block";
                                                            myPopup3.classList.toggle("show");
                                                        }
                                                    };
                                                }
        </script>
        <script>
            var no = document.getElementById("click").value;
            if (document.getElementById("default2" + no + ""))
            {
                document.getElementById("default11").click();
                document.getElementById("default2" + no + "").click();
            } else {
                if (document.getElementById("default20")) {
                    document.getElementById("default20").click();
                }
                if (document.getElementById("default1"))
                {
                    document.getElementById("default1").click();
                }


            }
            if (document.getElementById("default"))
            {
                document.getElementById("default").click();
            }


            /*for(let i=0;i<5;i++)
             { 
             if(document.getElementById("default1"+i)) 
             { document.getElementById("default1"+i).click(); }
             }*/
            function checkdate()
            {
                var start = document.getElementById("sdate").value;
                var end = document.getElementById("edate").value;
                if (start.length > 0 && end.length > 0)
                {
                    let date1 = new Date(start);
                    let date2 = new Date(end);
                    var duration = (date2 - date1) / (1000 * 60 * 60 * 24) + 1;
                    if (duration < -1)
                    {
                        document.form1.edate.value = "";
                        document.form1.edate.focus();
                        alert("End date can't be before Stsrt date");
                    } else
                    {
                        var timing = [5, 25, 20, 30, 20];
                        var timing1 = [0, 0, 0, 0, 0];
                        var total = 0;
                        for (let i = 0; i < timing.length; i++)
                        {
                            timing1[i] = (timing[i] * duration / 100).toFixed();
                            total += parseInt(timing1[i]);
                        }
                        if (Math.abs(duration - total) !== 0)
                        {
                            timing1[timing.length - 1] = parseInt(timing1[timing.length - 1]) + duration - total;
                        }
                        var dates = "";
                        document.getElementById('psdate').value = start;
                        dates = returndate(date1, timing1[0] - 1);
                        document.getElementById('pedate').value = dates;
                        dates = returndate(date1, 1);
                        document.getElementById('rsdate').value = dates;
                        dates = returndate(date1, timing1[1] - 1);
                        document.getElementById('redate').value = dates;
                        dates = returndate(date1, 1);
                        document.getElementById('dsdate').value = dates;
                        dates = returndate(date1, timing1[2] - 1);
                        document.getElementById('dedate').value = dates;
                        dates = returndate(date1, 1);
                        document.getElementById('isdate').value = dates;
                        dates = returndate(date1, timing1[3] - 1);
                        document.getElementById('iedate').value = dates;
                        dates = returndate(date1, 1);
                        document.getElementById('tsdate').value = dates;
                        dates = returndate(date1, timing1[4] - 1);
                        document.getElementById('tedate').value = dates;
                    }
                }
            }
            function returndate(date, days)
            {
                var dates = [];
                date.setDate(parseInt(date.getDate()) + parseInt(days));
                dates.push(date.getFullYear());
                if (parseInt(date.getMonth()) + 1 > 9)
                    dates.push(parseInt(date.getMonth()) + 1);
                else
                    dates.push("0" + (parseInt(date.getMonth()) + parseInt(1)));
                if (date.getDate() > 9)
                    dates.push(date.getDate());
                else
                    dates.push("0" + date.getDate());
                return dates.join("-");
            }
            function checkdate1()
            {
                let sdate = new Date(document.form6.sdate.value);
                let edate = new Date(document.form6.edate.value);
                let psdate = new Date(document.form6.psdate.value);
                let pedate = new Date(document.form6.pedate.value);
                let rsdate = new Date(document.form6.rsdate.value);
                let redate = new Date(document.form6.redate.value);
                let dsdate = new Date(document.form6.dsdate.value);
                let dedate = new Date(document.form6.dedate.value);
                let isdate = new Date(document.form6.isdate.value);
                let iedate = new Date(document.form6.iedate.value);
                let tsdate = new Date(document.form6.tsdate.value);
                let tedate = new Date(document.form6.tedate.value);
                if ((pedate - psdate) < 0)
                {
                    document.form6.pedate.value = "";
                    document.form6.pedate.focus();
                    return;
                }
                if ((redate - rsdate) < 0)
                {
                    document.form6.redate.value = "";
                    document.form6.redate.focus();
                    return;
                }
                if ((dedate - dsdate) < 0)
                {
                    document.form6.dedate.value = "";
                    document.form6.dedate.focus();
                    return;
                }
                if ((iedate - isdate) < 0)
                {
                    document.form6.iedate.value = "";
                    document.form6.iedate.focus();
                    return;
                }
                if ((tedate - tsdate) < 0)
                {
                    document.form6.tedate.value = "";
                    document.form6.edate.value = "";
                    document.form6.tedate.focus();
                    return;
                }
                if ((rsdate - pedate) / (1000 * 60 * 60 * 24) != 1)
                {
                    let dates = [];
                    pedate.setDate(parseInt(pedate.getDate() + 1));
                    dates.push(pedate.getFullYear());
                    if (parseInt(pedate.getMonth()) + 1 > 9)
                        dates.push(parseInt(pedate.getMonth()) + 1);
                    else
                        dates.push("0" + (parseInt(pedate.getMonth()) + parseInt(1)));
                    if (pedate.getDate() > 9)
                        dates.push(pedate.getDate());
                    else
                        dates.push("0" + pedate.getDate());
                    document.form6.rsdate.value = dates.join("-");
                    checkdate1();
                }
                if ((dsdate - redate) / (1000 * 60 * 60 * 24) != 1)
                {
                    let dates = [];
                    redate.setDate(parseInt(redate.getDate() + 1));
                    dates.push(redate.getFullYear());
                    if (parseInt(redate.getMonth()) + 1 > 9)
                        dates.push(parseInt(redate.getMonth()) + 1);
                    else
                        dates.push("0" + (parseInt(redate.getMonth()) + parseInt(1)));
                    if (redate.getDate() > 9)
                        dates.push(redate.getDate());
                    else
                        dates.push("0" + redate.getDate());
                    document.form6.dsdate.value = dates.join("-");
                    checkdate1();
                }
                if ((isdate - dedate) / (1000 * 60 * 60 * 24) != 1)
                {
                    let dates = [];
                    dedate.setDate(parseInt(dedate.getDate() + 1));
                    dates.push(dedate.getFullYear());
                    if (parseInt(dedate.getMonth()) + 1 > 9)
                        dates.push(parseInt(dedate.getMonth()) + 1);
                    else
                        dates.push("0" + (parseInt(dedate.getMonth()) + parseInt(1)));
                    if (dedate.getDate() > 9)
                        dates.push(dedate.getDate());
                    else
                        dates.push("0" + dedate.getDate());
                    document.form6.isdate.value = dates.join("-");
                    checkdate1();
                }
                if ((tsdate - iedate) / (1000 * 60 * 60 * 24) != 1)
                {
                    let dates = [];
                    iedate.setDate(parseInt(iedate.getDate() + 1));
                    dates.push(iedate.getFullYear());
                    if (parseInt(iedate.getMonth()) + 1 > 9)
                        dates.push(parseInt(iedate.getMonth()) + 1);
                    else
                        dates.push("0" + (parseInt(iedate.getMonth()) + parseInt(1)));
                    if (iedate.getDate() > 9)
                        dates.push(iedate.getDate());
                    else
                        dates.push("0" + iedate.getDate());
                    document.form6.tsdate.value = dates.join("-");
                    checkdate1();
                }
                if ((edate - tedate) != 0)
                {
                    let dates = [];
                    tedate.setDate(parseInt(tedate.getDate() + 1));
                    dates.push(tedate.getFullYear());
                    if (parseInt(tedate.getMonth()) + 1 > 9)
                        dates.push(parseInt(tedate.getMonth()) + 1);
                    else
                        dates.push("0" + (parseInt(tedate.getMonth()) + parseInt(1)));
                    if (tedate.getDate() > 9)
                        dates.push(tedate.getDate());
                    else
                        dates.push("0" + tedate.getDate());
                    document.form6.edate.value = dates.join("-");
                    checkdate1();
                }
            }
            function opentab1(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent1");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks1");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
            function opentab2(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent2");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks2");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
            function opentab3(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent3");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks3");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
            function opentab10(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent10");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks10");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
            function opentab11(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent11");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks11");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
            function opentab12(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent12");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks12");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
            function opentab13(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent13");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks13");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
            function opentab14(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent14");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks14");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
            function timeoutput(date) {
                var hr = "", min = "", sec = "";
                if (date.getHours() < 10)
                    hr = "0" + date.getHours();
                else
                    hr = date.getHours();

                if (date.getMinutes() < 10)
                    min = "0" + date.getMinutes();
                else
                    min = date.getMinutes();

                if (date.getSeconds() < 10)
                    sec = "0" + date.getSeconds();
                else
                    sec = date.getSeconds();

                return hr + ":" + min + ":" + sec;
            }
            function update0()
            {
                var date1 = new Date();
                document.form10.date1.value = date1.getFullYear() + "-" + (parseInt(date1.getMonth()) + 1) + "-" + date1.getDate();
                document.form10.time1.value = timeoutput(date1);
                if (document.getElementById('imgInp0').value !== "")
                {
                    document.form10.action = "FileUploadServlet";
                    document.form10.enctype = "multipart/form-data";
                }
                document.form10.submit();
            }
            function update1()
            {
                var date1 = new Date();
                document.form11.date1.value = date1.getFullYear() + "-" + (parseInt(date1.getMonth()) + 1) + "-" + date1.getDate();
                document.form11.time1.value = timeoutput(date1);
                if (document.getElementById('imgInp1').value !== "")
                {
                    document.form11.action = "FileUploadServlet";
                    document.form11.enctype = "multipart/form-data";
                }
                document.form11.submit();
            }
            function update2()
            {
                var date1 = new Date();
                alert(date1);
                document.form12.date1.value = date1.getFullYear() + "-" + (parseInt(date1.getMonth()) + 1) + "-" + date1.getDate();
                alert(document.form12.date1.value);
                document.form12.time1.value = timeoutput(date1);
                alert(document.form12.time1.value);
                if (document.getElementById('imgInp2').value !== "")
                {
                    document.form12.action = "FileUploadServlet";
                    document.form12.enctype = "multipart/form-data";
                }
                document.form12.submit();
            }
            function update3()
            {
                var date1 = new Date();
                document.form13.date1.value = date1.getFullYear() + "-" + (parseInt(date1.getMonth()) + 1) + "-" + date1.getDate();
                document.form13.time1.value = timeoutput(date1);
                if (document.getElementById('imgInp3').value !== "")
                {
                    document.form13.action = "FileUploadServlet";
                    document.form13.enctype = "multipart/form-data";
                }
                document.form13.submit();
            }
            function update4()
            {
                var date1 = new Date();
                document.form14.date1.value = date1.getFullYear() + "-" + (parseInt(date1.getMonth()) + 1) + "-" + date1.getDate();
                document.form14.time1.value = timeoutput(date1);
                if (document.getElementById('imgInp4').value !== "")
                {
                    document.form14.action = "FileUploadServlet";
                    document.form14.enctype = "multipart/form-data";
                }
                document.form14.submit();
            }
            function update5(count, status)
            {
                document.getElementById("status").value = status;
                document.getElementById('form5' + count).submit();
            }
            function delete1(pid,doc,role){
                var status = confirm("Do you want to delete "+role+" document?");
                if(status===true){
                    location.href='updatechat.jsp?status=delete&pid='+pid+'&dID='+doc+'&roles1='+role+'';
                }
            }
            function submit1(no)
            {
                document.getElementById("count").value = no;
                alert("form3" + no);
                document.getElementById("form3" + no).submit();
            }
            function emoji(value) {
                var arr = document.getElementById('input').value.split('');
                arr.splice(document.getElementById('input').selectionStart, 0, String.fromCodePoint(value));
                document.getElementById('input').value = arr.join('');
                document.getElementById('demo').innerHTML=document.getElementById('input').value;
                document.getElementById('smily-btn').click();
            }
            $("[data-toggle=popover]").popover({
                html: true,
                trigger: 'click',
                content: function () {
                    var content = $(this).attr("data-popover-content");
                    return $(content).children(".popover-body").html();
                }
            });
        </script>    
    </body>
</html>

