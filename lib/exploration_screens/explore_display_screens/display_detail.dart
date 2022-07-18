import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:project_2/api/category_api/cateDetail/detail_wage.dart';
import 'package:project_2/api/api_links.dart';

import '../../api/api_services.dart';
import '../../api/category_api/cateDetail/detail_edu.dart';
import '../../api/category_api/cateDetail/detail_skill.dart';

import 'package:multi_charts/multi_charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';
import 'package:intl/intl.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class DisplayDetail extends StatefulWidget {
  final String title;
  final String category;
  final List<String> nav;
  const DisplayDetail({Key? key, required this.title, required this.category, required this.nav}) : super(key: key);

  @override
  State<DisplayDetail> createState() => _DisplayDetailState();
}

class _DisplayDetailState extends State<DisplayDetail> {

  DetailEdu? detailEdu;
  DetailSkill? detailSkill;
  DetailWage? detailWage;
  int? avgSal;
  int? salDiff;
  SplayTreeMap<int, String>? topEduMajs;
  String? topSkill;
  double? topSkillVal;
  String? topSkillRca;
  double? topSkillRcaVal;
  String? moreLess;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    detailEdu = (await ApiService().getDetailEdu(widget.nav[0]));
    detailSkill = (await ApiService().getDetailSkill(widget.nav[1]));
    detailWage = (await ApiService().getDetailWage(ApiConstants.categoriesDetailWage[0]));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }


  void getAvgSalary() {
    if (detailWage != null) {
      String latestYr = detailWage!.data[0].year;
      int sumWage = 0;
      int count = 0;
      for (var eachWage in detailWage!.data) {
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
    if (detailWage != null) {
      int cateSal = detailWage!.data[0].averageWage.toInt();
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
    if (detailEdu != null) {
      String latestYr = detailEdu!.data[0].year;
      Map<int, String> allMajs = {};
      for (int i = 0; i < detailEdu!.data.length; i++) {
        if (detailEdu!.data[i].year == latestYr && detailEdu!=null) {
          allMajs[detailEdu!.data[i].totalPopulation] = detailEdu!.data[i].cip2;
        }
        else
          break;
      }
      final sorted = SplayTreeMap<int, String>.from
        (allMajs, (a, b) => a.compareTo(b));
      topEduMajs = sorted;
    }

  }

  void getMaxSkill() {
    if (detailSkill != null) {
      String latestYr = detailSkill!.data[0].year;
      double highestSkill = detailSkill!.data[0].lvValue.toDouble();
      double highestRca = detailSkill!.data[0].rca.toDouble();
      for (var eachSkill in detailSkill!.data) {
        if (eachSkill.year == latestYr) {
          if (eachSkill.lvValue > highestSkill) {
            topSkill = eachSkill.skillElement;
            topSkillVal = eachSkill.lvValue.toDouble();
          }
          if (eachSkill.rca > highestRca) {
            topSkillRcaVal = eachSkill.rca;
            topSkillRca = eachSkill.skillElement;
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
    late List<EduFrequency> eduFreq = getEduTreeMapData();
    List<YearlyWage>? yearlyWage = getYearlyWageBarChart();
    late TooltipBehavior toolTipBehaviorWage = TooltipBehavior(enable: true);
    List<SkillsGroupFreq>? skillsGroup = getSkillGroupPieChart();
    late TooltipBehavior tooltipBehaviorSkillsGroup = TooltipBehavior(enable: true);
    List<SkillsElemFreq>? skillsElem = getSkillsBarChart();
    late TooltipBehavior toolTipBehaviorSkillsElem = TooltipBehavior(enable: true);
    List<String>? skillsElemName = getSkillsNameRadarChart();
    List<double>? skillsElemVal = getSkillsValRadarChart();
    return Scaffold(
      body: (detailEdu == null || detailSkill == null || detailWage == null)
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Scaffold(
        body: Container(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
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
                  const SizedBox(height: 50,),
                  Text(
                    "About ${widget.title}\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text("Wage\n", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), // match title as well
                  Text("In ${detailWage!.data[0].year.toString()}, ${widget.title} earned an "
                      "average yearly salary of \$${detailWage!.data[0].averageWage.toStringAsFixed(2)},"
                      " \$${salDiff.toString()} ${moreLess} than the average"
                      "national salary of \$${avgSal}\n", style: TextStyle(fontSize: 16)), // match title as well
                  Text("This chart shows the various occupations closest to ${widget.title} as "
                      "measured by average annual salary in the US.\n", style: TextStyle(fontSize: 16)),
                  Text("Average annual salary in ${detailWage!.data[0].year}"),
                  Container(
                    height: 110,
                    child: SfCartesianChart(
                      tooltipBehavior: toolTipBehaviorWage,
                      // title: ChartTitle(text: "Average annual salary in ${detailWage!.data[0].year}"),
                      series: <ChartSeries>[
                        BarSeries<YearlyWage, String>(
                            name: "Average annual salary in ${detailWage!.data[0].year}",
                            dataSource: yearlyWage!,
                            xValueMapper: (YearlyWage val,_) => val.majGroup,
                            yValueMapper: (YearlyWage val,_) => val.wage,
                            dataLabelSettings: const DataLabelSettings(isVisible: true),
                            enableTooltip: true
                        )
                      ],
                      primaryXAxis: CategoryAxis(),
                      primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,
                          numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
                          title: AxisTitle(text: 'USD')),
                    ),
                  ),
                  Text("\nEducation\n",  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text("Data on higher education choices for ${widget.title} from The "
                      "Department of Education and Census Bureau. The most common major for "
                      "${widget.title} is ${eduFreq.last.majorName.toString()}, "
                      "but a relatively high number of ${widget.title} hold a major in "
                      "${eduFreq[eduFreq.length-2].majorName.toString()} as well.\n", style: TextStyle(fontSize: 16)),
                  const Text("Most Common & Specialized Majors:\n", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16)),
                  Text("1) ${eduFreq.last.majorName.toString()}\n"
                      "2) ${eduFreq[eduFreq.length-2].majorName.toString()}\n"
                      "3) ${eduFreq[eduFreq.length-3].majorName.toString()}\n"
                      "4) ${eduFreq[eduFreq.length-4].majorName.toString()}\n"
                      "5) ${eduFreq[eduFreq.length-5].majorName.toString()}\n", style: TextStyle(fontSize: 16)),
                  SfTreemap(
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
                                    'Year: ${detailEdu!.data[0].year}',
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

                  Text("\nSkills\n",  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), // match title as well
                  Text("Data on the critical and distinctive skills necessary for ${widget.title} "
                      "from the Bureau of Labor Statistics. ${widget.title} need many skills "
                      "but most especially ${topSkill.toString()} with a LV Value of ${topSkillVal?.toStringAsFixed(2)}.\n",
                      style: TextStyle(fontSize: 16)),
                  Text("The revealed comparative advantage (RCA), defined in "
                      "international economics for calculating the relative advantage or disadvantage "
                      "of a certain country in a certain class of goods or services as evidenced "
                      "by trade flows, shows that ${widget.title} "
                      "need more than the average amount of ${topSkillRca}. It has an RCA value of ${topSkillRcaVal?.toStringAsFixed(2)} "
                      "so ${topSkillRcaVal?.toStringAsFixed(2)} ${(topSkillRcaVal! > 1) ? "times more advantage" : "times more disadvantage"} "
                      "the average comparative advantage in global and domestic goods and services.\n",
                      style: TextStyle(fontSize: 16)),
                  SfCircularChart(
                    title: ChartTitle(text: "Skills Group Total LV Value in ${detailSkill!.data[0].year}"),
                    tooltipBehavior: tooltipBehaviorSkillsGroup,
                    series: <CircularSeries>[
                      PieSeries<SkillsGroupFreq, String>(
                        dataSource: skillsGroup,
                        xValueMapper: (SkillsGroupFreq data,_) => data.skillGroup,
                        yValueMapper: (SkillsGroupFreq data,_) => num.parse(data.skillFreq.toStringAsFixed(2)),
                        dataLabelSettings: const DataLabelSettings(isVisible: true),
                        enableTooltip: true,
                      )
                    ],
                  ),
                  // RadarChart(
                  //   values: skillsElemVal!,
                  //   labels: skillsElemName,
                  //   maxValue: 5,
                  //   fillColor: Colors.red,
                  //   chartRadiusFactor: 0.8,
                  //   // labelWidth: 1000,
                  // ),
                  SizedBox(
                    height: 600,
                    child: SfCartesianChart(
                      title: ChartTitle(text: "Skills Element in ${detailSkill!.data[0].year}"),
                      tooltipBehavior: toolTipBehaviorSkillsElem,
                      series: <ChartSeries>[
                        BarSeries<SkillsElemFreq, String>(
                            name: "Skills Element Value in ${detailSkill!.data[0].year}",
                            dataSource: skillsElem!,
                            xValueMapper: (SkillsElemFreq val,_) => val.skillName.substring(0,7),
                            yValueMapper: (SkillsElemFreq val,_) => num.parse(val.skillFreq.toStringAsFixed(2)),
                            pointColorMapper: (SkillsElemFreq val,_) => val.color,
                            dataLabelSettings: const DataLabelSettings(isVisible: true),
                            enableTooltip: true
                        )
                      ],
                      primaryXAxis: CategoryAxis(),
                      primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,
                          // numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
                          title: AxisTitle(text: 'LV Value')),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }

  List<String>? getSkillsNameRadarChart() {
    if (detailSkill != null) {
      List<String> skills = [];
      String latestYear = detailSkill!.data[0].year.toString();
      for (var eachSkill in detailSkill!.data) {
        if (latestYear == eachSkill.year) {
          skills.add(eachSkill.skillElement.toString());
        }
        else {
          break;
        }
      }
      return skills;
    }
    return null;
  }

  List<double>? getSkillsValRadarChart() {
    if (detailSkill != null) {
      List<double> skillsVal = [];
      String latestYear = detailSkill!.data[0].year.toString();
      for (var eachSkill in detailSkill!.data) {
        if (latestYear == eachSkill.year) {
          skillsVal.add(eachSkill.lvValue);
        }
        else {
          break;
        }
      }
      return skillsVal;
    }
    return null;
  }

  Color? getSkillsColor(String skillsGroupName) {
    // debugPrint(skillsGroupName);
    if (skillsGroupName == 'SkillElementGroup.CONTENT') return Colors.indigoAccent;
    else if (skillsGroupName == 'SkillElementGroup.PROCESS') return Colors.purple;
    else if (skillsGroupName == 'SkillElementGroup.SOCIAL_SKILLS') return Colors.redAccent;
    else if (skillsGroupName == 'SkillElementGroup.COMPLEX_PROBLEM_SOLVING_SKILLS') return Colors.orange;
    else if (skillsGroupName == 'SkillElementGroup.TECHNICAL_SKILLS') return Colors.lightGreen;
    else if (skillsGroupName == 'SkillElementGroup.SYSTEMS_SKILLS') return Colors.green;
    else if (skillsGroupName == 'SkillElementGroup.RESOURCE_MANAGEMENT_SKILLS') return Colors.deepPurple;
    else return null;
  }

  List<SkillsElemFreq>? getSkillsBarChart() {
    if (detailSkill != null) {
      List<SkillsElemFreq> skillFreq = [];
      String latestYear = detailSkill!.data[0].year.toString();
      for (var eachSkill in detailSkill!.data) {
        if (latestYear == eachSkill.year) {
          skillFreq.add(
              SkillsElemFreq(
                  eachSkill.skillElement,
                  eachSkill.lvValue.toDouble(),
                  getSkillsColor(eachSkill.skillElementGroup.toString()))
          );
        }
        else {
          break;
        }
      }
      return skillFreq;
    }
    return null;
  }

  List<SkillsGroupFreq>? getSkillGroupPieChart() {
    if (detailSkill != null) {
      List<SkillsGroupFreq> skillFreq = [];
      Map<String, double> skillGroup = {};
      String latestYear = detailSkill!.data[0].year.toString();
      for (var eachSkill in detailSkill!.data) {
        if (latestYear == eachSkill.year) {
          if (skillGroup.containsKey(eachSkill.skillElementGroup.toString())) {
            skillGroup[eachSkill.skillElementGroup.toString()] =
                eachSkill.lvValue.toDouble() + skillGroup[eachSkill.skillElementGroup.toString()]!;
          }
          else {
            skillGroup[eachSkill.skillElementGroup.toString()] = eachSkill.lvValue.toDouble();
          }
        }
        else {
          break;
        }
      }
      skillGroup.forEach((key, value) {
        skillFreq.add(SkillsGroupFreq(key, value));
      });
      return skillFreq;
    }
    return null;
  }

  List<YearlyWage>? getYearlyWageBarChart() {
    if (detailWage != null) {
      List<YearlyWage> yearlyChart = [];
      String latestYear = detailWage!.data[0].year.toString();
      for (var eachWage in detailWage!.data) {
        if (latestYear == eachWage.year) {
          if (eachWage.detailedOccupation == widget.title) {
            yearlyChart.add(YearlyWage(eachWage.detailedOccupation.substring(0,4), eachWage.averageWage.toInt()));
            break;
          }
        }
        else {
          break;
        }
      }
      return yearlyChart;
    }
    return null;
  }

  List<EduFrequency> getEduTreeMapData() {
    List<EduFrequency> treeMap = [];
    topEduMajs?.forEach((key, value) {
      treeMap.add(EduFrequency(value, detailEdu!.data[0].year, key));
    });
    return treeMap;
  }

}

class SkillsElemFreq {
  SkillsElemFreq(this.skillName, this.skillFreq, this.color);
  final String skillName;
  final double skillFreq;
  final Color? color;
}

class SkillsGroupFreq {
  SkillsGroupFreq(this.skillGroup, this.skillFreq);
  final String skillGroup;
  final double skillFreq;
}

class YearlyWage {
  YearlyWage(this.majGroup, this.wage);
  final String majGroup;
  final int wage;
}

class EduFrequency {
  EduFrequency(this.majorName, this.year, this.frequency);
  final String majorName;
  final String year;
  final int frequency;
}