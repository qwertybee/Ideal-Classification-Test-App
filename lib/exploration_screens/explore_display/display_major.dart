import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_2/api/category_api/cateMajor/major_edu.dart';
import 'package:project_2/api/category_api/cateMajor/major_skill.dart';
import 'package:project_2/api/category_api/wage_cat.dart';

import '../../api/api_service.dart';
import '../../api/constants.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

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
      salDiff = (avgSal! - cateSal).abs();
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
      // debugPrint(sorted.toString()); // allMajs.last[0] should be the highest
      topEduMajs = sorted;
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

  // List<> getCircularData() {
  //
  // }

  @override
  Widget build(BuildContext context) {
    getAvgSalary();
    moreOrLess();
    getTopMajs();
    getMaxSkill();
    late List<EduFrequency> eduFreq = getTreeMapData();
    return Scaffold(
      body: (majEdu == null || majSkill == null || wageCat == null)
          // || avgSal == null || salDiff == null || topEduMajs == null ||
      // topSkill == null || topSkillVal == null || moreLess == null)
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // NOTE WE MANUALLY ADD INDEX OF WHERE CATEGORY IS IN API
                const SizedBox(height: 100,),
                Text("YEARLY WAGES\n"), // match title as well
                Text("In ${wageCat!.data[0].year.toString()}, ${widget.title} earned an "
                    "average yearly salary of ${wageCat!.data[0].averageWage.toString()},"
                    " ${salDiff.toString()} ${moreLess} than the average"
                    "national salary of ${avgSal}\n"), // match title as well
                Text("This chart shows the various occupations closest to ${widget.title} as "
                    "measured by average annual salary in the US.\n"),
                Text("SHOW YEARLY WAGE BAR CHART HEREEEEE\n"),
                SfCartesianChart(),
                Text("EDUCATION\n"),
                Text("Data on higher education choices for ${widget.title} from The"
                    "Department of Education and Census Bureau. The most common major for"
                    "${widget.title} is ${eduFreq.last.majorName.toString()}.\n"),
                // "but a relatively high number of ${widget.title} hold a major in ...\n"),
                Text("TOP 5 MOST COMMON & SPECIALIZED MAJORS:"),
                Text("1) ${eduFreq.last.majorName.toString()}\n"
                    "2) ${eduFreq[eduFreq.length-2].majorName.toString()}\n"
                    "3) ${eduFreq[eduFreq.length-3].majorName.toString()}\n"
                    "4) ${eduFreq[eduFreq.length-4].majorName.toString()}\n"
                    "5) ${eduFreq[eduFreq.length-5].majorName.toString()}\n"),
                Container(
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.all(10),
                  child: SfTreemap(
                      dataCount: eduFreq.length,
                      levels: [
                        TreemapLevel(
                            groupMapper: (int index) {
                              return eduFreq[index].majorName;
                            },
                            labelBuilder: (BuildContext context, TreemapTile tile) {
                              return Padding(
                                  padding: const EdgeInsets.all(2.5),
                                  child: Text(tile.group)
                              );
                            },
                            tooltipBuilder: (BuildContext context, TreemapTile tile) {
                              return Padding(padding: const EdgeInsets.all(2.5),
                                child: Text('Bachelor Degree: ${tile.group}\n'
                                    'People in workforce: ${tile.weight}\n'
                                    'Year: ${majEdu!.data[0].year}',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              );
                            }
                        )
                      ],
                      weightValueMapper: (int index) {
                        return eduFreq[index].frequency.toDouble();
                      }
                  ),
                ),


                Text("SKILLS ${majSkill!.data[0].lvValue.toString()}\n"), // match title as well
                Text("Data on the critical and distinctive skills necessary for ${widget.title}"
                    "from the Bureau of Labor Statistics. ${widget.title} need many skills"
                    "but most especially ${topSkill.toString()}\n"),
                Text("The revealed comparative advantage (RCA) shows that ${widget.title}"
                    "need more than the average amount of .... and .....\n"),
              ],
            ),
          )
        ),
      ),
    );
  }

  List<EduFrequency> getTreeMapData() {
    List<EduFrequency> treeMap = [];
    topEduMajs?.forEach((key, value) {
      treeMap.add(EduFrequency(value, majEdu!.data[0].year, key));
    });
    // debugPrint("TREEMAP HEREEEE\n");
    // debugPrint(treeMap[2].majorName.toString());
    return treeMap;
  }
}

class YearlyWage {

}

class EduFrequency {
  EduFrequency(this.majorName, this.year, this.frequency);

  final String majorName;
  final String year;
  final int frequency;
}