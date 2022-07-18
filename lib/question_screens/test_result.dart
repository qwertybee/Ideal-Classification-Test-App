import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_2/exploration_screens/explore_categories.dart';
import 'package:project_2/question_screens/display_questions.dart';
import 'package:project_2/question_screens/questions.dart';
import 'package:project_2/shared.dart';

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
  String? userResult = "";

  @override
  void initState() {
    super.initState();
    _getData();
    getTestResult();
  }

  void _getData() async {
    allDetailSkill = (await ApiService().getAllDetailSkill());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  // Future<void> saveResultToFirebase() async {
  //   final SharedPreferences prefs = await _prefs;
  //   for (int i = 0; i < Questionnaires.lstQuestions.length; i++) {
  //     String eachUserSkillVal = prefs.getString(i.toString()) ?? '0';
  //     // sth like this using prefs.getStuff() like dictionary
  //   }
  // }

  Future<void> getTestResult() async {
    double leastVar = 1000;
    String currLeastVar = "";
    for (var eachDetailSkill in allDetailSkill!) {
      debugPrint(SharedPrefUtils.readPrefInt(0.toString()));
      double sumDiff = 0;
      int count = 0;
      for (int i = 0; i < Questionnaires.lstQuestions.length; i++) {
        int eachUserSkillVal = SharedPrefUtils.readPrefInt(i.toString()) ?? 0;
        debugPrint("index with value of $eachUserSkillVal");
        sumDiff += (eachUserSkillVal - eachDetailSkill!.data[i].lvValue).abs();
        debugPrint("val of sumDiff $sumDiff");
        if (i == Questionnaires.lstQuestions.length-1) {
          if (sumDiff < leastVar) {
            leastVar = sumDiff;
            currLeastVar = categoriesDetail[count].name;
            debugPrint("done with count $count with result as $currLeastVar");
          }
        }
      }
      count++;
    }
    userResult = currLeastVar;
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
                  Text("result is here ${userResult.toString()}"),
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
