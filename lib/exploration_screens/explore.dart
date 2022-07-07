import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            SizedBox(height: 30),
            Text("Hey dipshit"),
            Text("Discover jobs you want to know more"),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Text("Search"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Category"),
              ],
            ),
            SizedBox(height: 30),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 24,
                    child: Stack(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Major Group",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                            child: Container(
                              margin: EdgeInsets.only(right: 20),
                              height: 7,
                              color: Colors.green.withOpacity(0.2),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
