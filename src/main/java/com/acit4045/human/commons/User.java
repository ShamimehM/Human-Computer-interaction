/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.acit4045.human.commons;

/**
 *
 * @author gaura
 */
public class User {
    private String userId = null;
    private String profileId = null;
    private String userType = null;
    private String profileType = null;
    private String name = null;   

    public User(String userId, String profileId, String userType, String profileType, String name){
        this.userId = userId;
        this.profileId = profileId;
        this.userType = userType;
        this.profileType = profileType;
        this.name = name;
    }
    /**
     * @return the userId
     */
    public String getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * @return the profileId
     */
    public String getProfileId() {
        return profileId;
    }

    /**
     * @param profileId the profileId to set
     */
    public void setProfileId(String profileId) {
        this.profileId = profileId;
    }

    /**
     * @return the userType
     */
    public String getUserType() {
        return userType;
    }

    /**
     * @param userType the userType to set
     */
    public void setUserType(String userType) {
        this.userType = userType;
    }

    /**
     * @return the profileType
     */
    public String getProfileType() {
        return profileType;
    }

    /**
     * @param profileType the profileType to set
     */
    public void setProfileType(String profileType) {
        this.profileType = profileType;
    }

    /**
     * @return the userName
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the Name to set
     */
    public void setName(String name) {
        this.name = name;
    }
}
