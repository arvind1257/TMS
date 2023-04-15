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
        <title>PDMS</title>
        <script>
            function submit1()
            {
                if (document.getElementById("check").value === "done")
                {
                    alert("Successfully Submitted");
                    document.form1.submit();
                } else
                {
                    alert(document.getElementById("check").value);
                    history.back();
                }
            }
        </script>
    </head>
    <body onload="submit1()">
        <%!
            public String randomid(Connection con)
            {
                try
                {
                int max=999999,min=111111;
                int id = (int)(Math.random()*(max-min+1)+min);
                String id1 = Integer.toString(id);
                Statement stm1 = con.createStatement();
                ResultSet rs1 = null;
                rs1=stm1.executeQuery("select * from plist");
                while(rs1.next())
                {
                    if(id1.equals(rs1.getString("pid")))
                    {
                        id1 = randomid(con);
                        break;
                    }
                }
                return id1; 
                }
                catch(Exception e)
                {
                    return "0";
                }    
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
            String pid = randomid(con);
            if(request.getParameter("pid")!=null);
                pid=request.getParameter("pid");
            if(request.getParameter("status")!=null && request.getParameter("status").equals("delete")){
                PreparedStatement ps = con.prepareStatement("delete from plist where pid=?");
                ps.setString(1,pid);
                ps.executeUpdate();
                ps = con.prepareStatement("delete from pdetails where pid=?");
                ps.setString(1,pid);
                ps.executeUpdate();
                ps = con.prepareStatement("delete from pchat where pid=?");
                ps.setString(1,secret.encode(pid));
                ps.executeUpdate();
                ps = con.prepareStatement("delete from pchat1 where pid=?");
                ps.setString(1,secret.encode(pid));
                ps.executeUpdate();
                
            }
            else{
            String title = request.getParameter("title");
            String desc = request.getParameter("desc");
            String pmid = request.getParameter("pmid");
            String[] rid = request.getParameterValues("rid");
            String[] did = request.getParameterValues("did");
            String[] iid = request.getParameterValues("iid");
            String[] tid = request.getParameterValues("tid");
            String budget = request.getParameter("budget");
            String resource = request.getParameter("resource");
            String sdate = request.getParameter("sdate");
            String edate = request.getParameter("edate");
            String psdate = request.getParameter("psdate");
            String pedate = request.getParameter("pedate");
            String rsdate = request.getParameter("rsdate");
            String redate = request.getParameter("redate");
            String dsdate = request.getParameter("dsdate");
            String dedate = request.getParameter("dedate");
            String isdate = request.getParameter("isdate");
            String iedate = request.getParameter("iedate");
            String tsdate = request.getParameter("tsdate");
            String tedate = request.getParameter("tedate");
        
            String pstatus = "ACTIVE";
            String r_dstatus = "NOT COMPLETED";
            String d_dstatus = "NOT COMPLETED";
            String i_dstatus = "NOT COMPLETED";
            String t_dstatus = "NOT COMPLETED";
        
            String sdp = null;
            String srs = null;
            String sds = null;
            String imp = null;
            String treport = null; 
            String date_sdp = null;
            String date_srs = null;
            String date_sds = null;
            String date_imp = null;
            String date_treport = null;
        
            if(request.getParameter("pid")!=null){
                rs = stm.executeQuery("select * from plist where pid='"+pid+"'");
                while(rs.next()){
                    pstatus=rs.getString("pstatus");
                    if(rs.getString("roles").equals("Requirements Gathering")){ r_dstatus=rs.getString("dstatus");}
                    else if(rs.getString("roles").equals("Design")){ d_dstatus = rs.getString("dstatus") ; }
                    else if(rs.getString("roles").equals("Implementation")){ i_dstatus = rs.getString("dstatus"); }
                    else if(rs.getString("roles").equals("Testing")){ t_dstatus = rs.getString("dstatus"); }
                }
                rs = stm.executeQuery("select * from pdetails where pid='"+pid+"'");
                while(rs.next()){
                     sdp = rs.getString("sdp");
                     srs = rs.getString("srs");
                     sds = rs.getString("sds");
                     imp = rs.getString("imp");
                     treport = rs.getString("treport"); 
                     date_sdp = rs.getString("date_sdp");
                     date_srs = rs.getString("date_srs");
                     date_sds = rs.getString("date_sds");
                     date_imp = rs.getString("date_imp");
                     date_treport = rs.getString("date_treport");
                }
                PreparedStatement ps1 = con.prepareStatement("delete from pdetails where pid='"+pid+"'");
                ps1.executeUpdate();
                ps1 = con.prepareStatement("delete from plist where pid='"+pid+"'");
                ps1.executeUpdate();
            
            }
            for(int j=0;j<rid.length;j++)
            {
                PreparedStatement ps = con.prepareStatement("Insert into plist(pid,pname,admin,pm_id,m_id,pstatus,dstatus,roles) values(?,?,?,?,?,?,?,?)");
                ps.setString(1,pid);
                ps.setString(2,title);
                ps.setString(3,uid);
                ps.setString(4,pmid);
                ps.setString(5,rid[j].trim());
                ps.setString(6,pstatus);
                ps.setString(7,r_dstatus);
                ps.setString(8,"Requirements Gathering");
                ps.executeUpdate();
            }
            for(int j=0;j<did.length;j++)
            {
                PreparedStatement ps = con.prepareStatement("Insert into plist(pid,pname,admin,pm_id,m_id,pstatus,dstatus,roles) values(?,?,?,?,?,?,?,?)");
                ps.setString(1,pid);
                ps.setString(2,title);
                ps.setString(3,uid);
                ps.setString(4,pmid);
                ps.setString(5,did[j].trim());
                ps.setString(6,pstatus);
                ps.setString(7,d_dstatus);
                ps.setString(8,"Design");
                ps.executeUpdate();
            }
            for(int j=0;j<iid.length;j++)
            {
                PreparedStatement ps = con.prepareStatement("Insert into plist(pid,pname,admin,pm_id,m_id,pstatus,dstatus,roles) values(?,?,?,?,?,?,?,?)");
                ps.setString(1,pid);
                ps.setString(2,title);
                ps.setString(3,uid);
                ps.setString(4,pmid);
                ps.setString(5,iid[j].trim());
                ps.setString(6,pstatus);
                ps.setString(7,i_dstatus);
                ps.setString(8,"Implementation");
                ps.executeUpdate();
            }
            for(int j=0;j<tid.length;j++)
            {
                PreparedStatement ps = con.prepareStatement("Insert into plist(pid,pname,admin,pm_id,m_id,pstatus,dstatus,roles) values(?,?,?,?,?,?,?,?)");
                ps.setString(1,pid);
                ps.setString(2,title);
                ps.setString(3,uid);
                ps.setString(4,pmid);
                ps.setString(5,tid[j].trim());
                ps.setString(6,pstatus);
                ps.setString(7,t_dstatus);
                ps.setString(8,"Testing");
                ps.executeUpdate();
            }
            PreparedStatement ps = con.prepareStatement("Insert into pdetails(pid,start_date,end_date,ps_date,pe_date,rs_date,re_date,ds_date,de_date,is_date,ie_date,ts_date,te_date,description,resources,budget,sdp,date_sdp,srs,date_srs,sds,date_sds,imp,date_imp,treport,date_treport) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? )");
            ps.setString(1,pid);
            ps.setString(2,sdate);
            ps.setString(3,edate);
            ps.setString(4,psdate);
            ps.setString(5,pedate);
            ps.setString(6,rsdate);
            ps.setString(7,redate);
            ps.setString(8,dsdate);
            ps.setString(9,dedate);
            ps.setString(10,isdate);
            ps.setString(11,iedate);
            ps.setString(12,tsdate);
            ps.setString(13,tedate);
            ps.setString(14,desc);
            ps.setString(15,secret.encode(resource));
            ps.setString(16,secret.encode(budget));
            ps.setString(17,sdp);
            ps.setString(18,date_sdp);
            ps.setString(19,srs);
            ps.setString(20,date_srs);
            ps.setString(21,sds);
            ps.setString(22,date_sds);
            ps.setString(23,imp);
            ps.setString(24,date_imp);
            ps.setString(25,treport);
            ps.setString(26,date_treport);
            ps.executeUpdate();
            }
        }
        catch(Exception e)
        {
        %><input type="hidden" value="<%=e%>" id="check"/><%
        }
        %>
        
        <form name="form1" action="team_dashboard.jsp" method="post"></form>    
        <input type="hidden" value="done" id="check"/>
    </body>
</html>


