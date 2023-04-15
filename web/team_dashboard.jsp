<%@page import="java.sql.*"%>
<%@page import="sun.misc.*"%>
<%@page import="Secret.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Expires", "0");
            response.setDateHeader("Expires", -1);
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
            .ctab{
                padding:5px;
                display:flex;
                margin:20px 0;
                font-size:20px;
                cursor: pointer;
                transition: 0.3s;
                border-radius:20px;
                align-items: center;
                border:1px solid black;
                justify-content: space-evenly;
            }
            .ctab:hover{
                transform: scale(1.02);
            }
            .ctab div{
                padding:4px;
            }
            .content{
                width:80%;
                margin:0 auto;
            }
            .content-title{
                text-align: center;
            }
            .content-tab1{
                width:90%;
                display: flex;
                border:1px solid black;
                flex-direction:column;
            }
            .main-content{
                padding:20px;
                border-radius:20px;
                background-color:white;
                border:2px solid blue;
            }
            .range{
                width:200px;
                height:15px;
                -webkit-appearance:none;
                background:#e3e5fc;
                outline:none;
                border-radius:15px;
                overflow:hidden;
                box-shadow:inset 0 0 5px rgba(0,0,0,1);
            }
            .range::-webkit-slider-thumb{
                -webkit-appearance:none;
                width:15px;
                height:15px;
                border-radius:50%;
                background:#00fd0a;
                border:4px solid #00fd0a;
                box-shadow: -407px 0 0 400px #00fd0a;
            }
            .resource{
                margin-left:50px;
            }
            .resource ul li{
                font-size: 15pt;
            }
            .chartBox {
                width: 700px;
                padding: 20px;
                border-radius: 20px;
                border: solid 3px rgba(255, 26, 104, 1);
                background: white;
            }
            .tabcontent1{
                display:none;
            }
        </style>
    </head>
    <body>
        <%!
            public int percentage(Connection con, String pid, String SDP) {
                int percent = 0;
                try {
                    Statement stm1 = con.createStatement();
                    ResultSet rs1 = null;

                    if (SDP != null) {
                        percent += 10;
                    }
                    rs1 = stm1.executeQuery("select distinct(roles),dstatus from plist where pid='" + pid + "'");
                    while (rs1.next()) {
                        if (rs1.getString("roles").equals("Requirements Gathering") && rs1.getString("dstatus").equals("COMPLETED")) {
                            percent += 20;
                        } else if (rs1.getString("roles").equals("Design") && rs1.getString("dstatus").equals("COMPLETED")) {
                            percent += 20;
                        } else if (rs1.getString("roles").equals("Implementation") && rs1.getString("dstatus").equals("COMPLETED")) {
                            percent += 30;
                        } else if (rs1.getString("roles").equals("Testing") && rs1.getString("dstatus").equals("COMPLETED")) {
                            percent += 20;
                        }
                    }
                } catch (Exception E) {
                }
                return percent;
            }
        %>
        <%
            try {

                Connection con = (Connection) session.getAttribute("connection");
                Statement stm = con.createStatement();
                ResultSet rs = null;
                Statement stm1 = con.createStatement();
                ResultSet rs1 = null;
                Secret secret = new Secret();
                String uid = (String) session.getAttribute("uid");
                String uname = (String) session.getAttribute("uname");
                String udesi = (String) session.getAttribute("udesi");
                int Ccount = 0;
                int Acount = 0;
                String sql1 = "select distinct(pid) from plist where pstatus='ACTIVE' and " + udesi + " = '" + uid + "'";
                if (udesi.equals("admin")) {
                    sql1 = "select distinct(pid) from plist where pstatus='ACTIVE'";
                }
                rs = stm.executeQuery(sql1);
                while (rs.next()) {
                    Acount++;
                }
                sql1 = "select distinct(pid) from plist where pstatus='COMPLETED' and " + udesi + " = '" + uid + "'";
                if (udesi.equals("admin")) {
                    sql1 = "select distinct(pid) from plist where pstatus='COMPLETED'";
                }
                rs = stm.executeQuery(sql1);
                while (rs.next()) {
                    Ccount++;
                }
                int countp = 0;
                int[] pids = new int[50];
                sql1 = "select distinct(pid) from plist where " + udesi + " = '" + uid + "'";
                if (udesi.equals("admin")) {
                    sql1 = "select distinct(pid) from plist";
                }
                rs = stm.executeQuery(sql1);
                while (rs.next()) {
                    pids[countp] = Integer.parseInt(rs.getString("pid"));
                    countp++;
                }
        %>
        <header>
            <div class="main-header">
                <div style="display:flex;align-items:center;">
                    <div class="header-title" style="display:flex;justify-content:flex-start;align-items: center;">
                        <img src="logo.jpg" width="50" height="50" alt="no img"/>
                        <h2>Task Management System</h2>
                    </div>&emsp;&emsp;
                    <div class="header-icon"><i id='default' class="fa fa-home tablinks" onclick="opentarget(event, 'main')"></i></div>
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
        <section id='main' class='tabcontent'>
            <div class="main-tab">
                <div class="tab1">
                    <h4>Completed Projects</h4>&emsp;
                    <h4>:</h4>&emsp;
                    <h4><%=Ccount%></h4>
                </div>
                <div class="tab1">
                    <h4>Ongoing Projects</h4>&emsp;
                    <h4>:</h4>&emsp;
                    <h4><%=Acount%></h4>
                </div>
            </div>
            <div class="main-course" style="min-height:60vh;overflow-y:auto;">
                <div style="display:flex; align-items:center;">
                    <h2>PROJECTS : </h2>
                    <%
                        if (udesi == "admin") {
                    %>
                    &emsp;&emsp;<a href="createproject.jsp" class="btn btn-success">Create Project</a>
                    &emsp;&emsp;<a href="signup.jsp" class="btn btn-primary">Add Members</a>
                    <%
                        }
                    %>
                </div>
                <br>
                <div>
                    <%
                        for (int i = 0; i < countp && countp > 0; i++) {
                            rs = stm.executeQuery("select distinct(pid),pname from plist where pid ='" + pids[i] + "'");
                            while (rs.next()) {
                                rs1 = stm1.executeQuery("select end_date,SDP from pdetails where pid='" + rs.getString("pid") + "'");
                                while (rs1.next()) {
                                    int percent = percentage(con, rs.getString("pid"), rs1.getString("SDP"));
                    %>
                    <div class="ctab tablinks" onclick="opentarget(event, '<%=rs.getString("pid")%>')">
                        <div><%=rs.getString("pname")%></div>
                        <div>|</div>
                        <div>
                            <input class="range" type="range" value="<%=percent%>" min="0" max="100" onmousedown="return false">
                            &ensp;&ensp;&ensp;&ensp;
                            <span style="font-weight:bolder;font-size:20px; "><%=percent%>%</span>
                        </div>
                        <div>|</div>
                        <div style="color:red;"><%=rs1.getString("end_date")%></div>
                    </div>
                    <%
                                }
                            }
                        }
                    %>
                </div>
            </div>
        </section> 
        <%
            for (int i = 0; i < countp && countp > 0; i++) {
                int countu = 0;
                String[] uids = new String[50];
                String[] unames = new String[50];
                String[] roles = new String[50];

                rs = stm.executeQuery("select distinct(pm_id),fname,lname from plist inner join empl on pm_id=empid where plist.pid ='" + pids[i] + "'");
                while (rs.next()) {
                    uids[countu] = rs.getString("pm_id").trim();
                    unames[countu] = (rs.getString("fname") + " " + rs.getString("lname")).trim();
                    countu++;
                }
                rs = stm.executeQuery("select distinct(m_id),fname,lname from plist inner join empl on m_id=empid where plist.pid ='" + pids[i] + "'");
                while (rs.next()) {
                    uids[countu] = rs.getString("m_id").trim();
                    unames[countu] = (rs.getString("fname") + " " + rs.getString("lname")).trim();
                    countu++;
                }
                for (int j = 0; j < countu; j++) {
                    if (j == 0) {
                        roles[j] = "Project Manager";
                    } else {
                        roles[j] = "";
                        rs = stm.executeQuery("select * from plist where pid ='" + pids[i] + "'and m_id='" + uids[j] + "'");
                        int count = 0;
                        while (rs.next()) {
                            if (count == 0) {
                                roles[j] = rs.getString("roles");
                            } else {
                                roles[j] += ", " + rs.getString("roles");
                            }
                            count++;
                        }
                    }
                }
                rs = stm.executeQuery("select distinct(plist.pid),pname,description,resources,budget,ps_date,pe_date,rs_date,re_date,ds_date,de_date,is_date,ie_date,ts_date,te_date,SDP from plist inner join pdetails on plist.pid=pdetails.pid where plist.pid ='" + pids[i] + "'");
                while (rs.next()) {
                    int percent = 0;
                    if (rs.getString("SDP") != null) {
                        percent += 10;
                    }
                    rs1 = stm1.executeQuery("select distinct(roles),dstatus from plist where pid='" + rs.getString("plist.pid") + "'");
                    while (rs1.next()) {
                        if (rs1.getString("roles").equals("Requirements Gathering") && rs1.getString("dstatus").equals("COMPLETED")) {
                            percent += 20;
                        } else if (rs1.getString("roles").equals("Design") && rs1.getString("dstatus").equals("COMPLETED")) {
                            percent += 20;
                        } else if (rs1.getString("roles").equals("Implementation") && rs1.getString("dstatus").equals("COMPLETED")) {
                            percent += 30;
                        } else if (rs1.getString("roles").equals("Testing") && rs1.getString("dstatus").equals("COMPLETED")) {
                            percent += 20;
                        }
                    }
        %>

        <section id='<%=rs.getString("plist.pid")%>' class='tabcontent'>
            <div class='content'>
                <br>
                <div class="main-tab">
                    <div class="tab1">
                        <h4>BUDGET</h4>&emsp;
                        <h4>:</h4>&emsp;
                        <h4><i class="fa fa-rupee-sign"></i><%=secret.decode(rs.getString("budget"))%></h4>
                    </div>
                    <div class="tab1">
                        <h4>COMPLETION</h4>&emsp;
                        <h4>:</h4>&emsp;
                        <h4><input class="range" type="range" value="<%=percent%>" min="0" max="100" onmousedown="return false">&ensp;&ensp;<span style="font-weight:bolder;font-size:20px; "><%=percent%>%</span></h4>
                    </div>

                </div>
                <br>
                <div id='<%=rs.getString("plist.pid") + "_content"%>' class="main-content tabcontent1">
                    <h1 class='content-title'><%=rs.getString("plist.pname")%></h1>
                    <div class="tab" style='flex-direction:column;align-items:flex-start;'>
                        <h2>Scope</h2>
                        <div>
                            <%=rs.getString("description")%>
                        </div>
                        <br><br>
                        <h2>Roles</h2>
                        <%
                            for (int j = 0; j < countu; j++) {
                        %>
                        <div class="ctab" onclick="location.href = 'profile.jsp?uid=' +<%=uids[j]%>">
                            <div><%=uids[j]%> - <%=unames[j]%></div>
                            <div>|</div>
                            <div><%=roles[j]%></div>
                        </div>
                        <%
                            }
                        %>
                        <br><br>
                        <h2>Resources</h2>
                        <div class="resource">
                            <ul>
                                <%
                                    String[] resource = secret.decode(rs.getString("resources")).split(",");
                                    for (int k = 0; k < resource.length; k++) {
                                %>
                                <li><%=resource[k]%></li>
                                    <%
                                        }
                                    %>
                            </ul>
                        </div>
                        <form name="form<%=rs.getString("plist.pid")%>" id="form<%=rs.getString("plist.pid")%>" method="post" action="projectview.jsp">
                            <input type="hidden" name="pid" value="<%=rs.getString("plist.pid")%>"/>
                        </form>
                        <form name="form1<%=rs.getString("plist.pid")%>" id="form1<%=rs.getString("plist.pid")%>" method="post" action="createproject.jsp">
                            <input type="hidden" name="pid" value="<%=rs.getString("plist.pid")%>"/>
                            <input type="hidden" name="status" value="edit"/>
                        </form>
                        <center>
                            <button type="button" class="btn btn-primary" onclick="opentab(event, '<%=rs.getString("plist.pid") + "_gantt"%>')">Gantt Chart</button>
                            <%
                                if (!udesi.equals("admin")) {
                            %>
                            <button type="button" class="btn btn-success" onclick="submit1('<%=rs.getString("plist.pid")%>')">Go To Work</button>
                            <%
                            } else {
                            %>
                            <button type="button" class="btn btn-success" onclick="submit11('<%=rs.getString("plist.pid")%>')">Edit Details</button>
                            <button type="button" class="btn btn-danger" onclick="delete11('<%=rs.getString("plist.pid")%>','<%=rs.getString("pname")%>')">Remove</button>
                            <%
                            }
                            %>
                        </center>
                    </div>
                </div>
                <div id='<%=rs.getString("plist.pid") + "_gantt"%>' class="main-content tabcontent1">   
                    <input type="hidden" id="psdate<%=rs.getString("plist.pid")%>" value="<%=rs.getString("ps_date")%>"/>
                    <input type="hidden" id="pedate<%=rs.getString("plist.pid")%>" value="<%=rs.getString("pe_date")%>"/>
                    <input type="hidden" id="rsdate<%=rs.getString("plist.pid")%>" value="<%=rs.getString("rs_date")%>"/>
                    <input type="hidden" id="redate<%=rs.getString("plist.pid")%>" value="<%=rs.getString("re_date")%>"/>
                    <input type="hidden" id="dsdate<%=rs.getString("plist.pid")%>" value="<%=rs.getString("ds_date")%>"/>
                    <input type="hidden" id="dedate<%=rs.getString("plist.pid")%>" value="<%=rs.getString("de_date")%>"/>
                    <input type="hidden" id="isdate<%=rs.getString("plist.pid")%>" value="<%=rs.getString("is_date")%>"/>
                    <input type="hidden" id="iedate<%=rs.getString("plist.pid")%>" value="<%=rs.getString("ie_date")%>"/>
                    <input type="hidden" id="tsdate<%=rs.getString("plist.pid")%>" value="<%=rs.getString("ts_date")%>"/>
                    <input type="hidden" id="tedate<%=rs.getString("plist.pid")%>" value="<%=rs.getString("te_date")%>"/>
                    <h2><span class="history">GANTT CHART</span></h2>
                    <br>
                    <center>
                        <div class="chartBox">
                            <canvas id="myChart<%=rs.getString("plist.pid")%>"></canvas>
                        </div>
                        <br>
                        <button type="button" class="btn btn-danger" onclick="opentab(event, '<%=rs.getString("plist.pid") + "_content"%>')">Back</button>
                    </center>    
                </div> 
                <br><br>
            </div>
        </section>  
        <%
                }
            }
        } catch (Exception e) {
        %><%=e.getMessage()%><%
                    }
        %>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
        <script>
                    if (document.getElementById('default'))
                        document.getElementById('default').click();
                    function edit()
                    {
                        document.getElementById('view1').style.display = "none";
                        document.getElementById('view2').style.display = "block";
                    }
                    function edit1()
                    {
                        document.getElementById('view2').style.display = "none";
                        document.getElementById('view1').style.display = "block";
                    }
                    function validation()
                    {
                        if (isNaN(document.form2.phone.value))
                        {
                            document.form2.phone.focus();
                            alert("Phone Number Should Contain 10 Numberic Digits Only");
                            return false;
                        }
                        if (document.form2.phone.value.length !== 10)
                        {
                            document.form2.phone.focus();
                            alert("Phone Number Should Contain 10 Numberic Digits Only");
                            return false;
                        }
                        return true;
                    }
                    function submit1(n)
                    {
                        document.getElementById('form' + n).submit();
                    }
                    function submit11(n)
                    {
                        document.getElementById('form1' + n).submit();
                    }
                    function delete11(id,name){
                        var status = confirm("Do you want to delete all the details in Project \""+name+"\"?\n(warning: After deleteing data can't be recovered)");
                        if(status===true){
                            location.href='validation.jsp?status=delete&pid='+id+'';
                        }
                    }
                    function opentarget(evt, operator)
                    {
                        let i, tabcontent, tablinks;
                        let tabcontent1;
                        tabcontent = document.getElementsByClassName("tabcontent");
                        for (i = 0; i < tabcontent.length; i++) {
                            tabcontent[i].style.display = "none";
                        }
                        tabcontent1 = document.getElementsByClassName("tabcontent1");
                        for (i = 0; i < tabcontent.length; i++) {
                            tabcontent1[i].style.display = "none";
                        }
                        tablinks = document.getElementsByClassName("tablinks");
                        for (i = 0; i < tablinks.length; i++) {
                            tablinks[i].className = tablinks[i].className.replace("active", "");
                        }
                        document.getElementById(operator).style.display = "block";
                        document.getElementById(operator + "_content").style.display = "block";
                        evt.currentTarget.className += " active";
                    }

                    function returndate(date1, days)
                    {
                        var dates = [];
                        var date = new Date(date1);
                        date.setDate(parseInt(date.getDate()) + parseInt(days));
                        dates.push(date.getFullYear());
                        if (parseInt(date.getMonth()) + 1 > 9)
                            dates.push(parseInt(date.getMonth()) + parseInt(1));
                        else
                            dates.push("0" + parseInt((date.getMonth()) + parseInt(1)));
                        if (date.getDate() > 9)
                            dates.push(date.getDate());
                        else
                            dates.push("0" + date.getDate());
                        return dates.join("-");
                    }
                    function opentab(evt, operator)
                    {
                        var n = "";
                        var i, tabcontent, tablinks;
                        tabcontent = document.getElementsByClassName("tabcontent1");
                        for (i = 0; i < tabcontent.length; i++) {
                            tabcontent[i].style.display = "none";
                        }
                        tablinks = document.getElementsByClassName("tablinks");
                        for (i = 0; i < tablinks.length; i++) {
                            tablinks[i].className = tablinks[i].className.replace("active", "");
                        }
                        document.getElementById(operator).style.display = "block";
                        evt.currentTarget.className += " active";
                        let str = operator.split("_");
                        n = str[0];

                        const data = {
                            labels: ['Project Plan', 'Requirements', 'Design', 'Development', 'Testing'],
                            datasets: [{
                                    label: 'Gantt Chart',
                                    data: [
                                        [document.getElementById('psdate' + n).value, returndate(document.getElementById('pedate' + n).value, 1)],
                                        [document.getElementById('rsdate' + n).value, returndate(document.getElementById('redate' + n).value, 1)],
                                        [document.getElementById('dsdate' + n).value, returndate(document.getElementById('dedate' + n).value, 1)],
                                        [document.getElementById('isdate' + n).value, returndate(document.getElementById('iedate' + n).value, 1)],
                                        [document.getElementById('tsdate' + n).value, returndate(document.getElementById('tedate' + n).value, 1)]
                                    ],
                                    backgroundColor: [
                                        'rgba(255, 26, 104, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(255, 206, 86, 1)',
                                        'rgba(75, 192, 192, 1)',
                                        'rgba(153, 102, 255, 1)',
                                        'rgba(255, 159, 64, 1)',
                                        'rgba(0, 0, 0, 1)'
                                    ],
                                    borderColor: [
                                        'rgba(255, 26, 104, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(255, 206, 86, 1)',
                                        'rgba(75, 192, 192, 1)',
                                        'rgba(153, 102, 255, 1)',
                                        'rgba(255, 159, 64, 1)',
                                        'rgba(0, 0, 0, 1)'
                                    ],
                                    barPercentage: 0.2
                                }]
                        };

                        // config 
                        const config = {
                            type: 'bar',
                            data,
                            options: {
                                indexAxis: 'y',
                                scales: {
                                    x: {
                                        min: document.getElementById('psdate' + n).value,
                                        type: 'time',
                                        time: {
                                            unit: 'day'
                                        }
                                    },
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        };

                        // render init block
                        const myChart = new Chart(document.getElementById('myChart' + n), config);
                    }
        </script>    
    </body>
</html>

