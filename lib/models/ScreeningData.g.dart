// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ScreeningData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreeningData _$ScreeningDataFromJson(Map<String, dynamic> json) {
  return ScreeningData(
    id: json['id'] as String,
    bpm: json['bpm'] as String,
    finalEvaluation: json['finalEvaluation'] as String,
    isRythmNormal: json['isRythmNormal'] as bool,
    symptomps: (json['symptomps'] as List)?.map((e) => e as String)?.toList(),
    intensity: (json['intensity'] as List)?.map((e) => e as String)?.toList(),
    userUid: json['userUid'] as String,
    checkedDateTime: json['checkedDateTime'] == null
        ? null
        : DateTime.parse(json['checkedDateTime'] as String),
    detailAnalysis: json['detailAnalysis'] as String,
    weight: json['weight'] as String,
    height: json['height'] as String,
    bmi: json['bmi'] as String,
    bmiStatus: json['bmiStatus'] as String,
    consultText: json['consultText'] as String,
    preventionText: json['preventionText'] as String,
    sensorData: json['sensorData'] as String,
    bpmLevel: json['bpmLevel'] as String,
  );
}

Map<String, dynamic> _$ScreeningDataToJson(ScreeningData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userUid': instance.userUid,
      'finalEvaluation': instance.finalEvaluation,
      'detailAnalysis': instance.detailAnalysis,
      'bmiStatus': instance.bmiStatus,
      'consultText': instance.consultText,
      'preventionText': instance.preventionText,
      'bpmLevel': instance.bpmLevel,
      'isRythmNormal': instance.isRythmNormal,
      'symptomps': instance.symptomps,
      'intensity': instance.intensity,
      'checkedDateTime': instance.checkedDateTime?.toIso8601String(),
      'bpm': instance.bpm,
      'weight': instance.weight,
      'height': instance.height,
      'bmi': instance.bmi,
      'sensorData': instance.sensorData,
    };
