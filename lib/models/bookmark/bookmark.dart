class Bookmark {
  final int? id;
  final String questionText;
  final String correctAnswer;
  final String? userNote;
  final String categoryName;
  final String quizName;

  Bookmark({
    this.id,
    required this.questionText,
    required this.correctAnswer,
    this.userNote,
    required this.categoryName,
    required this.quizName,
  });
// Convert a Bookmark into a Map
Map<String,dynamic>toMap(){
  return{
    'id':id,
    'question_text':questionText,
    'correct_answer':correctAnswer,
    'user_note':userNote,
    'category_name':categoryName,
    'quiz_name':quizName,
  };
}
// Convert a Map into a Bookmark

factory Bookmark.fromMap(Map<String,dynamic>map){return Bookmark(
  id:map['id'],
  questionText: map['question_text'],
  correctAnswer: map['correct_answer'],
  userNote: map['user_note'],
  categoryName: map['category_name'],
  quizName: map['quiz_name'],
);}
}
