
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
<head>
    <title>Bridge Directory Connect</title>
    <link rel="stylesheet" type="text/css" href="/theme/Style.css" />
	<link rel="icon" href="/theme/favicon.ico" type="image/vnd.microsoft.icon">
</head>

<body>
    <%
        vshed.web.getWindowsUserInfo usrObj = new vshed.web.getWindowsUserInfo(User.Identity.Name);

		String MeetingNumber = ConfigurationSettings.AppSettings["MeetingNumber"];
		String Brand = ConfigurationSettings.AppSettings["Brand"];

		var redirectURL = "https://www.teleconference.att.com/servlet/ATTClogin?process=1&brand=" + Brand + "&meetingNumber=" + MeetingNumber + "&code=" + Request["AccessCode"] + "&firstName=" + usrObj.FirstName + "&lastName=" + usrObj.LastName + "&email=" + usrObj.Email;
    %>
    <div class="container">
        <div class="logo"><img src="/theme/logo.png" alt="Logo" height="100" /></div>
        <div class="UserID">
            <p><% =usrObj.Email.ToUpper() %></p>
        </div>
        <div class="message">
            <p>
                <%--<noscript>JavaScript appears to be turned off. Please click the link below.</noscript>--%>
            </p>
            <p>Bridge Direct Connect streamlines the processes of connecting to AT&T Teleconfrence Bridges. If you are not automatically redirected please click <a href="<% =redirectURL %>">Connect to AT&T Teleconfrence Bridge</a>.</p>
        </div>
        <script type="text/javascript">
            <!--
            window.location.replace("<% =redirectURL %>");
            //-->
        </script>
    </div>
</body>
</html>
