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
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final genderController = TextEditingController();
  final countryController = TextEditingController();
  final ethnicityController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    genderController.dispose();
    countryController.dispose();
    ethnicityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 60, 177, 118),
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
              TextField(
                controller: heightController,
                decoration: const InputDecoration(
                  labelText: 'Height (cm)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: weightController,
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: genderController,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: countryController,
                decoration: const InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ethnicityController,
                decoration: const InputDecoration(
                  labelText: 'Cultural Background',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  final userData = UserData(
                    name: nameController.text,
                    age: ageController.text,
                    height: heightController.text,
                    weight: weightController.text,
                    gender: genderController.text,
                    country: countryController.text,
                    ethnicity: ethnicityController.text,
                    healthHistory: '',
                    allergies: '',
                    activityLevel: null,
                    goal: null,
                    budget: '',
                  );

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          HealthHistoryPage(userData: userData),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 60, 177, 118),
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

class HealthHistoryPage extends StatefulWidget {
  final UserData userData;

  const HealthHistoryPage({Key? key, required this.userData}) : super(key: key);

  @override
  State<HealthHistoryPage> createState() => _HealthHistoryPageState();
}

class _HealthHistoryPageState extends State<HealthHistoryPage> {
  final healthHistoryController = TextEditingController();
  final allergiesController = TextEditingController();
  ActivityLevel? selectedActivityLevel;
  Goal? selectedGoal;
  String? selectedCurrency;
  final budgetController = TextEditingController(); // Added budgetController

  @override
  void initState() {
    super.initState();
    selectedActivityLevel = widget.userData.activityLevel;
    selectedGoal = widget.userData.goal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 60, 177, 118),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: healthHistoryController,
                decoration: const InputDecoration(
                  labelText: 'Medical History',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: allergiesController,
                decoration: const InputDecoration(
                  labelText: 'Dietary Restrictions/Allergies',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<ActivityLevel>(
                value: selectedActivityLevel,
                onChanged: (newValue) {
                  setState(() {
                    selectedActivityLevel = newValue;
                  });
                },
                items: ActivityLevel.values.map((level) {
                  return DropdownMenuItem<ActivityLevel>(
                    value: level,
                    child: Text(
                      level.toString().split('.').last,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Activity Level',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<Goal>(
                value: selectedGoal,
                onChanged: (newValue) {
                  setState(() {
                    selectedGoal = newValue;
                  });
                },
                items: Goal.values.map((goal) {
                  return DropdownMenuItem<Goal>(
                    value: goal,
                    child: Text(
                      goal.toString().split('.').last,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Goal',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: budgetController,
                      decoration: const InputDecoration(
                        labelText: 'Weekly Food Budget',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: selectedCurrency,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCurrency = newValue;
                      });
                    },
                    items: ['USD', 'EUR', 'GBP', 'JPY', 'KRW', 'INR']
                        .map<DropdownMenuItem<String>>((currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text(currency),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  final healthHistory = healthHistoryController.text;
                  final allergies = allergiesController.text;

                  final updatedUserData = UserData(
                    name: widget.userData.name,
                    age: widget.userData.age,
                    height: widget.userData.height,
                    weight: widget.userData.weight,
                    gender: widget.userData.gender,
                    country: widget.userData.country,
                    ethnicity: widget.userData.ethnicity,
                    healthHistory: healthHistory,
                    allergies: allergies,
                    activityLevel: selectedActivityLevel,
                    goal: selectedGoal,
                    budget: budgetController
                        .text, // Pass the budget amount as a String
                  );

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        userData: updatedUserData,
                        activityLevel: selectedActivityLevel,
                        goal: selectedGoal,
                        budget: Budget(
                          amount: budgetController.text,
                          currency: selectedCurrency ?? 'USD',
                        ),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 60, 177, 118),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Save',
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

class Budget {
  final String amount;
  final String currency;

  Budget({
    required this.amount,
    required this.currency,
  });
}
