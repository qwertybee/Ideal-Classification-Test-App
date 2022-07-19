import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_2/exploration_screens/explore_categories.dart';
import 'package:project_2/exploration_screens/explore_display_screens/display_detail.dart';
import 'package:project_2/providers/user_provider.dart';
import 'package:project_2/question_screens/display_questions.dart';
import 'package:project_2/question_screens/questions.dart';
import 'package:project_2/shared.dart';
import 'package:provider/provider.dart';

import '../api/api_links.dart';
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
  int indexOfDetailOcc = 0;

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
    if (allDetailSkill != null) {
      double leastVar = 1000;
      String currLeastVar = "";
      for (var eachDetailSkill in allDetailSkill!) {
        double sumDiff = 0;
        indexOfDetailOcc = 0;
        for (int i = 0; i < Questionnaires.lstQuestions.length; i++) {
          int eachUserSkillVal = context.read<UserProvider>().userSkillVals[i] ?? 0;
          sumDiff += (eachDetailSkill!.data[i].lvValue - eachUserSkillVal);
          if (i == Questionnaires.lstQuestions.length-1) {
            if (sumDiff < leastVar) {
              leastVar = sumDiff;
              currLeastVar = categoriesDetail[indexOfDetailOcc].name;
            }
          }
        }
        indexOfDetailOcc++;
      }
      indexOfDetailOcc--;
      userResult = currLeastVar;
    }
  }


  @override
  Widget build(BuildContext context) {
    getTestResult();
    return Scaffold(
      body: (allDetailSkill == null || userResult == null)
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(75, 110, 75, 50),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("RESULT",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        "\n$userResult\n",
                      style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blueGrey
                      ),
                    ),
                    Lottie.network(
                      "https://assets9.lottiefiles.com/private_files/lf30_qam8tww4.json",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                        )
                    )
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => getResultRedirection()));                },
                child: Text("More about $userResult"),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 300,
              height: 40,
              child: TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                        )
                    )
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Questions()));
                  },
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
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
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
      )
    );
  }

  getResultRedirection() {
    return DisplayDetail(title: categoriesDetail[indexOfDetailOcc].name,
        category: "Detailed Occupation Group",
        nav: ApiConstants.cateDetailInfo[indexOfDetailOcc]
    );
  }
}
