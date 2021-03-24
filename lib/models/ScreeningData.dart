import 'package:json_annotation/json_annotation.dart';
part 'ScreeningData.g.dart';

@JsonSerializable(explicitToJson: true)
class ScreeningData{
  String id, userUid, finalEvaluation, detailAnalysis, bmiStatus, consultText, preventionText, bpmLevel;
  bool isRythmNormal;
  List<String> symptomps, intensity;
  DateTime checkedDateTime;
  String bpm, weight, height, bmi;
  String sensorData;

  ScreeningData({
    this.id,
    this.bpm,
    this.finalEvaluation,
    this.isRythmNormal,
    this.symptomps,
    this.intensity,
    this.userUid,
    this.checkedDateTime,
    this.detailAnalysis,
    this.weight,
    this.height,
    this.bmi,
    this.bmiStatus,
    this.consultText,
    this.preventionText,
    this.sensorData,
    this.bpmLevel,
  });

  factory ScreeningData.fromJson(Map<String, dynamic> json) => _$ScreeningDataFromJson(json);

  Map<String, dynamic> toJson() => _$ScreeningDataToJson(this);
}