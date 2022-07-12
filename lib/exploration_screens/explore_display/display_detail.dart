import 'package:flutter/material.dart';

class DisplayDetail extends StatefulWidget {
  final String title;
  final String category;
  final List<String> nav;
  const DisplayDetail({Key? key, required this.title, required this.category, required this.nav}) : super(key: key);

  @override
  State<DisplayDetail> createState() => _DisplayDetailState();
}

class _DisplayDetailState extends State<DisplayDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text("Employment title ${widget.title}\n"),
            Text(
                "Information on the businesses and industries that employs ${widget
                    .category}"),
            Text("Show education [0] ${widget.nav[0]}"),
            // Text("Show education [0] ${ApiService().getCategoriesWage(widget.nav[0])}"),
            // Text("Show skills [1] ${ApiService().getCategoriesWage(widget.nav[1])}"),
          ],
        ),
      ),
    );
  }
}