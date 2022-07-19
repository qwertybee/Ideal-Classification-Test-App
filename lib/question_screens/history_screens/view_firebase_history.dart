import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class ViewFirebaseHistory extends StatefulWidget {
  const ViewFirebaseHistory({Key? key}) : super(key: key);
  State<ViewFirebaseHistory> createState() => _ViewFirebaseHistoryState();
}

class _ViewFirebaseHistoryState extends State<ViewFirebaseHistory>{

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('user_test_results').doc(
            FirebaseAuth.instance.currentUser?.uid)
            .collection("test_result").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
          if (streamSnapshot.data?.docs.length == 0) {
            return Container(
              color: Colors.white,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "No test results found!",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:SizedBox(
                          width: 300,
                          height: 40,
                          child: TextButton.icon(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(Colors.white),

                                backgroundColor: MaterialStateProperty.all(Color(0xFFEB5951)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                        side: const BorderSide(color: Color(0xFFEB5951))
                                    )
                                ),
                              ),
                              icon: Icon(Icons.arrow_back_ios_new_rounded),
                              label: Text(
                                'Go back',
                              ),
                              onPressed: () => Navigator.pop(context)
                          ),
                        ),
                      ),
                      ],
                ),
              ),
            );
          }
          else if(!streamSnapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: streamSnapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildResultCard(context, streamSnapshot.data?.docs.elementAt(index)));
        }
    );
  }

  Widget buildResultCard(BuildContext context, QueryDocumentSnapshot? data) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Row(children: <Widget>[
                  Text(
                    "Date: ",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(data?['date'], style: new TextStyle(fontSize: 15.0),),
                  Spacer(),
                  Icon(Icons.calendar_month_outlined),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Result: ",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(data?['result'], style: new TextStyle(fontSize: 15.0)),
                    Spacer(),
                    Icon(Icons.add_chart_rounded),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }




}

