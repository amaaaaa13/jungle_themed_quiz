import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import '../data/questions_data.dart';
import '../models/question.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/jungle_background2.jpeg", fit: BoxFit.cover),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/jungle_quiz1.jpeg", width: 200, height: 200),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    // Load questions BEFORE navigation
                    List<Question> questions = loadQuestions();

                    // Navigate & pass questions
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(questions: questions),
                      ),
                    );
                  },
                  child: const Text("Click to Start"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
