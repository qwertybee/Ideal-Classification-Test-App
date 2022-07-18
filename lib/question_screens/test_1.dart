import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_2/shared.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Test1 extends StatefulWidget {
  final String question;
  final int index;
  const Test1({Key? key, required this.question, required this.index}) : super(key: key);

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  int scale = 0;
  int group = 1;
  // late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    SharedPrefUtils.saveInt(widget.index.toString(), scale);
  }

  // Future<void> _storeValue() async {
  //   final SharedPreferences prefs = await _prefs;
  //   debugPrint("index of current page ${widget.index}");
  //   debugPrint("current value is " + scale.toString());
  //   prefs.setInt(widget.index.toString(), scale);
  //   debugPrint("given value ${prefs.getInt((widget.index-1).toString())}");
  // }

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
                    const SizedBox(height: 150,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                      child:
                      Text("${widget.question}.",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(50.0, 65.0, 50.0, 30.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text('Strongly Agree'),
                            leading: Radio(
                              value: 2,
                              groupValue: scale,
                              onChanged: (val) {
                                setState(() {
                                  scale = val as int;
                                  SharedPrefUtils.saveInt(widget.index.toString(), scale);
                                  // debugPrint(scale.toString());
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          ListTile(
                            title: const Text('Agree'),
                            leading: Radio(
                              value: 1,
                              groupValue: scale,
                              onChanged: (val) {
                                setState(() {
                                  scale = val as int;
                                  SharedPrefUtils.saveInt(widget.index.toString(), scale);
                                  // debugPrint(scale.toString());
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          ListTile(
                            title: const Text('Neutral'),
                            leading: Radio(
                              value: 0,
                              groupValue: scale,
                              onChanged: (val) {
                                setState(() {
                                  scale = val as int;
                                  SharedPrefUtils.saveInt(widget.index.toString(), scale);
                                  SharedPrefUtils.readPrefInt((widget.index-1).toString());
                                  // debugPrint(scale.toString());
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          ListTile(
                            title: const Text('Disagree',),
                            leading: Radio(
                              value: -1,
                              groupValue: scale,
                              onChanged: (val) {
                                setState(() {
                                  scale = val as int;
                                  SharedPrefUtils.saveInt(widget.index.toString(), scale);
                                  // debugPrint(scale.toString());
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          ListTile(
                            title: const Text('Strongly Disagree'),
                            leading: Radio(
                              value: -2,
                              groupValue: scale,
                              onChanged: (val) {
                                setState(() {
                                  scale = val as int;
                                  SharedPrefUtils.saveInt(widget.index.toString(), scale);
                                  // debugPrint(scale.toString());
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
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
