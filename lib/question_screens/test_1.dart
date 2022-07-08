import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: SvgPicture.asset("images/bg.svg", width: MediaQuery.of(context).size.width),
          ),
          SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 150,),

                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
