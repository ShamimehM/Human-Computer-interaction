<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/loginCheck.jspf"%>
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
    <title>Home Page</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="home.css">
</head>
<body>
    <div class="home-container">
        <h2>Welcome to Your Health Dashboard</h2>

        <!-- Food Section -->
        <div class="section" id="food-section">
            <h3>Food</h3>
            <p>Track your daily food intake here.</p>
            <button id="log-food">Log Food</button>
            <div id="food-log"></div>
        </div>

        <!-- Sleep Section -->
        <div class="section" id="sleep-section">
            <h3>Sleep</h3>
            <p>Record your sleeping hours.</p>
            <button id="log-sleep">Log Sleep</button>
            <div id="sleep-log"></div>
        </div>

        <!-- Exercise Section -->
        <div class="section" id="exercise-section">
            <h3>Exercise</h3>
            <p>Keep track of your exercise routines.</p>
            <button id="log-exercise">Log Exercise</button>
            <div id="exercise-log"></div>
        </div>
    </div>

    <!-- Bottom Navigation -->
    <div class="bottom-nav">
        <button id="home">Home</button>
        <button id="profile">Profile</button>
        <button id="notes">Notes</button>
        <button id="learning">Learning</button>
    </div>

    <script src="home.js"></script>
</body>
</html>