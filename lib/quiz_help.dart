import 'questionClass.dart';

class QuizHelp{
  List<Question> _questions = [
    Question("Test 1", true),
    Question("Test 2", false),
    Question("Test 3", true),
    Question("Test 4", true),
    Question("Test 5", false),
  ];

  String getQuestionText(int questionIndex){
    return _questions[questionIndex].questionText;
  }

  bool getQuestionAnswer(int questionIndex){
    return _questions[questionIndex].questionAnswer;
  }

  String getIndexLength(int questionIndex){
    return "${questionIndex+1}/${_questions.length}";
  }

  int getListLength(){
    return _questions.length;
  }
}