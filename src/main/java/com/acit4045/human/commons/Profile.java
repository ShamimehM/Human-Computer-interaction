/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.acit4045.human.commons;

/**
 *
 * @author gaura
 */
public class Profile {

    private String profileId;
    private String name;
    private String dateOfBirth;
    private String gender;
    private String height;
    private String weight;
    private String profileType;
    private String parentProfileId;
    private String userId;

    public Profile(String profileId,
            String name,
            String dateOfBirth,
            String gender,
            String height,
            String weight,
            String profileType,
            String parentProfileId,
            String userId) {
        this.profileId = profileId;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.height = height;
        this.weight = weight;
        this.profileType = profileType;
        this.parentProfileId = parentProfileId;
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
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the dateOfBirth
     */
    public String getDateOfBirth() {
        return dateOfBirth;
    }

    /**
     * @param dateOfBirth the dateOfBirth to set
     */
    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the height
     */
    public String getHeight() {
        return height;
    }

    /**
     * @param height the height to set
     */
    public void setHeight(String height) {
        this.height = height;
    }

    /**
     * @return the weight
     */
    public String getWeight() {
        return weight;
    }

    /**
     * @param weight the weight to set
     */
    public void setWeight(String weight) {
        this.weight = weight;
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
     * @return the parentProfileId
     */
    public String getParentProfileId() {
        return parentProfileId;
    }

    /**
     * @param parentProfileId the parentProfileId to set
     */
    public void setParentProfileId(String parentProfileId) {
        this.parentProfileId = parentProfileId;
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
}
