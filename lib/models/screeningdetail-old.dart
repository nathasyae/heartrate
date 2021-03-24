// import '../chart.dart';
// import 'package:json_annotation/json_annotation.dart';
// part 'screeningdata.g.dart';
//
// class ScreeningData{
//   String id, userUid, finalEvaluation, detailAnalysis, bmiStatus, consultText, preventionText, bpmLevel;
//   bool isRythmNormal;
//   List<String> symptomps, intensity;
//   DateTime checkedDateTime;
//   String bpm, weight, height, bmi;
//   String sensorData;
//
//   ScreeningData({
//     this.id,
//     this.bpm,
//     this.finalEvaluation,
//     this.isRythmNormal,
//     this.symptomps,
//     this.intensity,
//     this.userUid,
//     this.checkedDateTime,
//     this.detailAnalysis,
//     this.weight,
//     this.height,
//     this.bmi,
//     this.bmiStatus,
//     this.consultText,
//     this.preventionText,
//     this.sensorData,
//     this.bpmLevel,
//   });
//
//   factory ScreeningData.fromJson(Map<String, dynamic> json) {
//     return ScreeningData(
//       id: json['id'],
//       bpm: json['bpm'].toStringAsFixed(0),
//       finalEvaluation: json['finalEvaluation'],
//       isRythmNormal: json['isRythmNormal'],
//       symptomps: (json['symptomps']!=null) ? List<String>.from(json['symptomps']) : [],
//       intensity: (json['intensity']!=null) ? List<String>.from(json['intensity']) : [],
//       userUid: json['userUid'],
//       checkedDateTime: DateTime.parse(json['checkedDateTime']),
//       detailAnalysis: json['detailAnalysis'],
//       weight: json['weight'].toStringAsFixed(0),
//       height: json['height'].toStringAsFixed(0),
//       bmi: json['bmi'].toString(),
//       bmiStatus: json['bmiStatus'],
//       consultText: json['consultText'],
//       preventionText: json['preventionText'],
//       bpmLevel: json['bpmLevel'],
//       sensorData: json['sensorData'],
//     );
//   }
//
// }