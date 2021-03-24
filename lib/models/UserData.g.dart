// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    uid: json['uid'] as String,
    gender: json['gender'] as String,
    email: json['email'] as String,
    weight: UserData._doubleToString(json['weight'] as double),
    height: UserData._doubleToString(json['height'] as double),
    userCategory: json['userCategory'] as String,
    healthConditions:
        (json['healthConditions'] as List)?.map((e) => e as String)?.toList(),
    intensityLevel: json['intensityLevel'] as String,
    profilId: json['id'] as String,
    isProfileComplete: json['isProfileComplete'] as bool,
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.profilId,
      'uid': instance.uid,
      'gender': instance.gender,
      'email': instance.email,
      'userCategory': instance.userCategory,
      'intensityLevel': instance.intensityLevel,
      'weight': UserData._stringToDouble(instance.weight),
      'height': UserData._stringToDouble(instance.height),
      'healthConditions': instance.healthConditions,
      'isProfileComplete': instance.isProfileComplete,
    };
