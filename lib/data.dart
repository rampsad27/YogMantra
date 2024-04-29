class UserData {
  final String name;
  final String age;
  final Mood? mood;
  final Level? level;
  final String triggers;
  final CopingMechanism? copingMechanism;
  final PhysicalSymptoms? physicalSymptoms;
  final TimeAvailability? timeAvailability;

  const UserData({
    required this.name,
    required this.age,
    this.mood,
    this.level,
    required this.triggers,
    this.copingMechanism,
    this.physicalSymptoms,
    this.timeAvailability,
  });
}

enum Mood {
  Sad,
  Anxious,
}

enum Level {
  low,
  med,
  high,
}

enum CopingMechanism {
  exercise,
  talk,
  breathing,
  yoga,
}

enum PhysicalSymptoms {
  hedache,
  stomachache,
}

enum TimeAvailability {
  min,
  hr,
  halfhr,
}
