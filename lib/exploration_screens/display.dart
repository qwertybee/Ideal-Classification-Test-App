import 'package:flutter/material.dart';
import 'package:project_2/api/wage_major.dart';
import 'package:project_2/api/api_service.dart';

import '../api/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WageMajor? wageMajor;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    wageMajor = (await ApiService().getInfo());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: wageMajor == null
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: wageMajor!.data.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(wageMajor!.data[0].averageWage.toString()),
                    Text(wageMajor!.data[0].detailedOccupation),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}