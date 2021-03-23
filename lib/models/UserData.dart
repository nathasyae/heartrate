import 'dart:core';

class UserData{
  String uid, gender, email, userCategory, profilId;
  double weight, height;
  List<String> healthConditions;

  UserData({
    this.uid, this.gender, this.email, this.userCategory, this.weight, this.height, this.healthConditions, this.profilId});

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
    return healthConditions;
  }

  void setHealthConditions(List<String> healthConditions){
    this.healthConditions = healthConditions;
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        uid: json['uid'],
        profilId: json['id'],
        gender: json['gender'],
        weight: json['weight'],
        height: json['height'],
        email: json['email'],
        healthConditions: List<String>.from(json['survey']['healthConditions']),
        userCategory: json['survey']['usercategory'],
    );
  }

}