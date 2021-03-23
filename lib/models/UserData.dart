import 'dart:core';

class UserData{
  String uid, gender, email, profilId, userCategory;
  String weight, height;
  List<String> healthConditions;

  UserData({
    this.uid, this.gender, this.email, this.weight, this.height, this.userCategory, this.healthConditions, this.profilId});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        uid: json['uid'],
        profilId: json['id'],
        gender: json['gender'],
        weight: json['weight'].toString(),
        height: json['height'].toString(),
        email: json['email'],
        healthConditions: List<String>.from(json['healthConditions']),
        userCategory: json['userCategory'],

    );
  }

  Map toJson() {

    return {'uid': uid,
      'id': profilId,
      'gender': gender,
      'weight': weight,
      'height': height,
      'email': email,
    };
  }


}