// import 'dart:core';
// import 'package:json_annotation/json_annotation.dart';
// part 'userdata.g.dart';
//
// @JsonSerializable(explicitToJson: true)
// class UserData{
//   String uid, gender, email, profilId, userCategory, intensityLevel;
//   String weight, height;
//   List<String> healthConditions;
//   bool isProfileComplete;
//
//   UserData({
//     this.uid, this.gender, this.email, this.weight, this.height, this.userCategory, this.healthConditions, this.intensityLevel, this.profilId, this.isProfileComplete});
//
//
//   factory UserData.fromJson(Map<String, dynamic> json) {
//     return UserData(
//         uid: json['uid'],
//         profilId: json['id'],
//         gender: json['gender'],
//         weight: json['weight'].toString(),
//         height: json['height'].toString(),
//         email: json['email'],
//         healthConditions: List<String>.from(json['healthConditions']),
//         userCategory: json['userCategory'],
//         isProfileComplete: json['isProfileComplete'],
//         intensityLevel: json['intensityLevel']
//     );
//   }
//
//   Map toJson() {
//     return {'uid': uid,
//       'id': profilId,
//       'gender': gender,
//       'weight': weight,
//       'height': height,
//       'email': email,
//       'healthConditions': healthConditions.toString(),
//       'userCategory': userCategory,
//       'isProfilComplete': isProfileComplete,
//     };
//   }
//
//
// }