
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<%@ Page Language="C#" %>
<% 
/* 
 *Copyright (C) 2017 Peter Varney - All Rights Reserved
 * You may use, distribute and modify this code under the
 * terms of the MIT license, 
 *
 * You should have received a copy of the MIT license with
 * this file. If not, visit : https://github.com/fatalwall/BridgeDirectConnect
 */ 
 %>
<%@ Import Namespace="System.Web.Configuration" %>
<%@ Import Namespace="System.IO" %>
<head>
    <title>Bridge Directory Connect</title>
    <link rel="stylesheet" type="text/css" href="/theme/Style.css" />
    <link rel="stylesheet" type="text/css" href="/theme/StyleForm.css" />
    <link rel="icon" href="/theme/favicon.ico" type="image/vnd.microsoft.icon">
</head>

<body>
    <div class="container">
        <div class="logo"><img src="/theme/logo.png" alt="Logo" height="100" /></div>
        <div class="message">
            <p>Please enter your Bridge Access Code so that Bridge Direct Connect can generate access details for your meeting.</p>
            <div>
                <form name="contact_form" action="" method="post">
                    <p>
                        <label for="accessCode">Access Code: </label>
                        <input type="number" min="1000000" max="9999999" id="accessCode" name="accessCode" required="required" placeholder="0000000" /><br />
		            </p>

                    <p>
                        <button class="submit" type="submit" name="action" value="invite">Create Calendar Invite Details</button>  <button class="submit" type="submit" name="action" value="join">Join Meeting</button> 
                    </p>  
                </form>
            </div>
			<%
			//Determine if the primary mode of operation is Windows auth or anonymous 
			bool PrimaryWindowsAuth = true;
			Configuration webConfig = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath); 
			ConfigurationSection cs = webConfig.GetSection("system.webServer");

			if (cs != null)
			{
				XDocument xml = XDocument.Load(new StringReader(cs.SectionInformation.GetRawXml()));
				//Response.Write(xml.ToString().Contains("<!-- <action type=\"Rewrite\" url=\"External/?AccessCode={R:1}\" /> -->"));
				if (xml.ToString().Contains("<action type=\"Rewrite\" url=\"Internal/?AccessCode={R:1}\" />")==true) {
					PrimaryWindowsAuth = true;
				}else{
					PrimaryWindowsAuth = false;
				}
			}
			
			%>
			<% if (String.IsNullOrEmpty(Request["action"])==false && Request["action"]=="invite" && String.IsNullOrEmpty(Request["accessCode"])==false) { %>
			<div class="Calendar" align="left">
				<hr />
				<h1>Add to the location of your calandar invite</h1>
				<% =ConfigurationSettings.AppSettings["MeetingNumber"] %>,,<% =Request["accessCode"] %>,#
				
				<hr />
				<h1>Add to the Body of your calandar invite</h1>
				<h2>Join Meeting Web Presentation</h2>
				
				<% if (PrimaryWindowsAuth==true) { %>
				<div><% =ConfigurationSettings.AppSettings["Company"] %> Employees: <a href="<% =Request.Url.GetLeftPart(UriPartial.Authority) %>/<% =Request["accessCode"] %>"><% =Request.Url.GetLeftPart(UriPartial.Authority) %>/<% =Request["accessCode"] %></a></div>
				<div>Vendors/Contractors/Other: <a href="<% =Request.Url.GetLeftPart(UriPartial.Authority) %>/External/<% =Request["accessCode"] %>"><% =Request.Url.GetLeftPart(UriPartial.Authority) %>/External/<% =Request["accessCode"] %></a></div>
				<% } else { %>
				<div>Join Meeting: <a href="<% =Request.Url.GetLeftPart(UriPartial.Authority) %>/<% =Request["accessCode"] %>"><% =Request.Url.GetLeftPart(UriPartial.Authority) %>/<% =Request["accessCode"] %></a></div>
				<% } %>
				
				<h3>If for some reason the above links to do not work please revert to AT&T's portal</h3>
				<div><a href="<% =ConfigurationSettings.AppSettings["attURL"] %>"><% =ConfigurationSettings.AppSettings["attURL"] %></a></div>
				<div>Meeting Number: <% =ConfigurationSettings.AppSettings["MeetingNumber"] %></div>
				<div>Access Code: <% =Request["accessCode"] %></div>
			</div>
			<% } else if (String.IsNullOrEmpty(Request["action"])==false && Request["action"]=="join" && String.IsNullOrEmpty(Request["accessCode"])==false) { 
			var redirectURL = Request.Url.GetLeftPart(UriPartial.Authority) + "/" + Request["accessCode"];
			%>
			<script type="text/javascript">
				<!--
				window.location.replace("<% =redirectURL %>");
				//-->
			</script>
			<% } %>
			
        </div>
    </div>
</body>
</html>
