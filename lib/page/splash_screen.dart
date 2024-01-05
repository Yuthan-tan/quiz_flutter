import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
                color: const Color.fromARGB(150, 42, 209, 251),
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                'Belajar Flutter Itu \n Menyenangkan!',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          Column(
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  startQuiz();
                },
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.arrow_right_outlined),
                label: const Text('Mulai Quis'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
