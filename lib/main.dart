import 'package:flutter/material.dart';
import 'package:project_2/primary.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_2/exploration_screens/display.dart';
import 'package:project_2/exploration_screens/explore_select.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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