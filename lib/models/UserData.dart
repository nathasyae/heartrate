import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
part 'UserData.g.dart';

@JsonSerializable(explicitToJson: true)
class UserData{
  @JsonKey(name: 'id')
  String profilId;

  String uid, gender, email, userCategory, intensityLevel;
  @JsonKey(fromJson: _doubleToString, toJson: _stringToDouble)
  String weight, height;
  List<String> healthConditions;
  bool isProfileComplete;

  UserData({
    this.uid,
    this.gender,
    this.email, this.weight, this.height, this.userCategory, this.healthConditions, this.intensityLevel,
    this.profilId, this.isProfileComplete});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  static String _doubleToString(double number) => number == null ? null : number.toString();

  static double _stringToDouble(String number) => double.parse(number?.toString());

}