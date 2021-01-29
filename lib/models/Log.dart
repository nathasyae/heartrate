class Log{
  // int id;
  String uidUser;
  final double avgBPM;
  final String heartCondition;

  Log({this.uidUser, this.avgBPM, this.heartCondition});

  factory Log.fromJson(Map<String, dynamic> json) {
    return Log(
      avgBPM: json['bpm'],
      heartCondition: json['result'],
    );
  }

}

