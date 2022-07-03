import 'package:flutter/material.dart';
import 'package:project_2/exploration_screens/explore.dart';
import 'package:project_2/primary.dart';
import 'package:project_2/profile_screens/profile.dart';
import 'package:project_2/question_screens/test_intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Primary(),
    );
  }
}