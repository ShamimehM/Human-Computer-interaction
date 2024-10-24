<%@page import="com.acit4045.human.commons.User"%>
<%@page import="com.acit4045.human.commons.Profile"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/dbConnection.jspf"%>

<%
    String query = " select usr.user_id, prf.profile_id, usr.user_type, prf.profile_type, usr.name "+
                              " from users usr, profiles prf " +
                              " where usr.user_id = prf.user_id " +
                              " and usr.user_name = ?";
    String userParam = request.getParameter("user");
    PreparedStatement pStmt = null;
    User userObj = null;
    if(user==null){
        response.sendRedirect("index.jsp");
        return;
    }
    try{
        pStmt = con.prepareStatement(query);
        pStmt.setString(1, userParam);
        ResultSet rs = pStmt.executeQuery();
        
        if(rs.next()){
            String userId = rs.getString(1);
            String profileId = rs.getString(2);
            String userType = rs.getString(3);
            String profileType = rs.getString(4);
            String name = rs.getString(5);
            
            userObj = new User(userId, profileId, userType, profileType, name);
            pageContext.getSession().setAttribute("UserLogin", userObj);
            pStmt.close();
            
            Profile profile = null;
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
            rs = pStmt.executeQuery();
            if(rs.next()){
                profile = new Profile(rs.getString(1), rs.getString(2), rs.getString(3), 
                                      rs.getString(4), rs.getString(5), rs.getString(6),
                                      rs.getString(7), rs.getString(8), rs.getString(9));
            }
            pStmt.close();
            
            pageContext.getSession().setAttribute("UserProfile", profile);
            
            if("CHILD".equals(userType))
                response.sendRedirect("home.jsp");
            else
                response.sendRedirect("profile.jsp");
        }
    }catch (SQLException e) {
        e.printStackTrace();
    }
%>