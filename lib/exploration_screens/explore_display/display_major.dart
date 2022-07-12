import 'package:flutter/material.dart';

class DisplayMajor extends StatefulWidget {
  final String title;
  final String category; // category is the tag
  final List<String> nav; // nav is location of info [0] edu [1] skills
  const DisplayMajor({Key? key, required this.title, required this.category, required this.nav}) : super(key: key);

  @override
  State<DisplayMajor> createState() => _DisplayMajorState();
}

class _DisplayMajorState extends State<DisplayMajor> {
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