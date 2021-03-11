class Survey {
  Survey(
    this.genderList,
    this.healthConditionList,
    this.cvdIllnessList,
    this.alcoholStatusList,
    this.cigarretesStatusList);


  List<String> genderList = ['Male', 'Female', 'Others'];

  List<String> healthConditionList = [
    'High blood pressure (hypertension)',
    'High blood glucose (diabetes)',
    'Abnormal blood lipids (dyslipidaemia)'];

  List<String> cvdIllnessList = [
    'Arrythmias', 'Angina', 'Unstable angina',
    'Valve illness', 'Other'];

  List<String> alcoholStatusList = [
    'I never drank alcohol in my life.',
    'I have stopped drinking alcohol for more than 1 year',
    'I have stopped drinking alcohol for less than 1 year',
    'I’m still drinking alkohol.'];

  List<String> cigarretesStatusList = [
    'I have never smoked or have smoked fewer than 100 cigarettes in my lifetime.',
    'I have stopped smoking for more than 1 year',
    'I have stopped smoking for less than 1 year',
    'I’m still smoking cigarretes.',
  ];

  List<String> getGenderList(){
    return genderList;
  }

  List<String> getHealthConditionList() {
    return healthConditionList;
  }

  List<String> getCvdIllnessList(){
    return cvdIllnessList;
  }

  List<String> getAlcoholStatusList(){
    return alcoholStatusList;
  }

  List<String> getCigarretesStatusList(){
    return cigarretesStatusList;
  }


}