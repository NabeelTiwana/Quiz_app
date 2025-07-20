class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  Question(this.question, this.options, this.correctAnswerIndex);
}

class QuizSet {
  final String name;
  final List<Question> questions;

  QuizSet({required this.name, required this.questions});
}

class Category {
  final String name;
  final String image;
  final List<QuizSet> quizSets;

  Category({
    required this.name,
    required this.image,
    required this.quizSets,
  });
}

class Data {
  static List<Category> categories = [
    // Flutter category
    Category(
      name: "Flutter",
      image: "assets/images/img_2.png",
      quizSets: [
        QuizSet(
          name: "Basics",
          questions: [
            Question(
              "What is Flutter?",
              [
                "A UI Framework",
                "A Programming Language",
                "An Operating System",
                "None of the Above"
              ],
              0,
            ),
            Question(
              "Which language is used by Flutter?",
              [
                "Java",
                "Kotlin",
                "Dart",
                "JavaScript",
              ],
              2,
            ),
            Question(
              "Flutter uses which kind of widgets?",
              [
                "Native widgets",
                "Customizable widgets",
                "HTML widgets",
                "None",
              ],
              1,
            ),
          ],
        ),
        QuizSet(
          name: "Intermediate",
          questions: [
            Question(
              "What is a StatefulWidget in Flutter?",
              [
                "A widget that cannot change its state",
                "A widget that has mutable state",
                "A widget that only builds once",
                "A widget that doesn't have a build method"
              ],
              1,
            ),
            Question(
              "How do you access the theme data in Flutter?",
              [
                "Theme.of(context)",
                "context.theme",
                "Theme.get(context)",
                "ThemeData.current"
              ],
              0,
            ),
            Question(
              "What is the purpose of the pubspec.yaml file?",
              [
                "To define app permissions",
                "To configure app dependencies and assets",
                "To set app theme colors",
                "To define app routes"
              ],
              1,
            ),
          ],
        ),
        QuizSet(
          name: "Advanced",
          questions: [
            Question(
              "What is the BLoC pattern used for?",
              [
                "Building layouts",
                "State management",
                "Network requests",
                "Database operations"
              ],
              1,
            ),
            Question(
              "How do you optimize performance in Flutter?",
              [
                "Using const constructors",
                "Avoiding rebuilds with const widgets",
                "Using ListView.builder for long lists",
                "All of the above"
              ],
              3,
            ),
            Question(
              "What is Isolate in Flutter?",
              [
                "A UI component",
                "A state management solution",
                "A separate execution context for concurrency",
                "A database model"
              ],
              2,
            ),
          ],
        ),
      ],
    ),

    // Python category
    Category(
      name: "Python",
      image: "assets/images/img_3.png",
      quizSets: [
        QuizSet(
          name: "Basics",
          questions: [
            Question(
              "What type of language is Python?",
              [
                "Compiled",
                "Interpreted",
                "Assembly",
                "Machine code",
              ],
              1,
            ),
            Question(
              "Which of the following is a Python data type?",
              [
                "integer",
                "character",
                "bit",
                "bytecode"
              ],
              0,
            ),
            Question(
              "Which keyword is used to define a function in Python?",
              [
                "func",
                "define",
                "def",
                "function",
              ],
              2,
            ),
          ],
        ),
        QuizSet(
          name: "Intermediate",
          questions: [
            Question(
              "What are list comprehensions used for?",
              [
                "Memory optimization",
                "Creating lists concisely",
                "Debugging lists",
                "Importing modules"
              ],
              1,
            ),
            Question(
              "How do you handle exceptions in Python?",
              [
                "try/except blocks",
                "if/error statements",
                "catch/throw keywords",
                "error handling decorators"
              ],
              0,
            ),
            Question(
              "What is the purpose of the __init__ method?",
              [
                "Initialize class attributes",
                "Terminate class instances",
                "Import class dependencies",
                "Define class inheritance"
              ],
              0,
            ),
          ],
        ),
        QuizSet(
          name: "Advanced",
          questions: [
            Question(
              "What are decorators in Python?",
              [
                "Special variables",
                "Functions that modify other functions",
                "Data structures",
                "Exception handlers"
              ],
              1,
            ),
            Question(
              "What is the purpose of __init__.py?",
              [
                "Initialize the Python interpreter",
                "Mark a directory as a Python package",
                "Define class initializers",
                "Start a Python application"
              ],
              1,
            ),
            Question(
              "Which module is used for regular expressions?",
              [
                "regex",
                "re",
                "pyregex",
                "pattern"
              ],
              1,
            ),
          ],
        ),
      ],
    ),

    // React category
    Category(
      name: "React",
      image: "assets/images/img_4.png",
      quizSets: [
        QuizSet(
          name: "Basics",
          questions: [
            Question(
              "What is React?",
              [
                "A database",
                "A JavaScript library for building UIs",
                "A programming language",
                "A framework for backend development",
              ],
              1,
            ),
            Question(
              "Who developed React?",
              [
                "Google",
                "Facebook",
                "Microsoft",
                "Apple",
              ],
              1,
            ),
            Question(
              "React uses what to describe UI?",
              [
                "HTML",
                "JSX",
                "CSS",
                "XML",
              ],
              1,
            ),
          ],
        ),
        QuizSet(
          name: "Intermediate",
          questions: [
            Question(
              "What is the purpose of React hooks?",
              [
                "To connect to backend services",
                "To handle state and side effects in functional components",
                "To style components",
                "To optimize rendering performance"
              ],
              1,
            ),
            Question(
              "What is the virtual DOM?",
              [
                "A lightweight version of the actual DOM",
                "A security feature",
                "A database for React components",
                "A testing environment"
              ],
              0,
            ),
            Question(
              "How do you pass data to child components?",
              [
                "Using state managers",
                "Through props",
                "Via context API",
                "With refs"
              ],
              1,
            ),
          ],
        ),
        QuizSet(
          name: "Advanced",
          questions: [
            Question(
              "What is Redux used for?",
              [
                "Component styling",
                "State management",
                "API requests",
                "Routing"
              ],
              1,
            ),
            Question(
              "What is code splitting in React?",
              [
                "Splitting code into multiple files",
                "Lazy loading components to reduce bundle size",
                "Dividing code between client and server",
                "Separating business logic from UI"
              ],
              1,
            ),
            Question(
              "What are React Portals?",
              [
                "Navigation components",
                "A way to render children outside the DOM hierarchy",
                "Data transfer objects",
                "Authentication mechanisms"
              ],
              1,
            ),
          ],
        ),
      ],
    ),

    // C++ category
    Category(
      name: "C++",
      image: "assets/images/img_1.png",
      quizSets: [
        QuizSet(
          name: "Basics",
          questions: [
            Question(
              "C++ is a _______ programming language.",
              [
                "Procedural",
                "Object-oriented",
                "Functional",
                "Declarative",
              ],
              1,
            ),
            Question(
              "Which operator is used for scope resolution in C++?",
              [
                "::",
                ":",
                ";",
                "->",
              ],
              0,
            ),
            Question(
              "What is the default access specifier for class members in C++?",
              [
                "public",
                "protected",
                "private",
                "friend",
              ],
              2,
            ),
          ],
        ),
        QuizSet(
          name: "Intermediate",
          questions: [
            Question(
              "What is function overloading?",
              [
                "Defining functions with the same name but different parameters",
                "Making functions run faster",
                "Creating recursive functions",
                "Defining functions in multiple files"
              ],
              0,
            ),
            Question(
              "What is a constructor?",
              [
                "A function that destroys objects",
                "A special function that initializes objects",
                "A function that returns values",
                "A static function"
              ],
              1,
            ),
            Question(
              "What is the 'this' pointer?",
              [
                "Pointer to the current object",
                "Pointer to the base class",
                "Pointer to static members",
                "Pointer to the main function"
              ],
              0,
            ),
          ],
        ),
        QuizSet(
          name: "Advanced",
          questions: [
            Question(
              "What is a virtual function in C++?",
              [
                "A function that doesn't exist",
                "A function that must be overridden",
                "A function that can be overridden in derived classes",
                "A static function"
              ],
              2,
            ),
            Question(
              "What is RAII in C++?",
              [
                "Random Access Iterator Interface",
                "Resource Acquisition Is Initialization",
                "Runtime Application Integration Interface",
                "Recursive Algorithm Implementation"
              ],
              1,
            ),
            Question(
              "What is std::move used for?",
              [
                "To move files",
                "To transfer ownership of resources",
                "To change object locations in memory",
                "To animate UI elements"
              ],
              1,
            ),
          ],
        ),
      ],
    ),
  ];
}