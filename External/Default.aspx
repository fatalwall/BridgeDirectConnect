
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
	<link rel="stylesheet" type="text/css" href="/theme/StyleForm.css" />
	<link rel="icon" href="/theme/favicon.ico" type="image/vnd.microsoft.icon">
</head>

<body>
    <div class="container">
        <div class="logo"><img src="/theme/logo.png" alt="Logo" height="100" /></div>
        <div class="UserID">
            <p>Anonymous</p>
        </div>
        <div class="message">
            <p>Bridge Direct Connect requires the following details to connect you to your meeting.</p>
            <div>
                <form name="contact_form" action="https://www.teleconference.att.com/servlet/ATTClogin" method="get">
                    <input type="hidden" name="process" value="1" />
					<input type="hidden" name="brand" value="<% =ConfigurationSettings.AppSettings["Brand"] %>" />
					<input type="hidden" name="meetingNumber" value="<% =ConfigurationSettings.AppSettings["MeetingNumber"] %>" />
					
					<% if (String.IsNullOrEmpty(Request["AccessCode"])==false && Request["AccessCode"].Length>=7) { %>
                    <input type="hidden" name="code" value="<% =Request["AccessCode"] %>" />
                    <% } else { %>					
					<p>
                        <label for="code">Access Code: </label>
						<input type="number" min="1000000" max="9999999" id="code" name="code" required="required" placeholder="0000000" /><br />
		            </p>
					<% } %>
                    <p>
                        <label for="firstName">First Name: </label>
                        <input type="text" id="firstName" name="firstName" required="required" placeholder="Enter your first name" /><br />
		            </p>
                    <p>
                        <label for="lastName">Last Name: </label>
                        <input type="text" id="lastName" name="lastName" required="required" placeholder="Enter your last name" /><br />
		            </p>
                    <p>
                        <label for="email">E-mail: </label>
                        <input type="email" id="email" name="email" required="required" placeholder="john_doe@example.com" /><br />
		            </p>
                    <p>
                        <button class="submit" type="submit">Join Meeting</button>  
                    </p>  
                </form>
            </div>
        </div>
    </div>
</body>
</html>
