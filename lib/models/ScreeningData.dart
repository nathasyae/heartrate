import '../chart.dart';

class ScreeningData{
  String id, userUid, finalEvaluation, detailAnalysis, bmiStatus, consultText, preventionText, bpmLevel;
  bool isRythmNormal;
  List<String> symptomps, intensity;
  DateTime checkedDateTime;
  double bpm, weight, height, bmi;
  List<SensorValue> sensorData; // send to API as list of string

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

  factory ScreeningData.fromJson(Map<String, dynamic> json) {
    return ScreeningData(
      id: json['id'],
      bpm: json['bpm'],
      finalEvaluation: json['finalEvaluation'],
      isRythmNormal: json['isRythmNormal'],
      symptomps: List<String>.from(json['symptomps']),
      intensity: List<String>.from(json['intensity']),
      userUid: json['userUid'],
      checkedDateTime: json['checkedDateTime'],
      detailAnalysis: json['detailAnalysis'],
      weight: json['weight'],
      height: json['height'],
      bmi: json['bmi'],
      bmiStatus: json['bmiStatus'],
      consultText: json['consultText'],
      preventionText: json['preventionText'],
      bpmLevel: json['bpmLevel'],
      sensorData: List<SensorValue>.from(json['sensorData']),
    );
  }

}