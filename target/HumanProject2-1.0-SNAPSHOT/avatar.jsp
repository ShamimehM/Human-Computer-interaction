<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.acit4045.human.commons.User"%>
<%@page import="com.acit4045.human.commons.Profile"%>

<%@include file="WEB-INF/jspf/loginCheck.jspf"%>
<%@include file="WEB-INF/jspf/dbConnection.jspf"%>

<%
    Profile userProfile = (Profile) pageContext.getSession().getAttribute("UserProfile");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Your Avatar</title>
    <link rel="stylesheet" href="styles.css">

</head>
<body>
    <div class="avatar-container">
        <h2>Select Your Avatar</h2>
        <div class="avatars">
            <img src="Untitledjm.png" id="avatar1" onclick="chooseAvatar('avatar1')" class="avatar">
            <img src="istockphoto.jpg" id="avatar2" onclick="chooseAvatar('avatar2')" class="avatar">
        </div>
        <div id="dialogue" style="display:none;">
            <p id="avatarText">How are you today?</p>
            <input type="text" id="response" placeholder="Write your answer">
            <button onclick="saveResponse()">Submit</button>
        </div>
    </div>
    <script src="avatar.js"></script>
</body>
</html>
