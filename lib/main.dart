import 'package:flutter/material.dart';
import './quiz_help.dart';
import 'package:quickalert/quickalert.dart';

//void main()=> runApp(MyApp());

void main(){
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          title: Text("Quiz App"),
          centerTitle: true,
        ),
        body: quizPage(),
      ),

    );
  }
}

class quizPage extends StatefulWidget {
  const quizPage({Key? key}) : super(key: key);

  @override
  State<quizPage> createState() => _quizPageState();
}

class _quizPageState extends State<quizPage> {

 QuizHelp quizHelp = QuizHelp();
 int correctAnswers = 0;


 List<Icon> trackAnswer = [];

  Future<void> checkAnswer(bool userAnswer) async {
    int question_length = quizHelp.getListLength();

      if(quizHelp.getQuestionAnswer(questionIndex) == userAnswer){
        trackAnswer.add(Icon(Icons.check, color: Colors.green, size: 35.0,));
        correctAnswers++;
      }
      else
      {
        trackAnswer.add(Icon(Icons.close, color: Colors.red, size: 35.0,));
      }

      if(questionIndex == question_length - 1){

        await Future.delayed(Duration(seconds: 1));
        await QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: "Quiz has ended, you have got ${correctAnswers} correct answers",

        );
        questionIndex = 0;
        trackAnswer.clear();
      }
      else{
        if(questionIndex < question_length - 1 ){
          questionIndex++;
        }
      }
  }

  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex:5,
              child: Center(
                child: Text("${quizHelp.getQuestionText(questionIndex)}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0
                  ),
                ),
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${quizHelp.getIndexLength(questionIndex)}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0
              ),)
            ],
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: (){
                  setState(() {
                    checkAnswer(true);
                  });
                },
                child: Text("True",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: (){
                  setState(() {
                    checkAnswer(false);
                  });
                },
                child: Text("False",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: trackAnswer,
          )
        ],
      ),
    );
  }
}

