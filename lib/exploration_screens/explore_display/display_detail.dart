import 'package:flutter/material.dart';

import '../../api/api_service.dart';
import '../../api/category_api/cateDetail/detail_edu.dart';
import '../../api/category_api/cateDetail/detail_skill.dart';

class DisplayDetail extends StatefulWidget {
  final String title;
  final String category;
  final List<String> nav;
  const DisplayDetail({Key? key, required this.title, required this.category, required this.nav}) : super(key: key);

  @override
  State<DisplayDetail> createState() => _DisplayDetailState();
}

class _DisplayDetailState extends State<DisplayDetail> {

  late DetailEdu? detailEdu;
  late DetailSkill? detailSkill;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    detailEdu = (await ApiService().getDetailEdu(widget.nav[0]));
    detailSkill = (await ApiService().getDetailSkill(widget.nav[1]));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (detailEdu == null || detailSkill == null)
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text("Employment title ${widget.title}\n"),
            Text("Information on the businesses and industries that employs ${widget.category}"),
            Text("Show education [0] ${detailEdu!.data[0].yocpopRca.toString()}"),
            Text("Show skills [1] ${detailSkill!.data[0].idSkillElement.toString()}"),
          ],
        ),
      ),
    );
  }
}