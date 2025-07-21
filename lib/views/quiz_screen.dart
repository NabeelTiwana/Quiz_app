import 'package:flutter/material.dart';
import 'package:quiz_app/data_base/db_helper/db_helper.dart';


import '../data/data.dart';
import '../result_screen.dart';

class QuizScreen extends StatefulWidget {
  final QuizSet quizSet;

  const QuizScreen({super.key, required this.quizSet});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  List<int?> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    selectedAnswers = List<int?>.filled(widget.quizSet.questions.length, null);
  }

  void goToNextQuestion() {
    if (currentQuestionIndex < widget.quizSet.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  void goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void selectAnswer(int answerIndex) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answerIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion = widget.quizSet.questions[currentQuestionIndex];
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Text(
                      "${widget.quizSet.name} Quiz",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Question ${currentQuestionIndex + 1}/${widget.quizSet.questions.length}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  currentQuestion.question,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: ListView.builder(
                    itemCount: currentQuestion.options.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedAnswers[currentQuestionIndex] == index;
                      return GestureDetector(
                        onTap: () => selectAnswer(index),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            currentQuestion.options[index],
                            style: TextStyle(
                              fontSize: 18,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: goToPreviousQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "Previous",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (currentQuestionIndex < widget.quizSet.questions.length - 1) {
                          goToNextQuestion();
                        } else {
                          // Calculate score
                          int totalCorrect = 0;
                          for (int i = 0; i < widget.quizSet.questions.length; i++) {
                            // Compare with correctAnswerIndex, not selectedIndex
                            if (selectedAnswers[i] == widget.quizSet.questions[i].correctAnswerIndex) {
                              totalCorrect++;
                            }
                          }
                         //Create a QuizResult object
                          final result=QuizResult(
                            quizName:widget.quizSet.name,
                            categoryName:widget.quizSet.name,
                            score:totalCorrect,
                            totalQuestions:widget.quizSet.questions.length,
                            dateTaken:DateTime.now(),
                          );
                          DatabaseHelper().insertQuizResult(result);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                totalCorrect: totalCorrect,
                                totalQuestions: widget.quizSet.questions.length,
                                totalAnswers:totalCorrect ,
                                totalScore: totalCorrect * 10,
                                quizSet: widget.quizSet,

                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom( // Added missing button style
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        currentQuestionIndex < widget.quizSet.questions.length - 1
                            ? "Next"
                            : "Finish",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}