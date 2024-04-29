import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'api_config.dart';
import 'package:ai_app/data.dart';

class HomePage extends StatefulWidget {
  final UserData userData;
  final Mood? mood;
  final Level? level;
  final CopingMechanism? copingMechanism;

  final TimeAvailability? timeAvailability;

  const HomePage({
    Key? key,
    required this.userData,
    this.mood,
    this.level,
    this.copingMechanism,
    this.timeAvailability,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userMessageController = TextEditingController();
  late final ChatSession chatSession;
  final GenerativeModel generativeModel =
      GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  bool isLoading = false;
  final messageScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    chatSession = generativeModel.startChat();
    sendUserMessage(); // Automatically send user data when page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF437461),
        elevation: 0, // Remove elevation for a flat design
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 219, 241, 224), // Background color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                controller: messageScrollController,
                padding: const EdgeInsets.all(16.0),
                children: chatSession.history.map((content) {
                  var text = content.parts
                      .whereType<TextPart>()
                      .map<String>((e) => e.text)
                      .join('');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white, // Chat bubble color
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: MarkdownBody(
                          data: text,
                          styleSheet: MarkdownStyleSheet(
                            p: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 112, 156, 139),
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  void sendUserMessage() async {
    if (widget.userData.name.isNotEmpty &&
        widget.userData.age.isNotEmpty &&
        widget.userData.triggers.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      try {
        final response = await chatSession.sendMessage(Content.text(
            'Hello ${widget.userData.name}, It\'s okay to feel ${widget.userData.mood} with ${widget.userData.level} at ${widget.userData.age} years old. Remember to cope with your ${widget.userData.triggers}, utilize ${widget.userData.copingMechanism}, and make the most of your ${widget.userData.timeAvailability} time. Here\'s a routine suggested:'));

        if (response.text == null) {
          displayError('No response from API');
        } else {
          setState(() {
            isLoading = false;
            scrollToBottom();
          });
        }
      } catch (e) {
        displayError(e.toString());
        setState(() {
          isLoading = false;
        });
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => messageScrollController.animateTo(
        messageScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  void displayError(String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ));
    }
  }
}
