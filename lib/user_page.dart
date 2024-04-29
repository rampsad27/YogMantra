import 'package:flutter/material.dart';
import 'package:ai_app/data.dart';
import 'package:ai_app/home_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  Mood? selectedMood;
  Level? selectedLevel;
  final triggerController = TextEditingController();
  PhysicalSymptoms? selectedSymptom;
  CopingMechanism? selectedCopingMechanism;
  TimeAvailability? selectedTimeAvailability;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF437461),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<Mood>(
                value: selectedMood,
                onChanged: (newValue) {
                  setState(() {
                    selectedMood = newValue;
                  });
                },
                items: Mood.values.map((mood) {
                  return DropdownMenuItem<Mood>(
                    value: mood,
                    child: Text(
                      mood.toString().split('.').last,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Current Mood',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<Level>(
                value: selectedLevel,
                onChanged: (newValue) {
                  setState(() {
                    selectedLevel = newValue;
                  });
                },
                items: Level.values.map((level) {
                  return DropdownMenuItem<Level>(
                    value: level,
                    child: Text(
                      level.toString().split('.').last,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Level',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: triggerController,
                decoration: const InputDecoration(
                  labelText: 'Trigger',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<PhysicalSymptoms>(
                value: selectedSymptom,
                onChanged: (newValue) {
                  setState(() {
                    selectedSymptom = newValue;
                  });
                },
                items: PhysicalSymptoms.values.map((symptom) {
                  return DropdownMenuItem<PhysicalSymptoms>(
                    value: symptom,
                    child: Text(
                      symptom.toString().split('.').last,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Physical Symptoms',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<CopingMechanism>(
                value: selectedCopingMechanism,
                onChanged: (newValue) {
                  setState(() {
                    selectedCopingMechanism = newValue;
                  });
                },
                items: CopingMechanism.values.map((copingMechanism) {
                  return DropdownMenuItem<CopingMechanism>(
                    value: copingMechanism,
                    child: Text(
                      copingMechanism.toString().split('.').last,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Coping Mechanism',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<TimeAvailability>(
                value: selectedTimeAvailability,
                onChanged: (newValue) {
                  setState(() {
                    selectedTimeAvailability = newValue;
                  });
                },
                items: TimeAvailability.values.map((time) {
                  return DropdownMenuItem<TimeAvailability>(
                    value: time,
                    child: Text(
                      time.toString().split('.').last,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Time Availability',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  final userData = UserData(
                    name: nameController.text,
                    age: ageController.text,
                    mood: selectedMood,
                    level: selectedLevel,
                    triggers: triggerController.text,
                    physicalSymptoms: selectedSymptom,
                    copingMechanism: selectedCopingMechanism,
                    timeAvailability: selectedTimeAvailability,
                  );

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(userData: userData),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF437461),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
