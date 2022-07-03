import 'package:flutter/material.dart';
import 'package:project_2/question_screens/test_0.dart';
import 'package:project_2/question_screens/test_1.dart';
import 'package:project_2/question_screens/test_2.dart';
import 'package:project_2/question_screens/test_3.dart';
import 'package:project_2/question_screens/test_4.dart';
import 'package:project_2/question_screens/test_5.dart';
import 'package:project_2/question_screens/test_intro.dart';
import 'package:project_2/question_screens/test_result.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  PageController _controller = PageController();
  bool onLastPage = false;
  bool onFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onFirstPage = (index == 0);
                onLastPage = (index == 5);
              });
            },
            children: [
              Test0(),
              Test1(),
              Test2(),
              Test3(),
              Test4(),
              Test5(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // back or not show button
                onFirstPage
                ? Text("")
                : GestureDetector(
                  onTap: () {
                    _controller.previousPage(
                        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  },
                  child: Text('back'),
                ),

                // dot page indicator
                SmoothPageIndicator(
                  controller: _controller, count: 6,
                  effect: ScrollingDotsEffect(fixedCenter: true),
                ),

                // next or done button
                onLastPage
                ? GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return TestResult();
                    }));
                  }, 
                    child: Text('done')
                )
                : GestureDetector(
                    onTap: () {
                     _controller.nextPage(
                        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    child: Text('next')),
              ],
            )
          )
        ],
      )
    );
  }
}
