class UserData {
  final String name;
  final String age;
  final Mood? mood;
  final String healthHistory;
  final String allergies;
  final ActivityLevel? activityLevel;
  final Goal? goal;
  final String budget;

  const UserData({
    required this.name,
    required this.age,
    this.mood,
    required this.healthHistory,
    required this.allergies,
    this.activityLevel,
    this.goal,
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

enum Mood {
  Sad,
  Anxious,
  Horny,
  Thirsty,
  Happy,
}
