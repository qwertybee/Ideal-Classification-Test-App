import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_2/question_screens/display_questions.dart';

import '../api/api_services.dart';
import '../api/category_api/cateDetail/detail_skill.dart';
import '../primary.dart';

class TestResult extends StatefulWidget {
  const TestResult({Key? key}) : super(key: key);

  @override
  State<TestResult> createState() => _TestResultState();
}

class _TestResultState extends State<TestResult> {
  List<DetailSkill?>? allDetailSkill;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    allDetailSkill = (await ApiService().getAllDetailSkill());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void getTestResult() {
    // get API for skills in detailed occupation
    // get difference/variance of each occupation's skills
    // get average of all variance
    // lowest variance is the result
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (allDetailSkill == null)
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Scaffold(
        body: Container(
            padding: const EdgeInsets.fromLTRB(75, 75, 75, 75),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Text(allDetailSkill![0]!.data[0].lvValue.toString()),
                  // Text(allDetailSkill![1]!.data[0].lvValue.toString()),
                  // Text(allDetailSkill![2]!.data[0].lvValue.toString()),
                  // Text(allDetailSkill![3]!.data[0].lvValue.toString()),
                  const Text("RESULT",
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
                  const SizedBox(height: 15),
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
                            MaterialPageRoute(builder: (context) => const Primary()));
                        },
                      child: const Text("Done"),
                    ),
                  ),
                ],
              ),
          ),
        ),
      )
    );
  }
}
