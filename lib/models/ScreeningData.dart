import 'package:json_annotation/json_annotation.dart';
part 'ScreeningData.g.dart';

@JsonSerializable(explicitToJson: true)
class ScreeningData{
  String id, userUid, finalEvaluation, detailAnalysis, bmiStatus, consultText, preventionText, bpmLevel;
  bool isRhythmNormal;
  List<String> symptomps, intensity;
  DateTime checkedDateTime;

  @JsonKey(fromJson: _intToString, toJson: _stringToInt)
  String weight, height;

  @JsonKey(fromJson: _doubleToStringFix, toJson: _stringToDouble)
  String bpm, bmi;

  String sensorData;

  ScreeningData({
    this.id,
    this.bpm,
    this.finalEvaluation,
    this.isRhythmNormal,
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

  static String _intToString(int number) => number == null ? null : number.toString();

  static int _stringToInt(String number) => int.parse(number?.toString());

  static String _doubleToString(double number) => number == null ? null : number.toString();

  static double _stringToDouble(String number) => double.parse(number?.toString()).toDouble();

  static String _doubleToStringFix(double number) => number == null ? null : number.toStringAsFixed(1);


}
