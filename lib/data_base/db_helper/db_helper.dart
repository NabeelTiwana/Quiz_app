import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'quiz_app.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE quiz_results(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    quiz_name TEXT NOT NULL,
    category_name TEXT NOT NULL,
    score INTEGER NOT NULL,
    total_questions INTEGER NOT NULL,
    date_taken TEXT NOT NULL
    )
    ''');
    await db.execute('''CREATE TABLE bookmarks(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    question_text TEXT NOT NULL,
    correct_answer TEXT NOT NULL,
    user_note TEXT,
    category_name TEXT NOT NULL,
    quiz_name TEXT NOT NULL
    )
    ''');
  }

  Future<int> insertQuizResult(QuizResult result) async {
    final db = await database;
    return await db.insert('quiz_result', result.toMap());
  }

  Future<List<QuizResult>> getQuizResults() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'quiz_results',
      orderBy: 'date_taken DESC',
    );
    return List.generate(maps.length, (i) {
      return QuizResult.formMap(maps[i]);
    });
  }

  //Bookmark Methods

  Future<int> addBookmark(Bookmark bookmark) async {
    final db = await database;
    return await db.insert('bookmarks', bookmark.toMap());
  }
  Future<List<Bookmark>>getBookmarks()async{
    final db=await database;
    final List<Map<String,dynamic>>maps=await db.query('bookmarks');
    return List.generate(maps.length,(i){
      return Bookmark.fromMap(maps[i]);
    });
  }
  Future<int>removeBookmark(int id)async{
    final db=await database;
    return await db.delete('bookmarks',where: 'id=?',whereArgs: [id]);
  }
}
