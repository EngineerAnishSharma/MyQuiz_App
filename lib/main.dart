import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_quiz/quiz_screen.dart';
import 'dart:io';
import 'const/colors.dart';

import 'const/images.dart';
import 'const/text_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Quiz(),
      theme: ThemeData(
        fontFamily: "quick",
      ),
    );

  }
}
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Color topColor=blue;
  Color bottomColor=darkBlue;
  var colorList=[
    Colors.pink,
    Colors.blue,
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrangeAccent,
    Colors.indigo,
    Colors.lightBlueAccent

  ];
  var index=0;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
      setState(() {
        bottomColor=Colors.pink;
      });
    });


    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          onEnd: (){
            setState(() {
              index++;
              topColor=colorList[index % colorList.length];
              bottomColor=colorList[(index+1) % colorList.length];
            });
          },
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration:  BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [topColor, bottomColor],
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: lightgrey, width: 2),
                ),
                child: IconButton(
                    onPressed: () {
                      if(Platform.isAndroid){
                        SystemNavigator.pop();
                      }else{
                        exit(0);
                      }
                    },
                    icon: const Icon(
                      CupertinoIcons.xmark,
                      color: Colors.white,
                      size: 28,
                    )),
              ),
              Image.asset(
                balloon2,
              ),
              const SizedBox(height: 20),
              normalText(color: lightgrey, size: 18, text: "Welcome to our"),
              headingText(color: Colors.white, size: 32, text: "Quiz App"),
              const SizedBox(height: 20),
              normalText(
                  color: lightgrey,
                  size: 16,
                  text: "Do you feel confident? Here you'll face our most difficult questions!"),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    width: size.width - 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: headingText(color: blue, size: 18, text: "Continue"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


