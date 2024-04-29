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
  Anger,
  Depression,
  Lonely,
  Frustated,
  Guilt,
  Stress,
  Confusion,
  Exhaustion,
  Insecure,
  Jealous,
  Overwhelmed,
  Grief,
  Regret,
  Envy,
  Despair,
  Apathy,
  Paranoia,
  Disgust,
}

enum Level {
  Subdued,
  Moderate,
  High,
}

enum CopingMechanism {
  Exercise,
  Talking,
  Breathing,
  Yoga,
  Journaling,
  Meditation,
  Mindfulness,
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
