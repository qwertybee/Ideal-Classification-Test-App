import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_2/question_screens/questions.dart';

class TestIntro extends StatelessWidget {
  const TestIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(75, 75, 75, 75),
            child: Column(
              children: [
                Text("BE YOU",
                style: TextStyle(
                  fontSize: 37,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const Text("Welcome to Be You, where you can find your perfect job!"),
                Lottie.network(
                    "https://assets5.lottiefiles.com/private_files/lf30_ppdduhse.json",
                  // repeat: true,
                ),
              ],
            ),
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
                            side: BorderSide(color: Colors.purple)
                        )
                    )
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Questions()));                },
                child: const Text("Take Test"),
            ),
          ),
        ],
      ),
    );
  }
}
