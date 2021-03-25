// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ScreeningData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreeningData _$ScreeningDataFromJson(Map<String, dynamic> json) {
  return ScreeningData(
    id: json['id'] as String,
    bpm: ScreeningData._doubleToStringFix(json['bpm'] as double),
    finalEvaluation: json['finalEvaluation'] as String,
    isRhythmNormal: json['isRhythmNormal'] as bool,
    symptomps: (json['symptomps'] as List)?.map((e) => e as String)?.toList(),
    intensity: (json['intensity'] as List)?.map((e) => e as String)?.toList(),
    userUid: json['userUid'] as String,
    checkedDateTime: json['checkedDateTime'] == null
        ? null
        : DateTime.parse(json['checkedDateTime'] as String),
    detailAnalysis: json['detailAnalysis'] as String,
    weight: ScreeningData._intToString(json['weight'] as int),
    height: ScreeningData._intToString(json['height'] as int),
    bmi: ScreeningData._doubleToStringFix(json['bmi'] as double),
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
      'isRhythmNormal': instance.isRhythmNormal,
      'symptomps': instance.symptomps,
      'intensity': instance.intensity,
      'checkedDateTime': instance.checkedDateTime?.toIso8601String(),
      'weight': ScreeningData._stringToInt(instance.weight),
      'height': ScreeningData._stringToInt(instance.height),
      'bpm': ScreeningData._stringToDouble(instance.bpm),
      'bmi': ScreeningData._stringToDouble(instance.bmi),
      'sensorData': instance.sensorData,
    };
