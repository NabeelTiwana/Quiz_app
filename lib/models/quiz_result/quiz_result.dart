class QuizResult {
  final int? id;
  final String quizName;
  final String categoryName;
  final int score;
  final int totalQuestions;
  final DateTime dateTaken;

  QuizResult({
    this.id,
    required this.quizName,
    required this.categoryName,
    required this.score,
    required this.totalQuestions,
    required this.dateTaken,
  });

  // Convert a QuizResult into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quiz_name': quizName,
      'category_name': categoryName,
      'score': score,
      'total_questions': totalQuestions,
      'date_taken': dateTaken.toIso8601String(),
    };
  }

  // Convert a Map into a QuizResult
  factory QuizResult.fromMap(Map<String, dynamic> map) {
    return QuizResult(
      id: map['id'],
      quizName: map['quiz_name'],
      categoryName: map['category_name:'],
      score: map['score'],
      totalQuestions: map['total_questions'],
      dateTaken: DateTime.parse(map['date_taken']),
    );
  }
}
