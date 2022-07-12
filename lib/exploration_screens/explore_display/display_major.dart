import 'package:flutter/material.dart';
import 'package:project_2/api/category_api/cateMajor/major_edu.dart';
import 'package:project_2/api/category_api/cateMajor/major_skill.dart';
import 'package:project_2/api/category_api/wage_cat.dart';

import '../../api/api_service.dart';
import '../../api/constants.dart';

class DisplayMajor extends StatefulWidget {
  final String title;
  final String category; // category is the tag
  final List<String> nav; // nav is location of info [0] edu [1] skills
  const DisplayMajor({Key? key, required this.title, required this.category, required this.nav}) : super(key: key);

  @override
  State<DisplayMajor> createState() => _DisplayMajorState();
}

class _DisplayMajorState extends State<DisplayMajor> {
  late MajEdu? majEdu;
  late MajSkill? majSkill;
  late WageCat? wageCat;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    majEdu = (await ApiService().getMajorEdu(widget.nav[0]));
    majSkill = (await ApiService().getMajorSkill(widget.nav[1]));
    wageCat = (await ApiService().getCategoriesWage(ApiConstants.categoriesMajorWage[0]));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (majEdu == null || majSkill == null || wageCat == null)
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text("EMPLOYMENT ${widget.title}\n"),
            Text("Information on the businesses and industries that employs ${widget.title} and locations for those in the field."),
            Text("WAGES ${wageCat!.data[0].averageWage.toString()}"),
            Text("Show education [0] ${majEdu!.data[0].yocpopRca.toString()}"),
            Text("Show skills [1] ${majSkill!.data[0].lvValue.toString()}"),
          ],
        ),
      ),
    );
  }
}