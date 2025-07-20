import 'package:flutter/material.dart';
import 'package:quiz_app/views/home_screen.dart';
import 'package:quiz_app/views/quiz_screen.dart';

import '../data/data.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Test your skills",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: category.quizSets.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final quizSet = category.quizSets[index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(quizSet: quizSet),  // Changed from Quizscreen to QuizScreen
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,  // Added color
                          borderRadius: BorderRadius.circular(10),  // Added border radius
                        ),
                        child: Text(  // Added child widget
                          quizSet.name,  // Assuming quizSet has a title property
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}