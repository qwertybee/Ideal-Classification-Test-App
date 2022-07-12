import 'package:flutter/material.dart';
import 'package:project_2/api/constants.dart';
import 'package:project_2/api/category_api/wage_cat.dart';
import 'package:project_2/api/api_service.dart';

import '../api/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WageCat? wageCat;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    wageCat = (await ApiService().getCategoriesWage(ApiConstants.categoriesMajorWage[0]));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: wageCat == null
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: wageCat!.data.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(wageCat!.data[0].averageWage.toString()),
                    Text(wageCat!.data[0].idMajorOccupationGroup),
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