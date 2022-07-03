import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_2/question_screens/questions.dart';
import 'package:project_2/question_screens/test_intro.dart';

class TestResult extends StatefulWidget {
  const TestResult({Key? key}) : super(key: key);

  @override
  State<TestResult> createState() => _TestResultState();
}

class _TestResultState extends State<TestResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(75, 75, 75, 75),
            child: Column(
              children: [
                Text("RESULT",
                  style: TextStyle(
                    fontSize: 37,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Show result here, latest result stored in 'Profile' section"),
                Lottie.network(
                  "https://assets2.lottiefiles.com/packages/lf20_h4bos27x.json",
                  // repeat: true,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 300,
            height: 40,
            child: TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: const BorderSide(color: Colors.purple)
                          )
                      )
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Questions()));                },
                  child: const Text("Take Test Again"),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: 300,
            height: 40,
            child: TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(color: Colors.purple)
                      )
                  )
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TestIntro()));                },
              child: const Text("Done"),
            ),
          ),
        ],
      ),
    );
  }
}
