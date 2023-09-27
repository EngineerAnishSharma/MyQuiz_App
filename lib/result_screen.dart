import 'package:flutter/material.dart';
import 'package:my_quiz/const/text_style.dart';
import 'package:my_quiz/main.dart';
import 'package:my_quiz/quiz_screen.dart';

import 'const/colors.dart';
import 'const/images.dart';
class ResultScreen extends StatelessWidget {
  int points;
  ResultScreen(this.points, {super.key});

  @override
  Widget build(BuildContext context) {
    var noOfCorrect=points/10;

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [blue, darkBlue],
            ),
        ),
        child: Column(
          children: [
            Image.asset(
              balloon,
            ),
            headingText(color: Colors.white, size: 32, text: "Result time"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 250,
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        normalText(color: lightgrey, size: 18, text: "Correct Answer"),
                        normalText(color: lightgrey, size: 18, text: "${noOfCorrect}"),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        normalText(color: lightgrey, size: 18, text: "Incorrect Answer"),

                        normalText(color: lightgrey, size: 18, text: "${20-noOfCorrect}"),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        normalText(color: lightgrey, size: 18, text: "Total points"),
                        normalText(color: lightgrey, size: 18, text: "${points}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()));
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
                  child: headingText(color: blue, size: 18, text: "Restart"),
                ),
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Quiz()));
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
                  child: headingText(color: blue, size: 18, text: "Exit"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
