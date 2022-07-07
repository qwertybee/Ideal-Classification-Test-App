import 'package:flutter/material.dart';
import 'package:project_2/api/wage_sales.dart';
import 'package:project_2/api/api_service.dart';

import '../api/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WageSales? wageSales;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    wageSales = (await ApiService().getUsers());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: wageSales == null
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: wageSales!.data.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(wageSales!.data[0].averageWage.toString()),
                    Text(wageSales!.data[0].detailedOccupation),
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
//
// int getColNames(WageSales wageSales) {
//   wageSales!.data[0]
// }