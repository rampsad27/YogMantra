class UserData {
  final String name;
  final String age;
  final String height;
  final String weight;
  final String gender;
  final String country;
  final String healthHistory;
  final String allergies;
  final ActivityLevel? activityLevel;
  final Goal? goal;
  final String ethnicity;
  final String budget;

  const UserData({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.gender,
    required this.country,
    required this.healthHistory,
    required this.allergies,
    this.activityLevel,
    this.goal,
    required this.ethnicity,
    required this.budget,
  });
}

enum Goal {
  WeightLoss,
  MuscleGain,
  GeneralHealth,
}

enum ActivityLevel {
  Sedentary,
  LightlyActive,
  ModeratelyActive,
  VeryActive,
  ExtremelyActive,
}
