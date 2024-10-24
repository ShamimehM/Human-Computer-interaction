<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.acit4045.human.commons.Profile"%>

<%@include file="WEB-INF/jspf/loginCheck.jspf"%>
<%@include file="WEB-INF/jspf/dbConnection.jspf"%>

<%
    Profile userProfile = (Profile) pageContext.getSession().getAttribute("UserProfile");
    PreparedStatement pStmt = null;
    if(userProfile==null){
        try{
            String query2 = " select prf.profile_id, "+
                            " prf.name, "+
                            " prf.date_of_birth, "+
                            " prf.gender, "+
                            " prf.height, "+
                            " prf.weight, "+
                            " prf.profile_type, "+
                            " prf.parent_profile_id, "+
                            " prf.user_id "+
                            " from profiles prf "+
                            " where prf.user_id = ?";
            pStmt = con.prepareStatement(query2);
            pStmt.setString(1, userObj.getUserId());
            ResultSet rs = pStmt.executeQuery();
            if(rs.next()){
                userProfile = new Profile(rs.getString(1), rs.getString(2), rs.getString(3), 
                                      rs.getString(4), rs.getString(5), rs.getString(6),
                                      rs.getString(7), rs.getString(8), rs.getString(9));
            }
            pStmt.close();

            pageContext.getSession().setAttribute("UserProfile", userProfile);
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

<body>
    <div class="profile-container">
        <h2>Your Profile</h2>
        <p>Name: <span id="username"><%=userObj.getName()%></span></p>
        <p>Age: <span id="age"></span></p>
        <p>Height: <span id="height"><%=userProfile.getHeight()%></span> cm</p>
        <p>Weight: <span id="weight"><%=userProfile.getWeight()%></span> kg</p>
        <p>Gender: <span id="gender"><%=userProfile.getGender()%></span></p>

        <button id="editProfileBtn">Edit Profile</button>
        <button id="updateWeightHeightBtn">Update Weight/Height</button>

        <div id="editForm" style="display: none;">
            <label for="nameInput">Name: </label>
            <input type="text" id="nameInput" placeholder="Enter your name"><br>

            <label for="birthdayInput">Birthday: </label>
            <input type="date" id="birthdayInput"><br>

            <label for="newGender">Gender:</label>
            <select id="newGender">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select><br>

            <button onclick="saveProfile()">Save</button>
        </div>

        <div id="updateForm" style="display: none;">
            <label for="heightInput">Height (cm): </label>
            <input type="number" id="heightInput" placeholder="Enter your height"><br>

            <label for="weightInput">Weight (kg): </label>
            <input type="number" id="weightInput" placeholder="Enter your weight"><br>

            <button onclick="updateWeightHeight()">Save</button>
        </div>

        <canvas style="padding: 100px ; margin-bottom: 10% ;" id="weightHeightChart"></canvas>
        <canvas style="padding: 100px ; margin-bottom: 10% ;" id="bmiChart" ></canvas>
        
    </div>

    <!-- Bottom Navigation -->
    <div class="bottom-nav">
        <button id="home">Home</button>
        <button id="profile" class="active">Profile</button>
        <button id="notes">Notes</button>
        <button id="learning">Learning</button>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script><%@include file="profile_js.jsp" %></script>
</body>
</html>
