<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/dbConnection.jspf"%>
<%
    Statement stmt = null;

    try{
        stmt = con.createStatement();
    }catch (SQLException e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="login-container">
        <h2>Login to your account </h2>
        <form id="loginForm">
            <label for="username:">Username</label>
            <input type="text" id="username" placeholder="Enter Username">

            <label for="password:">Password</label>
            <input type="password" id="password" placeholder="Enter Password">

            <button type="submit">Login</button>
            <p id="error-message" style="color: red; display: none;">Invalid username or password</p>
        </form>
    </div>

    <script>
document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent the form from submitting

    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const errorMessage = document.getElementById('error-message');

    // Predefined user credentials
    const validUsers = {
        <%
        try{
             stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select user_name, password from users");
            int i = 0;
            while(rs.next()){%>
                <%if(i!=0)%><%=","%>
                <%=rs.getString(1)%>: '<%=rs.getString(2)%>'
            <%i++;}
          }catch(SQLException e){
          e.printStackTrace();
        }%>
    };

    // Check if username exists and password matches
    if (validUsers[username] && validUsers[username] === password) {
        errorMessage.style.display = 'none'; // Hide error message
        alert('Login successful! Welcome ' + username + '!');
        // Redirect to another page or take further actions here
    } else {
        errorMessage.style.display = 'block'; // Show error message
    }
    // After successful login:
    if (validUsers[username] && validUsers[username] === password) {
        window.location.href = 'login.jsp?user='+username; // Redirect to avatar page
    }

});
    </script>
</body>
</html>
