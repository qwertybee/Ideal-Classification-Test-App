import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_2/question_screens/SharedPrefUtils.dart';
import 'package:project_2/question_screens/history_screens/view_firebase_history.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../test_result.dart';



class ViewHistory extends StatefulWidget {
  const ViewHistory({Key? key}) : super(key: key);
  State<ViewHistory> createState() => _ViewHistoryState();
}

class _ViewHistoryState extends State<ViewHistory> {

  @override
  Widget build(BuildContext context) {
    // show latest result of test only (no need to be list), if there doesn't exist result
    // text "Oops! No test history found"
    // picture of error from storyset.com
    // just have button to 'take test now' below it
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ViewFirebaseHistory();
          } else {
            return TestResult();
          }
        },
      ),
    );
  }


  Widget ViewLocalHistory(BuildContext context) {
    final _result = 'result';
    final _date = SharedPrefUtils.readPrefStr('date');

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      contentPadding: EdgeInsets.only(
        top: 10.0,
      ),
      title: Text(
        "Change user details",
        style: TextStyle(fontSize: 24.0),
      ),
      content:
      Container(
        height: 450,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Last result: {$_result}",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Last result: {$_date}",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),

                      backgroundColor: MaterialStateProperty.all(
                          Color(0xFFEB5951)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: const BorderSide(color: Color(0xFFEB5951))
                          )
                      )
                  ),
                  child: Text(
                    "Close",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
