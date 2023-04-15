<%@page import="java.sql.*"%>
<%@page import="sun.misc.*"%>
<%@page import="Secret.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="logo.jpg">
        <link rel="stylesheet" href="drop_drag.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <title>PDMS</title>
        <style>
            *{
                margin:0px;
                box-sizing: border-box;
            }
            body{
                font-family: arial;
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
            
            .main-content{
                width:80%;
                margin:0 auto;
                padding:20px;
                border-radius:20px;
                background-color:white;
                border:2px solid blue;
            }
            .img-text{
                top:-55px;
                height:0px;
                width: 205px;
                text-align: center;
                font-size:20pt;
                position: relative; 
                cursor: pointer;
            }
            .tabcontent{
                margin:0 auto;
                width:90%;
                display:none;
                padding:20px;
            }
            
            .inputstyle{
                width:90%;
                height:8%;
                padding:10px;
                font-size:20px;
                font-weight: lighter;
            }
            .selectstyle{
                width:90%;
                font-size:20px;
                font-weight: lighter;
            }
            textarea {
                resize: none;
            }
            .active span{
                color:white;
            }
        </style>
    </head>
    <body>
    <%!
    public static boolean check(String[] arr,int count,String check){
        for(int i=0;i<count;i++){
            if(arr[i].equals(check)) return true;
        }
        return false;
    }    
    %>
    <%
    try{    
    
        Connection con = (Connection)session.getAttribute("connection");
        Statement stm = con.createStatement();
        ResultSet rs = null;
        Secret secret = new Secret();
        String uid = (String)session.getAttribute("uid");
        String uname = (String)session.getAttribute("uname");
        String udesi = (String)session.getAttribute("udesi");
        String status = (String)request.getParameter("status");
        String pid = (String)request.getParameter("pid");
        String title = "";
        String desc = "";
        String pmid = "";
        String[] rid = new String[10];
        String[] did = new String[10] ;
        String[] iid = new String[10] ;
        String[] tid = new String[10] ;
        int tcount=0,icount=0,dcount=0,rcount=0;
        String budget = "";
        String resource = "";
        String sdate = "";
        String edate = "";
        String psdate = "";
        String pedate = "";
        String rsdate = "";
        String redate = "";
        String dsdate = "";
        String dedate = "";
        String isdate = "";
        String iedate = "";
        String tsdate = "";
        String tedate = "";
        
        if(pid!=null){
            rs = stm.executeQuery("select * from plist inner join pdetails on plist.pid=pdetails.pid where plist.pid ='"+pid+"'");
            while(rs.next()){
                title = rs.getString("pname");
                desc = rs.getString("description");
                pmid = rs.getString("pm_id");
                budget = secret.decode(rs.getString("budget"));
                resource = secret.decode(rs.getString("resources"));
                sdate = rs.getString("start_date");
                edate = rs.getString("end_date");
                psdate = rs.getString("ps_date");
                pedate = rs.getString("pe_date");
                rsdate = rs.getString("rs_date");
                redate = rs.getString("re_date");
                dsdate = rs.getString("ds_date");
                dedate = rs.getString("de_date");
                isdate = rs.getString("is_date");
                iedate = rs.getString("ie_date");
                tsdate = rs.getString("ts_date");
                tedate = rs.getString("te_date");
                if(rs.getString("roles").equals("Requirements Gathering")){ rid[rcount]=rs.getString("m_id"); rcount++;}
                else if(rs.getString("roles").equals("Design")){ did[dcount] = rs.getString("m_id") ; dcount++;}
                else if(rs.getString("roles").equals("Implementation")){ iid[icount] = rs.getString("m_id"); icount++;}
                else if(rs.getString("roles").equals("Testing")){ tid[tcount] = rs.getString("m_id"); tcount++;}
            }
            for(int i=0; i<dcount;i++){
                %><%=did[i]%><%
            }
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
            <%
                
            %>
            
            <form id="form1" name="form1" method="post" action="validation.jsp" onsubmit="return validation()">
                <input type="hidden" name="pid" value="<%=pid%>"/>
            </form>
            <div class="main-content">
                <div style="display:flex;flex-direction: column;align-items: center;">
                <div style="justify-content: center;display:flex;align-items:center;">
                    <img class="tablinks" id="imgt" onclick="opentab('title','imgt','textt')" src="arrow2.png" width="205"/>
                    <img class="tablinks" id="imgr" onclick="opentab('roles','imgr','textr')" src="arrow2.png" width="205"/>
                    <img class="tablinks" id="imgb" onclick="opentab('brs','imgb','textb')" src="arrow2.png" width="205"/>
                    <img onclick="validation()" src="arrow2.png" width="205"/>
                   
                </div>
                <div style="justify-content: center;display:flex;align-items:center;">
                    <div id="textt" class="img-text" onclick="opentab('title','imgt','textt')">Title</div>
                    <div id="textr" class="img-text" onclick="opentab('roles','imgr','textr')" >Roles</div>
                    <div id="textb" class="img-text" onclick="opentab('brs','imgb','textb')">Schedule</div>
                    <div class="img-text" onclick="validation()">Submit</div>
                </div>
                </div>
                <hr/>
                <div class="sub-content">
                    <div id="title" class="tabcontent" style='padding-left:30px;'>
                        <h2>Project Title</h2>
                        <%
                        %>
                        <input value="<%=title%>" form="form1" type='text' name='title' class='inputstyle'/>
                        <%%>
                        <br><br><br>
                        <h2>Project Description</h2>
                        <textarea value="description" form="form1" rows='13' cols='70' name='desc' width='90%' height='60%' style="font-size:20px;"><%=desc%></textarea>
                    </div>
                    <div id="roles" class="tabcontent">
                        <table class='center' style='width:90%;' cellpadding='20'>
                            <tr>
                                <td align='right'><h2>Project Manager</h2></td>
                                <td>
                                    <select form="form1" name='pmid' class='selectstyle'>
                                        <option>Select the project manager</option>
                                        <%
                                        rs=stm.executeQuery("select * from empl where desi='"+secret.encode("Project Manager")+"'");
                                        while(rs.next())
                                        {
                                            if(pmid.equals(rs.getString("empid"))){
                                                %>
                                                <option value='<%=rs.getString("empid")%>' selected><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                                            <%
                                            }
                                            else{
                                        %>
                                            <option value='<%=rs.getString("empid")%>'><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                                        <%
                                        }
                                        }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td align='right'><h2>Requirements Analyst</h2></td>
                                <td>
                                    <select form="form1" name='rid' class='selectstyle' size="3" multiple>
                                        <optgroup label="Select the member/members">
                                        <%
                                        rs=stm.executeQuery("select * from empl where desi='"+secret.encode("Member")+"'");
                                        while(rs.next())
                                        {
                                            if(check(rid,rcount,rs.getString("empid"))){
                                                %>
                                            <option value='<%=rs.getString("empid")%>' selected><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                                        <%
                                            }
                                            else{
                                        %>
                                            <option value='<%=rs.getString("empid")%>'><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                                        <%
                                            }
                                        }
                                        %>
                                        </optgroup>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td align='right'><h2>Design</h2></td>
                                <td>
                                    <select form="form1" name='did' class='selectstyle' size="3" multiple>
                                        <optgroup label="Select the member/members">
                                        <%
                                        rs=stm.executeQuery("select * from empl where desi='"+secret.encode("Member")+"'");
                                        while(rs.next())
                                        {
                                            if(check(did,dcount,rs.getString("empid"))){
                                                 %>
                                                 <option value='<%=rs.getString("empid")%>' selected><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                                        <%
                                            }
                                            else{
                                        %>
                                            <option value='<%=rs.getString("empid")%>'><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                                        <%
                                        }}
                                        %>
                                        </optgroup>
                                    </select>
                                </td>
                            </tr>
                            <tr>    
                                <td align='right'><h2>Implementation</h2></td>
                                <td>
                                    <select form="form1" name='iid' class='selectstyle' size="3" multiple>
                                        <optgroup label="Select the member/members">
                                        <%
                                        rs=stm.executeQuery("select * from empl where desi='"+secret.encode("Member")+"'");
                                        while(rs.next())
                                        {
                                            if(check(iid,icount,rs.getString("empid"))){
                                                %>
                                                <option value='<%=rs.getString("empid")%>' selected><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                                        <%
                                            }
                                            else{
                                                
                                        %>
                                            <option value='<%=rs.getString("empid")%>'><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                                        <%
                                        }
                                            }
                                        %>
                                        </optgroup>
                                    </select>
                                </td>
                            </tr>
                            <tr>    
                                <td align='right'><h2>Testing</h2></td>
                                <td>
                                    <select form="form1" name='tid' class='selectstyle' size="3" multiple>
                                        <optgroup label="Select the member/members">
                                        <%
                                        rs=stm.executeQuery("select * from empl where desi='"+secret.encode("Member")+"'");
                                        while(rs.next())
                                        {
                                            if(check(tid,icount,rs.getString("empid"))){
                                                %>
                                            <option value='<%=rs.getString("empid")%>' selected><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                                        <%
                                            }
                                            else{
                                        %>
                                            <option value='<%=rs.getString("empid")%>'><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                                        <%
                                        }}
                                        %>
                                        </optgroup>
                                    </select>
                                </td>
                        </table>
                    </div>
                    <div id="brs" class="tabcontent">
                        <table style='width:100%;'>
                            <tr>
                                <td align='center' style=""><h3>Budget</h3></td>
                                <td><input value="<%=budget%>" form="form1" type="text" name="budget" id="budget" class="selectstyle" style="width:100%;"/></td>
                                <td align='center'><h3>Resource</h3></td>
                                <td><textarea form="form1" rows=2 cols=20 name="resource" class="selectstyle" style="width:90%;"><%=resource%></textarea></td>
                            </tr>
                            <tr>
                                <td colspan="4" align="left"><h2>Scheduling</h2></td>
                            </tr>
                            <tr>
                                <td colspan="4"><br></td>
                            </tr>
                            <tr>
                                <td><h5>Start Date</h5></td>
                                <td><input value="<%=sdate%>" form="form1" type="date" id="sdate" name="sdate" class="selectstyle" onchange="checkdate()"/></td>
                                <td><h5>End Date</h5></td>
                                <td><input value="<%=edate%>" form="form1" type="date" id="edate" name="edate" min="sdate" class="selectstyle" onchange="checkdate()"/></td>
                            </tr>
                            <tr>
                                <td><h5>Project Plan<br>Start Date</h5></td>
                                <td><input value="<%=psdate%>" form="form1" type="date" id="psdate" name="psdate" class="selectstyle"/></td>
                                <td><h5>Project Plan<br>End Date</h5></td>
                                <td><input value="<%=pedate%>" form="form1" type="date" id="pedate" name="pedate" min="psdate" class="selectstyle"/></td>
                            </tr>
                            <tr>
                                <td><h5>Requirements<br>Start Date</h5></td>
                                <td><input value="<%=rsdate%>" form="form1" type="date" id="rsdate" name="rsdate" class="selectstyle"/></td>
                                <td><h5>Requirements<br>End Date</h5></td>
                                <td><input value="<%=redate%>" form="form1" type="date" id="redate" value="2022-09-06" name="redate" min="rsdate" class="selectstyle"/></td>
                            </tr>
                            <tr>
                                <td><h5>Design<br>Start Date</h5></td>
                                <td><input value="<%=dsdate%>" form="form1" type="date" id="dsdate" name="dsdate" class="selectstyle"/></td>
                                <td><h5>Design<br>End Date</h5></td>
                                <td><input value="<%=dedate%>" form="form1" type="date" id="dedate" name="dedate" min="rsdate" class="selectstyle"/></td>
                            </tr>
                            <tr>
                                <td><h5>Implementation<br>Start Date</h5></td>
                                <td><input value="<%=isdate%>" form="form1" type="date" id="isdate" name="isdate" class="selectstyle"/></td>
                                <td><h5>Implementation<br>End Date</h5></td>
                                <td><input value="<%=iedate%>" form="form1" type="date" id="iedate" name="iedate" min="rsdate" class="selectstyle"/></td>
                            </tr>
                            <tr>
                                <td><h5>Testing<br>Start Date</h5></td>
                                <td><input value="<%=tsdate%>" form="form1" type="date" id="tsdate" name="tsdate" class="selectstyle"/></td>
                                <td><h5>Testing<br>End Date</h5></td>
                                <td><input value="<%=tedate%>" form="form1" type="date" id="tedate" name="tedate" min="rsdate" class="selectstyle"/></td>
                            </tr>
                        </table>
                    </div> 
                </div>
            </div>
        </section>
    <%
    }
    catch(Exception e)
    {
        %><%=e%><%
    }
    %>
        <script src="drop_drag.js"></script>
        <script>
            document.getElementById('imgt').click();
            function opentab(operator,img,text) 
            {
                var i, tabcontent, tablinks,imgtext;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].src="arrow2.png";
                }
                imgtext = document.getElementsByClassName("img-text");
                for (i = 0; i < imgtext.length; i++) {
                    imgtext[i].style.color="black";
                }
                document.getElementById(text).style.color = "white";
                document.getElementById(operator).style.display = "block";
                document.getElementById(img).src="arrow1.png";
            }
            function validation()
            {
                if(document.form1.title.value.length<=0)
                {
                    opentab('title','imgt','textt')
                    document.getElementById('imgt').click();
                    document.form1.title.focus();
                    alert("Project Title Can't be Empty");
                    return false;
                }
                if(document.form1.desc.value.length<=0)
                {
                    opentab('title','imgt','textt')
                    document.form1.desc.focus();
                    alert("Project Description Can't be Empty");
                    return false;
                }
                if(document.form1.rid.selectedIndex == -1)
                {
                    opentab('roles','imgr','textr')
                    document.form1.rid.focus();
                    alert("Assign anyone for Requirement Gathering");
                    return false;
                }
                if(document.form1.did.selectedIndex == -1)
                {
                    opentab('roles','imgr','textr')
                    document.form1.did.focus();
                    alert("Assign anyone for Designing");
                    return false;
                }
                if(document.form1.iid.selectedIndex == -1)
                {
                    opentab('roles','imgr','textr')
                    document.form1.iid.focus();
                    alert("Assign anyone for Implementation");
                    return false;
                }
                if(document.form1.tid.selectedIndex == -1)
                {
                    opentab('roles','imgr','textr')
                    document.form1.tid.focus();
                    alert("Assign anyone for Testing");
                    return false;
                }
                if(document.form1.budget.value.length<=0)
                {
                    opentab('brs','imgb','textb')
                    document.form1.budget.focus();
                    alert("Budget Can't be Empty");
                    return false;
                }
                if(isNaN(document.form1.budget.value))
                {
                    opentab('brs','imgb','textb')
                    document.form1.budget.focus();
                    alert("Budget should contain only digits");
                    return false;
                }
                if(document.form1.resource.value.length<=0)
                {
                    opentab('brs','imgb','textb')
                    document.form1.resource.focus();
                    alert("Resource Can't be Empty");
                    return false;
                }
                if(document.form1.sdate.value.length<=0)
                {
                    opentab('brs','imgb','textb')
                    document.form1.sdate.focus();
                    alert("Start Date Can't be Empty");
                    return false;
                }
                if(document.form1.edate.value.length<=0)
                {
                    opentab('brs','imgb','textb')
                    document.form1.edate.focus();
                    alert("End Date Can't be Empty");
                    return false;
                }
                document.form1.submit();
            }
            function checkdate()
            {
                var start = document.getElementById("sdate").value;
                var end = document.getElementById("edate").value;
                if(start.length>0 && end.length>0)
                {
                    let date1 = new Date(start);
                    let date2 = new Date(end);
                    var duration = (date2-date1)/(1000*60*60*24) + 1;
                    if(duration<-1)
                    {
                        document.form1.edate.value="";
                        document.form1.edate.focus();
                        alert("End date can't be before Stsrt date");
                    }
                    else
                    {
                    var timing = [5,25,20,30,20];
                    var timing1 = [0,0,0,0,0];  
                    var total = 0;
                    for(let i=0;i<timing.length;i++)
                    {
                      timing1[i]= (timing[i]*duration/100).toFixed();
                      total+=parseInt(timing1[i]);
                    }
                    if(Math.abs(duration - total) !== 0)
                    {
                      timing1[timing.length - 1] = parseInt(timing1[timing.length - 1]) +  duration - total;
                    }
                    var dates = "";
                    document.getElementById('psdate').value=start;
                    dates = returndate(date1,timing1[0]-1);
                    document.getElementById('pedate').value=dates;
                    dates = returndate(date1,1);
                    document.getElementById('rsdate').value=dates;
                    dates = returndate(date1,timing1[1]-1);
                    document.getElementById('redate').value=dates;
                    dates = returndate(date1,1);
                    document.getElementById('dsdate').value=dates;
                    dates = returndate(date1,timing1[2]-1);
                    document.getElementById('dedate').value=dates;
                    dates = returndate(date1,1);
                    document.getElementById('isdate').value=dates;
                    dates = returndate(date1,timing1[3]-1);
                    document.getElementById('iedate').value=dates;
                    dates = returndate(date1,1);
                    document.getElementById('tsdate').value=dates;
                    dates = returndate(date1,timing1[4]-1);
                    document.getElementById('tedate').value=dates;
                    }
                }
            }
            function returndate(date,days)  
            {
                var dates = [];
                date.setDate(parseInt(date.getDate()) + parseInt(days));
                dates.push(date.getFullYear());
                if(parseInt(date.getMonth())+1>9)
                    dates.push(parseInt(date.getMonth())+1);
                else
                    dates.push("0"+(parseInt(date.getMonth())+parseInt(1)));
                if(date.getDate()>9)
                    dates.push(date.getDate());
                else
                    dates.push("0"+date.getDate());
                return dates.join("-");
            }
        </script>
    </body>
</html>

