import 'package:flutter/material.dart';

import 'data/data.dart';

class ResultScreen extends StatelessWidget {
  final int totalQuestions;
  final int totalCorrect;
  final QuizSet quizSet;

  const ResultScreen({
    super.key,
    required this.totalQuestions,
    required this.totalCorrect,
    required this.quizSet, required int totalAnswers, required int totalScore,
  });

  @override
  Widget build(BuildContext context) {
    int totalScore = ((totalCorrect / totalQuestions) * 100).round();
    String feedback = totalScore < 30
        ? "You failed. Keep practicing!"
        : totalScore < 60
        ? "Good attempt!"
        : totalScore < 80
        ? "Great job!"
        : "Awesome!";

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.indigo,
              Colors.purple,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white,size: 30,),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Text(
                              "Quiz Result",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "$totalScore%",
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                feedback,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "You got $totalCorrect out of $totalQuestions correct",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  "Back to Home",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}