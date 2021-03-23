class Survey{
  List<String> healthConditions;
  String userCategory;

  Survey({this.healthConditions, this.userCategory});

  toJson() => {
    'healthConditions' : healthConditions,
    'userCategory' : userCategory,
  };

  factory Survey.fromJson(Map<String, dynamic> json){
    return Survey(
        healthConditions: List<String>.from(json['healthConditions']),
            userCategory : json['userCategory']);
  }


}