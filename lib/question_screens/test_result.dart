import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_2/question_screens/display_questions.dart';
import 'package:project_2/question_screens/questions.dart';

import '../api/api_services.dart';
import '../api/category_api/cateDetail/detail_skill.dart';
import '../primary.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TestResult extends StatefulWidget {
  const TestResult({Key? key}) : super(key: key);

  @override
  State<TestResult> createState() => _TestResultState();
}

class _TestResultState extends State<TestResult> {
  List<DetailSkill?>? allDetailSkill;
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    allDetailSkill = (await ApiService().getAllDetailSkill());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  Future<void> getTestResult() async {
    final SharedPreferences prefs = await _prefs;
    List<List<int>> lstVariance = [];
    for (var eachDetailSkill in allDetailSkill!) {
      List<int> variance = [];
      for (int i = 0; i < Questionnaires.lstQuestions.length; i++) {
        // there's 35 skills to compare in each occupation
        // variance = user's 35 skills between each skill's lv value
        String eachUserSkillVal = prefs.getString(i.toString()) ?? '0';
        if (i == Questionnaires.lstQuestions.length-1) {
          // when last element

        }
        debugPrint(eachUserSkillVal);
      }
      lstVariance.add(variance);
    }
    // get API for skills in detailed occupation
    // get difference/variance of each occupation's skills
    // get average of all variance
    // lowest variance is the result
  }


  @override
  Widget build(BuildContext context) {
    late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    late String userResult;


    // Future<void> _clearPref() async { // clear all data from sharedPrefs
    //   final SharedPreferences prefs = await _prefs;
    //   await prefs.clear();
    // }

    // if function is not async, no need for await when accessing its return value
    getTestResult();
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
