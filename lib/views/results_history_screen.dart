import 'package:flutter/material.dart';

import '../data_base/db_helper/db_helper.dart';
import '../models/quiz_result/quiz_result.dart';

class ResultsHistoryScreen extends StatelessWidget {
  const ResultsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz History')),
      body: FutureBuilder<List<QuizResult>>(
        future: DatabaseHelper().getQuizResults(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No quiz results yet!'));
          }
          final results = snapshot.data!;
          return ListView.builder(
            itemBuilder: (context, index) {
              final result = results[index];
              final percentage = (result.score / result.totalQuestions * 100)
                  .round();
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(result.quizName),
                  subtitle: Text(
                    '${result.score}/${result.totalQuestions}-$percentage%',
                  ),
                  trailing: Text(
                    '${result.dateTaken.day}/${result.dateTaken.month}/${result.dateTaken.year}',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
