import 'package:flutter/material.dart';

class ExploreSelect extends StatefulWidget {
  const ExploreSelect({Key? key}) : super(key: key);

  @override
  State<ExploreSelect> createState() => _ExploreSelectState();
}

class _ExploreSelectState extends State<ExploreSelect> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}