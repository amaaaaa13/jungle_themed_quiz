import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../models/question.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questions;

  const QuizScreen({super.key, required this.questions});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Random _random = Random();
  late List<Question> shuffledQuestions;
  int currentQuestionIndex = 0;
  int score = 0;
  String? selectedAnswer;
  Timer? _timer;
  int timeLeft = 10;
  int missedQuestionCount = 0;

  @override
  void initState() {
    super.initState();
    _shuffleQuestionsAndAnswers();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _shuffleQuestionsAndAnswers() {
    shuffledQuestions = List<Question>.from(widget.questions)..shuffle(_random);
    shuffledQuestions = shuffledQuestions.take(10).toList();
    for (var question in shuffledQuestions) {
      question.options.shuffle(_random);
    }
  }

  void _startTimer() {
    _timer?.cancel();
    timeLeft = 10;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        _timer?.cancel();
        _recordMissedQuestion();
        _moveToNextQuestion();
      }
    });
  }

  void checkAnswer(String selectedOption) {
    _timer?.cancel();
    setState(() {
      selectedAnswer = selectedOption;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      if (selectedOption == shuffledQuestions[currentQuestionIndex].answer) {
        score++;
      }
      _moveToNextQuestion();
    });
  }

  void _recordMissedQuestion() {
    missedQuestionCount++;
  }

  void _moveToNextQuestion() {
    if (currentQuestionIndex < shuffledQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
      });
      _startTimer();
    } else {
      _showScoreDialog();
    }
  }

  void _showScoreDialog() {
    _timer?.cancel();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Completed!"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/jungle_quiz1.jpeg",
                width: 100, height: 100),
            Text("Your score is: $score / ${shuffledQuestions.length}",
                style: const TextStyle(fontSize: 18)),
            Text(score > 5 ? "Very Good!" : "Try Harder!",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            if (missedQuestionCount > 0) ...[
              const SizedBox(height: 10),
              Text("Missed Questions: $missedQuestionCount",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
            ],
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("Back to Home"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/jungle_background2.jpeg",
              fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "${currentQuestionIndex + 1} / ${shuffledQuestions.length}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text("Time left: $timeLeft sec",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow)),
                const SizedBox(height: 10),
                Text(
                  shuffledQuestions[currentQuestionIndex].question,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ...shuffledQuestions[currentQuestionIndex]
                    .options
                    .map((option) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedAnswer == option
                              ? Colors.orangeAccent
                              : Colors.brown,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: selectedAnswer == null
                            ? () => checkAnswer(option)
                            : null,
                        child:
                            Text(option, style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
