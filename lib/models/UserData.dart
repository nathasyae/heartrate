import 'dart:core';

class UserData{
  String uid, gender, activity_level;
  double weight, height;
  List<String> health_conditions, cvd_history;

  UserData({this.uid, this.gender, this.activity_level, this.weight, this.height, this.health_conditions, this.cvd_history});

  String getUid(){
    return this.uid;
  }

  void setUid(String uid){
    this.uid = uid;
  }

  String getGender(){
    return this.gender;
  }

  void setGender(String gender){
    this.gender = uid;
  }

  String getActivityLevel(){
    return this.activity_level;
  }

  void setActivityLevel(String activity_level){
    this.activity_level = activity_level;
  }

  double getHeight(){
    return this.height;
  }

  void setHeight(double height){
    this.height = height;
  }

  double getWeight(){
    return this.weight;
  }

  void setWeight(double weight){
    this.weight = weight;
  }
  
  List<String> getHealthConditions(){
    return health_conditions;
  }

  void setHealthConditions(List<String> health_conditions){
    this.health_conditions = health_conditions;
  }

  List<String> getCvdHistory(){
    return cvd_history;
  }

  void setCvdHistory(List<String> cvd_history){
    this.cvd_history = cvd_history;
  }

}