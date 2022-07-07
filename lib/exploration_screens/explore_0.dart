import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Expanded(
      //     child: StaggeredGridView.countBuilder(
      //       padding: EdgeInsets.all(20),
      //         crossAxisCount: 2,
      //         itemCount: 5,
      //         crossAxisSpacing: 20,
      //         mainAxisSpacing: 20,
      //         itemBuilder: (context, index) {
      //           return Container(
      //             padding: EdgeInsets.all(20),
      //             height: index.isEven ? 200 : 240,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(16),
      //               color: Colors.purple,
      //               // PUT IMAGES HERE
      //             ),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 // TEXT DATA HERE 5:30
      //               ],
      //             ),
      //           );
      //         },
      //         staggeredTileBuilder: (index) => StaggeredTile.fit(1))
      // )
    );
  }
}
