import 'package:flutter/material.dart';
import 'package:project_2/api/category_api/cateMinor/minor_edu.dart';
import 'package:project_2/api/category_api/cateMinor/minor_wage.dart';

import '../../api/api_service.dart';
import '../../api/category_api/cateMinor/minor_skill.dart';
import '../../api/constants.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DisplayMinor extends StatefulWidget {
  final String title;
  final String category;
  final List<String> nav;
  const DisplayMinor({Key? key, required this.title, required this.category, required this.nav}) : super(key: key);

  @override
  State<DisplayMinor> createState() => _DisplayMinorState();
}

class _DisplayMinorState extends State<DisplayMinor> {

  late MinorEdu? minorEdu;
  late MinorSkill? minorSkill;
  late MinorWage? minorWage;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    minorEdu = (await ApiService().getMinorEdu(widget.nav[0]));
    minorSkill = (await ApiService().getMinorSkill(widget.nav[1]));
    minorWage = (await ApiService().getMinorWage(ApiConstants.categoriesMinorWage[0]));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (minorEdu == null || minorSkill == null || minorWage == null)
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text("Employment title ${widget.title}\n"),
            Text("Information on the businesses and industries that employs ${widget.category}"),
            Text("WAGES ${minorWage!.data[0].averageWage.toString()}"),
            Text("Show education [0] ${minorEdu!.data[0].yocpopRca.toString()}"),
            Text("Show skills [1] ${minorSkill!.data[0].year.toString()}"),
          ],
        ),
      ),
    );
  }
}