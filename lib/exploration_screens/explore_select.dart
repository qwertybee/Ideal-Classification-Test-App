import 'package:flutter/material.dart';
import 'package:project_2/api/api_service.dart';
import 'package:project_2/api/constants.dart';

import '../api/wage_cat.dart';

class ExploreSelect extends StatefulWidget {
  final String title;
  final String category;
  final String nav;
  const ExploreSelect({Key? key,
  required this.title, required this.category, required this.nav}) : super(key: key);

  @override
  State<ExploreSelect> createState() => _ExploreSelectState();
}


class _ExploreSelectState extends State<ExploreSelect> {
  late WageCat? cat;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    cat = (await ApiService().getCategoriesWage(ApiConstants.categoriesMajorWage[0]));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text("Employment title ${widget.title}\n"),
            Text("Information on the businesses and industries that employs ${widget.category}"),
            Text("Show education [0] ${ApiService().getCategoriesWage(widget.nav[0])}"),
            Text("Show skills [1] ${ApiService().getCategoriesWage(widget.nav[1])}"),
          ],
        ),
      ),
    );
  }
}