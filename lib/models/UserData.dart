import 'dart:core';

class UserData{
  String uid, gender, email, userCategory, profilId;
  String weight, height;
  List<String> healthConditions;

  UserData({
    this.uid, this.gender, this.email, this.userCategory, this.weight, this.height, this.healthConditions, this.profilId});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        uid: json['uid'],
        profilId: json['id'],
        gender: json['gender'],
        weight: json['weight'].toString(),
        height: json['height'].toString(),
        email: json['email'],
        healthConditions: List<String>.from(json['survey']['healthConditions']),
        userCategory: json['survey']['usercategory'],
    );
  }

}