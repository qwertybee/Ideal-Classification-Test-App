import 'package:flutter/material.dart';
import 'package:project_2/exploration_screens/body.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffce93d8),
        toolbarHeight: 100,
      ),
      body: Body(),
    );
  }
}
