import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:project_2/api/category_api/cateMajor/major_edu.dart';
import 'package:project_2/api/category_api/cateMajor/major_skill.dart';
import 'package:project_2/api/category_api/wage_cat.dart';

import '../../api/api_service.dart';
import '../../api/constants.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DisplayMajor extends StatefulWidget {
  final String title;
  final String category; // category is the tag
  final List<String> nav; // nav is location of info [0] edu [1] skills
  const DisplayMajor({Key? key, required this.title, required this.category, required this.nav}) : super(key: key);

  @override
  State<DisplayMajor> createState() => _DisplayMajorState();
}

class _DisplayMajorState extends State<DisplayMajor> {
  MajEdu? majEdu;
  MajSkill? majSkill;
  WageCat? wageCat;
  int? avgSal;
  int? salDiff;
  SplayTreeMap<int, String>? topEduMajs;
  String? topSkill;
  int? topSkillVal;
  String? moreLess;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    majEdu = (await ApiService().getMajorEdu(widget.nav[0]));
    majSkill = (await ApiService().getMajorSkill(widget.nav[1]));
    wageCat = (await ApiService().getCategoriesWage(ApiConstants.categoriesMajorWage[0]));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void getAvgSalary() {
    if (wageCat != null) {
      String latestYr = wageCat!.data[0].year;
      int sumWage = 0;
      int count = 0;
      for (var eachWage in wageCat!.data) {
        if (eachWage.year == latestYr) {
          sumWage += eachWage.averageWage.toInt();
          count++;
          continue;
        }
        else {
          break;
        }
      }
      avgSal = (sumWage/count).toInt();
    }

  }

  void moreOrLess() {
    if (wageCat != null) {
      int cateSal = wageCat!.data[0].averageWage.toInt();
      salDiff = (avgSal! - cateSal);
      if (avgSal! > cateSal) {
        moreLess = "more";
      }
      else {
        moreLess = "less";
      }
    }
  }

  void getTopMajs() {
    if (majEdu != null) {
      String latestYr = majEdu!.data[0].year;
      // List<List<int>> allMajs = [];
      Map<int, String> allMajs = {};
      for (int i = 0; i < majEdu!.data.length; i++) {
        if (majEdu!.data[i].year == latestYr && majEdu!=null) {
          // List<int> temp = [];
          allMajs[majEdu!.data[i].totalPopulation] = majEdu!.data[i].cip2;
          // temp.add(majEdu!.data[i].totalPopulation);
          // temp.add(majEdu!.data[i].cip2);
          // allMajs.add(temp);
        }
        else
          break;
      }
      // final sorted = allMajs.values.toList()..sort();
      final sorted = SplayTreeMap<int, String>.from
        (allMajs, (a, b) => a.compareTo(b));
      debugPrint(sorted.toString()); // allMajs.last[0] should be the highest
      topEduMajs = sorted as SplayTreeMap<int, String>?;
    }

  }

  void getMaxSkill() {
    if (majSkill != null) {
      String latestYr = majSkill!.data[0].year;
      int highestSkill = majSkill!.data[0].lvValue.toInt();
      for (var eachSkill in majSkill!.data) {
        if (eachSkill.year == latestYr) {
          if (eachSkill.lvValue > highestSkill) {
            topSkill = eachSkill.skillElement;
            topSkillVal = eachSkill.lvValue.toInt(); // highestSkill == eachSkill.lvValue
          }
        }
        else {
          break;
        }
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    getAvgSalary();
    moreOrLess();
    getTopMajs();
    getMaxSkill();
    return Scaffold(
      body: (majEdu == null || majSkill == null || wageCat == null)
          // || avgSal == null || salDiff == null || topEduMajs == null ||
      // topSkill == null || topSkillVal == null || moreLess == null)
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            // NOTE WE MANUALLY ADD INDEX OF WHERE CATEGORY IS IN API
            SizedBox(height: 100,),
            Text("YEARLY WAGES ${wageCat!.data[0].averageWage.toString()}\n"), // match title as well
            Text("In ${wageCat!.data[0].year.toString()}, ${widget.title} earned an average yearly salary"
                "of ${wageCat!.data[0].averageWage.toString()},"
                " ${salDiff.toString()} ${moreLess} than the average"
                "national salary of ${avgSal}\n"), // match title as well
            Text("This chart shows the various occupations closest to ${widget.title} as "
                "measured by average annual salary in the US.\n"),
            Text("SHOW YEARLY WAGE CHART HEREEEEE\n"),

            Text("EDUCATION ${majEdu!.data[0].yocpopRca.toString()}\n"),
            Text("Data on higher education choices for ${widget.title} from The"
                "Department of Education and Census Bureau. The most common major for"
                "${widget.title} is ${topEduMajs.toString()}"),
                // "but a relatively high number of ${widget.title} hold a major in ...\n"),
            Text("MOST COMMON & SPECIALIZED MAJORS:\n"),
            Text("${topEduMajs.toString()}",),
            // Text("MOST SPECIALIZED MAJORS:\n"),

            Text("SKILLS ${majSkill!.data[0].lvValue.toString()}\n"), // match title as well
            Text("Data on the critical and distinctive skills necessary for ${widget.title}"
                "from the Bureau of Labor Statistics. ${widget.title} need many skills"
                "but most especially ${topSkill.toString()}\n"),
            Text("The revealed comparative advantage (RCA) shows that ${widget.title}"
                "need more than the average amount of .... and .....\n"),
          ],
        ),
      ),
    );
  }
}