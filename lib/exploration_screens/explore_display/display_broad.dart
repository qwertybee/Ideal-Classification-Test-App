import 'package:flutter/material.dart';
import 'package:project_2/api/category_api/cateBroad/broad_edu.dart';
import 'package:project_2/api/category_api/cateBroad/broad_wage.dart';
import 'package:project_2/api/category_api/wage_cat.dart';

import '../../api/api_service.dart';
import '../../api/category_api/cateBroad/broad_skill.dart';
import '../../api/category_api/cateMajor/major_wage.dart';
import '../../api/constants.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DisplayBroad extends StatefulWidget {
  final String title;
  final String category;
  final List<String> nav;
  const DisplayBroad({Key? key, required this.title, required this.category, required this.nav}) : super(key: key);

  @override
  State<DisplayBroad> createState() => _DisplayBroadState();
}

class _DisplayBroadState extends State<DisplayBroad> {
  late BroadEdu? broadEdu;
  late BroadSkill? broadSkill;
  late BroadWage? broadWage;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    broadEdu = (await ApiService().getBroadEdu(widget.nav[0]));
    broadSkill = (await ApiService().getBroadSkill(widget.nav[1]));
    broadWage = (await ApiService().getBroadWage(ApiConstants.categoriesBroadWage[0]));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (broadEdu == null || broadSkill == null || broadWage == null)
          ? const Center(
        child: CircularProgressIndicator(),
      )
      : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text("Employment title ${widget.title}\n"),
            Text("Information on the businesses and industries that employs ${widget.category}"),
            Text("WAGES ${broadWage!.data[0].averageWage.toString()}"),
            Text("Show education [0] ${broadEdu!.data[0].yocpopRca.toString()}"),
            Text("Show skills [1] ${broadSkill!.data[0].idSkillElement.toString()}"),
          ],
        ),
      ),
    );
  }
}
