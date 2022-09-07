<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Document list</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 30px}
.style15 {font-size: 14px; font-weight: bold; color: #3366FF; }
.style16 {
	color: #FF3300;
	font-weight: bold;
	font-size: 14px;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1 class="style1">Detecting and Removing Web Application Vulnerabilities with Static Analysis and Data Mining</h1>
      </div>
    </div>
  </div>
  <div class="menu_nav">
    <div class="menu_nav_resize">
	<%String user=(String)application.getAttribute("user");%>
      <ul>
        <li><a href="usermain.jsp">Home</a></li>
        <li><a href="#"><%=user%></a></li>
        <li><a href="userlogin.jsp">logout</a></li>
      </ul>
    </div>
  </div>
  <div class="hbg">
    <div class="hbg_resize"> <img src="images/hbg_bg.jpg" width="970" height="215" alt="" /> </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Searched Document Results   </span></h2>
          <p>&nbsp;</p>
          <p align="justify">
          <table width="766" height="131">

<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<%@page
	import="java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

      <%
		String key=request.getParameter("key"); 
		String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13;
		int i=0,m=0;
		ArrayList al=new ArrayList();
		try
		{				
			
			
			String sql1="select * from a_documents  ";
			Statement st1=connection.createStatement();
			ResultSet rs1=st1.executeQuery(sql1);
			while(rs1.next())
			{
				i=rs1.getInt(1);
				s1=rs1.getString(2);
				s2=rs1.getString(3);
				s3=rs1.getString(4);
				s4=rs1.getString(5);	
				s5=rs1.getString(6);
				
			//Content decryption
				String keys = "ef50a0ef2c3e3a5f";
				byte[] keyValue = keys.getBytes();
				Key key1 = new SecretKeySpec(keyValue, "AES");
				Cipher c = Cipher.getInstance("AES");
				c.init(Cipher.DECRYPT_MODE, key1);
				String d_content = new String(Base64.decode(s5.getBytes()));
				
				
				if((d_content.contains(key)) || (s2.contains(key)) || (s4.contains(key)) ) //|| (s3.contains(key))
				{
					al.add(s4);	
				if(m==0)
				{
					%>
			<tr>
					<td width="64" height="41" align="center" valign="middle"><span class="style15">Owner</span></td>
					<td width="188" align="center" valign="middle"><span class="style15">Document Name </span></td>
					<td width="80" align="center" valign="middle"><span class="style15">Image</span></td>
					<td width="273" align="center" valign="middle"><span class="style15">Document Use</span></td>
					<td width="137" align="center" valign="middle"><span class="style15">Download</span></td>
			</tr>		
				<%}m=1;%>	
			<tr>
					<td align="center" valign="middle"><%=s1%></td>
					<td align="center" valign="middle"><%=s2%></td>
					<td align="center" valign="middle"><img src="profile_pic.jsp?id=<%=i%>&amp;type=<%="document"%>" height="70" width="70" /></td>
					<td align="center" valign="middle"><%=s3%></td>
					<td align="center" valign="middle"><a href="u_download1.jsp?id=<%=i%>&fname=<%=s4%>&key=<%=key%>"><%=s4%></a></td>
			</tr>
			<%
					
				}
			}
				if(al.isEmpty())
				{
				%>
				<h3 class="style16">No Documents found</h3>
				<%
				}
				connection.close();
			}
			catch(Exception e)
			{
				out.println(e.getMessage());
			}
			%>
		</table>
		  </p>
         
        </div>
     <div align="right">
       <p><a href="u_searchdocs.jsp">Back</a></p>
     </div>
      </div>
	  
      <!--<div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="usermain.jsp">Home</a></li>
            <li><a href="userlogin.jsp">Logout</a></li>
          </ul>
        </div>
       
      </div>-->
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>Image Gallery</h2>
        <a href="#" class="nobg"><img src="images/pix1.jpg" width="92" height="92" alt="" class="ad" /></a> <a href="#" class="nobg"><img src="images/pix2.jpg" width="92" height="92" alt="" class="ad" /></a> <a href="#" class="nobg"><img src="images/pix3.jpg" width="92" height="92" alt="" class="ad" /></a> <a href="#" class="nobg"><img src="images/pix4.jpg" width="92" height="92" alt="" class="ad" /></a> <a href="#" class="nobg"><img src="images/pix5.jpg" width="92" height="92" alt="" class="ad" /></a> <a href="#" class="nobg"><img src="images/pix6.jpg" width="92" height="92" alt="" class="ad" /></a>
        <div class="clr"></div>
      </div>
      <div class="col c2">
        <h2>&nbsp;</h2>
        <img src="images/white.jpg" width="93" height="92" alt="" />
        <p>&nbsp;</p>
      </div>
      <div class="col c3">
        <h2>&nbsp;</h2>
        <img src="images/white.jpg" width="64" height="64" alt="" />
        <p>&nbsp;</p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer"></div>
</div>
</body>
</html>
