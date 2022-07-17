import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_2/question_screens/history_screens/view_firebase_history.dart';
import 'package:project_2/question_screens/history_screens/view_local_history.dart';



class ViewHistory extends StatefulWidget {
  const ViewHistory({Key? key}) : super(key: key);
  State<ViewHistory> createState() => _ViewHistoryState();
}

class _ViewHistoryState extends State<ViewHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ViewFirebaseHistory();
          } else {
            return ViewLocalHistory();
          }
        },
      ),
    );
  }
}
