import 'package:flutter/material.dart';

import 'package:quiz_app/page/splash_screen.dart';
import 'package:quiz_app/page/questions_screens.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/page/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswers = [];
  var _activeScreen = 'start-screen';

  void _switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == question.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = SplashScreen(_switchScreen);

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chooseAnswer,
      );
    }

    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}