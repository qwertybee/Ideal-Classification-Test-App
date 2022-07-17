import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_2/question_screens/history_screens/viewHistoryController.dart';
import 'package:project_2/question_screens/questions.dart';

class TestIntro extends StatelessWidget {
  const TestIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(75, 50, 75, 20),
            child: Column(
              children: [
                Text("BE YOU",
                style: TextStyle(
                  fontSize: 37,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const Text(
                  "Welcome to Be You, where you can find your perfect job!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Lottie.network(
                    "https://assets5.lottiefiles.com/private_files/lf30_ppdduhse.json",
                  // repeat: true,
                ),
              ],
            ),
          ),
          const Text(
            "Only takes 10 minutes\n",
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.blueGrey),
          ),
          SizedBox(
            width: 300,
            height: 40,
            child: TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                        )
                    )
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Questions()));
                  },
                child: const Text("Take Test"),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: 300,
            height: 40,
            child: TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                      )
                  )
              ),
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewHistory()));
              },
              child: const Text("View Test History"),
            ),
          ),
        ],
      ),
    );
  }
}
