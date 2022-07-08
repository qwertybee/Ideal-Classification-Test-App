import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Test0 extends StatelessWidget {
  const Test0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: SvgPicture.asset("images/splash_bg.svg", width: MediaQuery.of(context).size.width),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 150,),
                  SvgPicture.asset("images/test-header-2.svg", width: 150, height: 150,),
                  Text("Complete the Test",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text("Be yourself and answer honestly to find \nyour personality type.",
                    style: TextStyle(color: Colors.white, ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30,),
                  SvgPicture.asset("images/theory.svg", width: 150, height: 130,),
                  Text("View Your Results",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text("Learn how your skills influences many areas\n of your life.",
                    style: TextStyle(color: Colors.white,),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
